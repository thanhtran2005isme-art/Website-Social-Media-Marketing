<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
header('Content-Type: application/json');

// Check authentication
if (!$user) {
    die(JsonMsg('error', 'Vui lòng đăng nhập để thực hiện'));
}
if ($general_data['status_demo'] == 1) {
    die(JsonMsg('error', 'Đây là trang web demo bạn không thể thực hiện thao tác'));
}
// CSRF protection
if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
    die(JsonMsg('error', 'Invalid CSRF token'));
}

$required_fields = ['username', 'email'];
foreach ($required_fields as $field) {
    if (!isset($_POST[$field]) || empty(trim($_POST[$field]))) {
        die(JsonMsg('error', ucfirst($field) . ' là bắt buộc'));
    }
}

// Sanitize input data
$data = [
    'username' => Anti_xss($_POST['username']) ?? '',
    'email' => Anti_xss($_POST['email']) ?? '',
    'lastname' => Anti_xss($_POST['lastname']) ?? '',
    'firstname' => Anti_xss($_POST['firstname']) ?? '',
    'phone' => Anti_xss($_POST['phone']) ?? '',
    'address_one' => Anti_xss($_POST['address']) ?? '',
    'state' => Anti_xss($_POST['state']) ?? '',
    'zip_code' => Anti_xss($_POST['zipcode']) ?? '',
    'country_code' => Anti_xss($_POST['country_code']) ?? '',
    'country' => Anti_xss($_POST['country_name']) ?? ''
];

if (!filter_var($data['email'], FILTER_VALIDATE_EMAIL)) {
    echo json_encode(['success' => false, 'message' => 'Định dạng email không hợp lệ']);
    exit;
    die(JsonMsg('error', 'Vui lòng đăng nhập để thực hiện'));
}

// Start transaction
$db->begin_transaction();

try {
    // Fetch current user data
    $current_user = $db->get_row("SELECT username, email FROM users WHERE id = " . (int)$data_user['id']);
    if (!$current_user) {
        $db->rollback();
        die(JsonMsg('error', 'Không tìm thấy người dùng'));
    }

    // Check if username or email has changed
    $username_changed = $data['username'] !== $current_user['username'];
    $email_changed = $data['email'] !== $current_user['email'];

    // If username changed, check for uniqueness
    if ($username_changed) {
        $existing_username = $db->get_row("SELECT id FROM users WHERE username = '" . $data['username'] . "' AND id != " . (int)$data_user['id']);
        if ($existing_username) {
            $db->rollback();
            die(JsonMsg('error', 'Tên người dùng đã tồn tại'));
        }
    }

    // If email changed, check for uniqueness
    if ($email_changed) {
        $existing_email = $db->get_row("SELECT id FROM users WHERE email = '" . $data['email'] . "' AND id != " . (int)$data_user['id']);
        if ($existing_email) {
            $db->rollback();
            die(JsonMsg('error', 'Email đã tồn tại'));
        }
    }

    // Proceed with update if no duplicates or if fields haven't changed
    $where = "id = " . (int)$data_user['id'];
    $result = $db->update('users', $data, $where);

    if ($result) {
        // Commit transaction
        $db->commit();
        die(JsonMsg('success', 'Cập nhật thành công'));
    } else {
        // Rollback transaction
        $db->rollback();
        die(JsonMsg('error', 'Không cập nhật được hồ sơ'));
    }
} catch (Exception $e) {
    // Rollback transaction on error
    $db->rollback();
    die(JsonMsg('error', $e->getMessage()));
} finally {
    // Close database connection
    $db->dis_connect();
}
