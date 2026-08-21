<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/vendor/autoload.php'; // For PHPMailer
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    die(json_encode(['status' => 'error', 'msg' => 'Phương thức yêu cầu không hợp lệ!']));
}
$csrf_token = Anti_xss($_POST['_token']);
if (!$csrf_token || $csrf_token !== $_SESSION['csrf_token']) {
    die(json_encode(['status' => 'error', 'msg' => 'Yêu cầu không hợp lệ (CSRF token không khớp)!']));
}
$email = Anti_xss($_POST['email']);
$captcha_response = Anti_xss($_POST['cf-turnstile-response']);
if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
    die(json_encode(['status' => 'error', 'msg' => 'Địa chỉ email không hợp lệ!']));
}
if (empty($captcha_response)) {
    die(json_encode(['status' => 'error', 'msg' => 'Vui lòng hoàn thành xác thực CAPTCHA!']));
}

$captcha_result = verifyTurnstileCaptcha($captcha_response, $_SERVER['REMOTE_ADDR']);
if ($captcha_result !== true) {
    die(json_encode(['status' => 'error', 'msg' => $captcha_result]));
}

$blacklist = $db->get_row("SELECT email,reason FROM blacklist_emails WHERE email = '{$email}' ");
if ($blacklist) {
    die(json_encode(['status' => 'error', 'msg' => $blacklist['reason']]));
}

$user = $db->get_row("SELECT id, username, email FROM users WHERE email = '" . $email . "'");
if (!$user) {
    die(json_encode(['status' => 'error', 'msg' => 'Không tìm thấy tài khoản với email này!']));
}

// Generate a unique reset token
$reset_token = bin2hex(random_bytes(32));
$expires_at = date('Y-m-d H:i:s', strtotime('+1 hour')); // Token expires in 1 hour

// Store the reset token in the database
$db->insert('password_resets', [
    'email' => $email,
    'token' => $reset_token,
    'expires_at' => $expires_at,
    'created_at' => date('Y-m-d H:i:s')
]);

// Generate reset link
$reset_link = "https://" . $_SERVER['HTTP_HOST'] . "/reset-password?token=" . $reset_token;

// Prepare email content
$subject = "Yêu cầu đặt lại mật khẩu";
$body = "<h2>Chào {$user['username']},</h2>";
$body .= "<p>Bạn đã yêu cầu đặt lại mật khẩu. Vui lòng nhấp vào liên kết sau để đặt lại mật khẩu của bạn:</p>";
$body .= "<a href='$reset_link' style='color: #4f46e5; text-decoration: underline;'>Đặt lại mật khẩu</a>";
$body .= "<p>Liên kết này sẽ hết hạn sau 1 giờ. Nếu bạn không yêu cầu đặt lại mật khẩu, vui lòng bỏ qua email này.</p>";
$body .= "<p>Trân trọng,<br>SMM Panel Team</p>";

// Send email using sendCSM
$result = sendCSM(
    $mail_nhan = $email,
    $ten_nhan = $user['username'],
    $chu_de = $subject,
    $noi_dung = $body,
    $bcc = 'SMM Panel',
    $path = ''
);

if ($result === true) {
    die(json_encode(['status' => 'success', 'msg' => 'Liên kết đặt lại mật khẩu đã được gửi đến email của bạn!']));
} else {
    // Remove the reset token if email sending fails
    $db->remove('password_resets', "email = '" . $email . "' AND token = '" . $reset_token . "'");
    die(json_encode(['status' => 'error', 'msg' => $result === 'Chưa cấu hình SMTP' ? 'Hệ thống email chưa được cấu hình!' : 'Không thể gửi email. Vui lòng thử lại sau!']));
}
