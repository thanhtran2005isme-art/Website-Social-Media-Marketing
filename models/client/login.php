<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
header('Content-Type: application/json');

const MAX_LOGIN_ATTEMPTS = 5; // Số lần thử tối đa
const LOCKOUT_DURATION = 15 * 60; // 15 phút (tính bằng giây)

header("X-Content-Type-Options: nosniff");
header("X-Frame-Options: DENY");
header("X-XSS-Protection: 1; mode=block");

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    die(JsonMsg('error', 'Phương thức yêu cầu không hợp lệ!'));
}

$csrf_token = Anti_xss($_POST['_token']);
if (!$csrf_token || $csrf_token !== $_SESSION['csrf_token']) {
    die(JsonMsg('error', 'Yêu cầu không hợp lệ (CSRF token không khớp), vui lòng tải lại trang!'));
}


$username = Anti_xss($_POST['username']);
$password = Anti_xss($_POST['password']);

if (empty($username) || empty($password)) {
    die(JsonMsg('error', 'Vui lòng nhập đầy đủ tên người dùng và mật khẩu!'));
}
$captcha_response = Anti_xss($_POST['cf-turnstile-response']);
$captcha_result = verifyTurnstileCaptcha($captcha_response, $_SERVER['REMOTE_ADDR']);
if ($captcha_result !== true) {
    die(json_encode(['status' => 'error', 'msg' => $captcha_result]));
}
$user = $db->get_row("SELECT id, username,two_fa,two_fa_code, password, login_attempts, lockout_time FROM users WHERE username = '{$username}'");

if (!$user) {
    die(JsonMsg('error', 'Tài khoản hoặc mật khẩu không hợp lệ'));
}

if ($user['lockout_time'] !== null && (time() < strtotime($user['lockout_time']) + LOCKOUT_DURATION)) {
    $remainingTime = (strtotime($user['lockout_time']) + LOCKOUT_DURATION - time()) / 60;
    die(JsonMsg('error', "Tài khoản của bạn đã bị khóa. Vui lòng thử lại sau " . ceil($remainingTime) . " phút!"));
}

if (!password_verify($password, $user['password'])) {
    $loginAttempts = $user['login_attempts'] + 1;

    $db->query("UPDATE users SET login_attempts = '{$loginAttempts}' WHERE id = '{$user['id']}'");

    if ($loginAttempts >= MAX_LOGIN_ATTEMPTS) {
        $db->query("UPDATE users SET lockout_time = NOW(), login_attempts = 0 WHERE id ='{$user['id']}'");
        die(JsonMsg('error', 'Bạn đã nhập sai quá nhiều lần. Tài khoản đã bị khóa trong 15 phút!'));
    }
    die(JsonMsg('error', 'Mật khẩu không đúng! Còn ' . (MAX_LOGIN_ATTEMPTS - $loginAttempts) . ' lần thử.'));
}

if ($user['two_fa'] == 1 && !empty($user['two_fa_code'])) {
    $_SESSION['2fa_user_id'] = $user['id'];
    die(json_encode(array('status' => '2fa_required', 'msg' => 'Yêu cầu xác thực 2FA', 'user_id' => $user['id'])));
}
$date = gettime();
$db->query("UPDATE users SET login_attempts = 0, lockout_time = NULL,two_fa_attempts = 0, two_fa_lockout_time = NULL, last_login = '{$date}' WHERE id = '{$user['id']}'");
$session->send($user['username']);
$_SESSION['csrf_token'] = bin2hex(random_bytes(32));
logUserLogin($user['id']);
die(JsonMsg('success', 'Đăng nhập thành công'));
