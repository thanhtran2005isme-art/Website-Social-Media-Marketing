<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
use PragmaRX\Google2FA\Google2FA;

header('Content-Type: application/json');
$response = ['status' => 'error', 'message' => 'Unknown error'];
try {
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        throw new Exception('Method not allowed.');
    }
    if (!$user || empty($user)) {
        throw new Exception('Vui lòng đăng nhập để thực hiện');
    }
    if ($data_user['role'] != '1') {
        throw new Exception('Bạn không có quyền truy cập vào trang này');
    }
    if ($general_data['status_demo'] == 1) {
        throw new Exception('Đây là trang web demo bạn không thể thực hiện thao tác');
    }
    if (!isset($_POST['users']) || !is_array($_POST['users'])) {
        throw new Exception('Không cung cấp dữ liệu người dùng');
    }

    $users = $_POST['users'];
    $inserted = 0;

    foreach ($users as $user) {
        // Sanitize inputs
        $username = Anti_xss($user['username']);
        $email = Anti_xss($user['email']);
        $password = Anti_xss($user['password']);
        $balance = $user['balance'] ? Anti_xss($user['balance']) : 0;

        // Validate inputs
        if (empty($username) || empty($email) || empty($password) || !isset($balance)) {
            throw new Exception('Tất cả các trường đều bắt buộc.');
        }
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            throw new Exception('Định dạng email không hợp lệ.');
        }
        if (strlen($password) < 6) {
            throw new Exception('Mật khẩu phải có ít nhất 6 ký tự.');
        }
        if ($balance < 0) {
            throw new Exception('Số dư không thể âm.');
        }

        if ($db->get_row("SELECT * FROM `users` WHERE `username` = '{$username}' OR `email` = '{$email}'")) {
            throw new Exception("Tên người dùng hoặc email đã tồn tại: $username / $email");
        }
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        $google2fa = new Google2FA();
        $isInsert = $db->insert("users", array(
            'username' => $username,
            'password' => $hashed_password,
            'email' => $email,
            'two_fa_code' => $google2fa->generateSecretKey(),
            'currency_code' => 'VND',
            'balance' => $balance,
            'created_at' => gettime(),
            'updated_at' => gettime()
        ));
        if ($isInsert) {
            $inserted++;
          
        }
    }

    $response = ['status' => 'success', 'message' => "Đã thêm thành công $inserted người dùng."];
} catch (Exception $e) {
    $response['message'] = $e->getMessage();
}

echo json_encode($response);
exit;
