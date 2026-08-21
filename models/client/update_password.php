<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
header('Content-Type: application/json');

if (!$user) {
    die(JsonMsg('error', 'Vui lòng đăng nhập để thực hiện'));
}
if ($general_data['status_demo'] == 1) {
    die(JsonMsg('error', 'Đây là trang web demo bạn không thể thực hiện thao tác'));
}
if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
    die(JsonMsg('error', 'Invalid CSRF token'));
}

$required_fields = ['current_password', 'new_password', 'confirm_password'];
foreach ($required_fields as $field) {
    if (!isset($_POST[$field]) || empty(trim($_POST[$field]))) {
        die(JsonMsg('error', ucfirst(str_replace('_', ' ', $field)) . ' là bắt buộc'));
    }
}

$current_password = Anti_xss($_POST['current_password']);
$new_password = Anti_xss($_POST['new_password']);
$confirm_password = Anti_xss($_POST['confirm_password']);

if (strlen($new_password) < 8) {
    die(JsonMsg('error', 'Mật khẩu mới phải có ít nhất 8 ký tự'));
}
if ($new_password !== $confirm_password) {
    die(JsonMsg('error', 'Xác nhận mật khẩu không khớp'));
}

$db->begin_transaction();

try {

    $current_user = $db->get_row("SELECT password FROM users WHERE id = " . (int)$data_user['id']);
    if (!$current_user) {
        $db->rollback();
        die(JsonMsg('error', 'Không tìm thấy người dùng'));
    }

    if (!password_verify($current_password, $current_user['password'])) {
        $db->rollback();
        die(JsonMsg('error', 'Mật khẩu hiện tại không chính xác'));
    }

    $hashed_password = password_hash($new_password, PASSWORD_DEFAULT);

    $data = ['password' => $hashed_password];
    $where = "id = " . (int)$data_user['id'];
    $result = $db->update('users', $data, $where);

    if ($result) {
        $db->commit();
        die(JsonMsg('success', 'Đã cập nhật mật khẩu thành công'));
    } else {
        $db->rollback();
        die(JsonMsg('error', 'Không cập nhật được mật khẩu'));
    }
} catch (Exception $e) {
    $db->rollback();
    die(JsonMsg('error', $e->getMessage()));
} finally {
    // Close database connection
    $db->dis_connect();
}
