<?php
header('Content-Type: application/json');
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    die(JsonMsg('error', 'Invalid request method'));
}
if (!$user || empty($user)) {
    die(JsonMsg('error', 'Chưa đăng nhập'));
}
if ($data_user['role'] != '1') {
    die(JsonMsg('error', 'Bạn không có quyền truy cập vào trang này'));
}
if ($general_data['status_demo'] == 1) {
    die(JsonMsg('error', 'Đây là trang web demo bạn không thể thực hiện thao tác'));
}
$id = isset($_POST['id']) ? intval($_POST['id']) : 0;
$status = isset($_POST['status']) ? Anti_xss($_POST['status']) : '';
$link = isset($_POST['link']) ? Anti_xss($_POST['link']) : '';
$quantity = isset($_POST['quantity']) ? intval($_POST['quantity']) : 0;
$start_counter = isset($_POST['start_counter']) ? Anti_xss($_POST['start_counter']) : '';
$remains = isset($_POST['remains']) ? Anti_xss($_POST['remains']) : '';

if ($id <= 0) {
    die(JsonMsg('error', 'Mã đơn hàng không hợp lệ'));
}

try {
    $updates = [];
    if (!empty($status)) {
        $updates[] = "status = '{$status}'";
    }
    if (!empty($link)) {
        $updates[] = "link = '{$link}'";
    }
    if ($quantity > 0) {
        $updates[] = "quantity = '{$quantity}'";
    }
    if (!empty($start_counter)) {
        $updates[] = "start_counter = '{$start_counter}'";
    }
    if (!empty($remains)) {
        $updates[] = "remains = '{$remains}'";
    }

    if (empty($updates)) {
        die(JsonMsg('error', 'Không có dữ liệu nào để cập nhật'));
    }
    
    $query = "UPDATE orders SET " . implode(', ', $updates) . " WHERE id = '{$id}'";
    $db->query($query);

    die(JsonMsg('success', 'Đơn hàng được cập nhật thành công'));
} catch (Exception $e) {
    die(JsonMsg('error', $e->getMessage()));
}
