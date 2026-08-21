<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    die(json_encode(['status' => 'error', 'msg' => 'Phương thức yêu cầu không hợp lệ!']));
}

if ($general_data['status_demo'] == 1) {
    die(JsonMsg('error', 'Đây là trang web demo bạn không thể thực hiện thao tác'));
}
$token = Anti_xss($_POST['token']);
$password = Anti_xss($_POST['password']);
$password_confirmation = Anti_xss($_POST['password_confirmation']);

if (empty($token)) {
    die(json_encode(['status' => 'error', 'msg' => 'Liên kết không hợp lệ!']));
}

if (empty($password) || strlen($password) < 6) {
    die(json_encode(['status' => 'error', 'msg' => 'Mật khẩu phải có ít nhất 6 ký tự!']));
}

if ($password !== $password_confirmation) {
    die(json_encode(['status' => 'error', 'msg' => 'Mật khẩu xác nhận không khớp!']));
}

$db->connect();
$reset = $db->get_row("SELECT email, expires_at FROM password_resets WHERE token = '" . $token . "'");
if (!$reset || strtotime($reset['expires_at']) < time()) {
    die(json_encode(['status' => 'error', 'msg' => 'Liên kết không hợp lệ hoặc đã hết hạn!']));
}

$user = $db->get_row("SELECT id FROM users WHERE email = '" . $reset['email'] . "'");
if (!$user) {
    die(json_encode(['status' => 'error', 'msg' => 'Tài khoản không tồn tại!']));
}

// Update user's password
$hashed_password = password_hash($password, PASSWORD_DEFAULT);
$db->update('users', ['password' => $hashed_password], "id = " . (int)$user['id']);

// Delete the reset token
$db->remove('password_resets', "token = '" . $token . "'");

die(json_encode(['status' => 'success', 'msg' => 'Mật khẩu đã được đặt lại thành công!']));
