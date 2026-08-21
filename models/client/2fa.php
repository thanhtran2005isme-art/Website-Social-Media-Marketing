<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
header('Content-Type: application/json');

use PragmaRX\Google2FA\Google2FA;

if (!$user) {
    die(JsonMsg('error', 'Vui lòng đăng nhập để thực hiện'));
}

if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
    die(JsonMsg('error', 'Invalid CSRF token'));
}

$google2fa = new Google2FA();

// Handle regenerate 2FA code
if (isset($_POST['action']) && $_POST['action'] === 'regenerate_2fa') {
    $db->begin_transaction();
    try {
        // Generate new 2FA secret key
        $new_secret = $google2fa->generateSecretKey();
        $data = [
            'two_fa_code' => $new_secret,
            'two_fa' => 0 // Ensure 2FA is disabled when regenerating
        ];
        $where = "id = " . (int)$data_user['id'];
        $result = $db->update('users', $data, $where);
        if ($result) {
            $db->commit();
            die(JsonMsg('success', 'Đã khởi tạo lại mã 2FA thành công'));
        } else {
            $db->rollback();
            die(JsonMsg('error', 'Không thể khởi tạo lại mã 2FA'));
        }
    } catch (Exception $e) {
        $db->rollback();
        die(JsonMsg('error', $e->getMessage()));
    } finally {
        $db->dis_connect();
    }
}

// Handle toggle 2FA
if (!isset($_POST['totp_code']) || !preg_match('/^\d{6}$/', $_POST['totp_code'])) {
    die(JsonMsg('error', 'Mã TOTP không hợp lệ'));
}

$totp_code = Anti_xss($_POST['totp_code']);

// Fetch user data
$current_user = $db->get_row("SELECT two_fa_code, two_fa FROM users WHERE id = " . (int)$data_user['id']);
if (!$current_user) {
    die(JsonMsg('error', 'Không tìm thấy người dùng'));
}
if (!$current_user['two_fa_code']) {
    die(JsonMsg('error', 'Không tìm thấy khoá 2FA'));
}

if ($google2fa->verifyKey($current_user['two_fa_code'], $totp_code) != true) {
    die(JsonMsg('error', 'Mã xác minh không chính xác!'));
}

// Toggle 2FA status
$db->begin_transaction();
try {
    $new_status = $current_user['two_fa'] ? 0 : 1;
    $data = [
        'two_fa' => $new_status
    ];
    $where = "id = " . (int)$data_user['id'];
    $result = $db->update('users', $data, $where);
    if ($result) {
        $db->commit();
        $message = $new_status ? 'Đã bật 2FA thành công' : 'Đã vô hiệu hóa 2FA thành công';
        die(JsonMsg('success', $message));
    } else {
        $db->rollback();
        die(JsonMsg('error', 'Không thể chuyển đổi 2FA'));
    }
} catch (Exception $e) {
    $db->rollback();
    die(JsonMsg('error', $e->getMessage()));
} finally {
    $db->dis_connect();
}
?>