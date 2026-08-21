<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';

use PragmaRX\Google2FA\Google2FA;

header('Content-Type: application/json');

header("X-Content-Type-Options: nosniff");
header("X-Frame-Options: DENY");
header("X-XSS-Protection: 1; mode=block");

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    sendResponse(false, 'Phương thức yêu cầu không hợp lệ!');
}

// Kiểm tra CSRF token
$csrf_token = Anti_xss($_POST['_token']);
if (!$csrf_token || $csrf_token !== $_SESSION['csrf_token']) {
    sendResponse(false, 'Yêu cầu không hợp lệ (CSRF token không khớp)!');
}

// Lấy và kiểm tra dữ liệu đầu vào
$username = Anti_xss($_POST['username']);
$email = Anti_xss($_POST['email']);
$password = Anti_xss($_POST['password']);
$confirmPassword = Anti_xss($_POST['confirmPassword']);
$affiliate_code = isset($_SESSION['affiliate_code']) ?  Anti_xss($_SESSION['affiliate_code']) : '';
if (empty($username) || empty($email) || empty($password) || empty($confirmPassword)) {
    sendResponse(false, 'Vui lòng nhập đầy đủ thông tin!');
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    sendResponse(false, 'Email không hợp lệ!');
}

if ($password !== $confirmPassword) {
    sendResponse(false, 'Mật khẩu xác nhận không khớp!');
}

if (strlen($password) < 8 || !preg_match('/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/', $password)) {
    sendResponse(false, 'Mật khẩu phải dài ít nhất 8 ký tự và chứa cả chữ cái và số!');
}
$captcha_response = Anti_xss($_POST['cf-turnstile-response']);
$captcha_result = verifyTurnstileCaptcha($captcha_response, $_SERVER['REMOTE_ADDR']);
if ($captcha_result !== true) {
    sendResponse(false, $captcha_result);
}
$blacklist = $db->get_row("SELECT email,reason FROM blacklist_emails WHERE email = '{$email}' ");
if ($blacklist) {
    sendResponse(false, $blacklist['reason']);
}
if ($db->get_row("SELECT * FROM users WHERE username = '{$username}' OR email = '{$email}'")) {
    sendResponse(false, 'Tên người dùng hoặc email đã được sử dụng!');
}

$hashedPassword = password_hash($password, PASSWORD_BCRYPT, ['cost' => 12]);
$google2fa = new Google2FA();
$isInsert = $db->insert("users", array(
    'username' => $username,
    'password' => $hashedPassword,
    'email' => $email,
    'two_fa_code' => $google2fa->generateSecretKey(),
    'currency_code' => 'VND',
    'referred_by' => $affiliate_code,
    'created_at' => gettime(),
    'updated_at' => gettime()
));
if ($isInsert) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
    sendResponse(true, 'Đăng ký thành công!');
} else {
    sendResponse(false, 'Có lỗi xảy ra khi thêm người dùng, vui lòng thử lại sau!');
}
