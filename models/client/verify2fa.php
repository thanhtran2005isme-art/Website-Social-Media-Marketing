<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
header('Content-Type: application/json');
const MAX_2FA_ATTEMPTS = 5; // Maximum 2FA attempts
const TWO_FA_LOCKOUT_DURATION = 15 * 60; // 15 minutes (in seconds)
use PragmaRX\Google2FA\Google2FA;

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    die(JsonMsg('error', 'Phương thức yêu cầu không hợp lệ!'));
}

$user_id = Anti_xss($_POST['user_id']);
$totp_code = Anti_xss($_POST['totp_code']);

if (empty($user_id) || empty($totp_code) || !preg_match('/^\d{6}$/', $totp_code)) {
    die(JsonMsg('error', 'Mã TOTP hoặc ID người dùng không hợp lệ!'));
}

if (!isset($_SESSION['2fa_user_id'])) {
    die(JsonMsg('error', 'Phiên xác thực không hợp lệ, vui lòng tải lại trang!'));
}
if ($user_id != $_SESSION['2fa_user_id']) {
    die(JsonMsg('error', 'Phiên xác thực không hợp lệ, vui lòng tải lại trang!'));
}

$user = $db->get_row("SELECT id, username, two_fa_code, two_fa_attempts, two_fa_lockout_time FROM users WHERE id = " . (int)$user_id);
if (!$user || empty($user['two_fa_code'])) {
    die(JsonMsg('error', 'Không tìm thấy người dùng hoặc khóa 2FA!'));
}

if ($user['two_fa_lockout_time'] !== null && (time() < strtotime($user['two_fa_lockout_time']) + TWO_FA_LOCKOUT_DURATION)) {
    $remainingTime = (strtotime($user['two_fa_lockout_time']) + TWO_FA_LOCKOUT_DURATION - time()) / 60;
    die(JsonMsg('error', "Tài khoản 2FA bị khóa. Vui lòng thử lại sau " . ceil($remainingTime) . " phút!"));
}

$google2fa = new Google2FA();
if (!$google2fa->verifyKey($user['two_fa_code'], $totp_code)) {
    $twoFaAttempts = $user['two_fa_attempts'] + 1;

    // Update two_fa_attempts
    $db->update('users', ['two_fa_attempts' => $twoFaAttempts], "id = " . (int)$user_id);

    if ($twoFaAttempts >= MAX_2FA_ATTEMPTS) {
        // Lock out the user
        $db->update('users', [
            'two_fa_lockout_time' => date('Y-m-d H:i:s'),
            'two_fa_attempts' => 0
        ], "id = " . (int)$user_id);
        die(JsonMsg('error', 'Bạn đã nhập sai mã 2FA quá nhiều lần. Tài khoản 2FA bị khóa trong 15 phút!'));
    }

    die(JsonMsg('error', 'Mã xác minh 2FA không chính xác! Còn ' . (MAX_2FA_ATTEMPTS - $twoFaAttempts) . ' lần thử.'));
}

// 2FA verified, proceed with login
$db->query("UPDATE users SET login_attempts = 0, lockout_time = NULL,two_fa_attempts = 0, two_fa_lockout_time = NULL WHERE id = " . (int)$user_id);
$session->send($user['username']);
$_SESSION['csrf_token'] = bin2hex(random_bytes(32));
unset($_SESSION['2fa_user_id']); // Clear temporary 2FA session
logUserLogin($user_id);
die(JsonMsg('success', 'Xác thực 2FA thành công!'));
