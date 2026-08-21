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
try {
    $withdrawal_id = (int)Anti_xss($_POST['withdrawal_id']);
    $new_status = in_array($_POST['status'], ['completed', 'pending', 'cancelled']) ? Anti_xss($_POST['status']) : 'pending';

    if ($withdrawal_id <= 0) {
        die(JsonMsg('error', 'Mã đơn rút không hợp lệ'));
    }

    $withdrawal = $db->get_row("SELECT * FROM withdrawals WHERE id = '{$withdrawal_id}' LIMIT 1");

    if (!$withdrawal) {
        die(JsonMsg('error', 'Mã đơn rút không hợp lệ'));
    }

    $data = [
        'status' => $new_status
    ];

    if ($db->update('withdrawals', $data, "`id` = '$withdrawal_id'")) {
        die(JsonMsg('success', 'Đơn rút tiền được cập nhật thành công'));
    } else {
        die(JsonMsg('error', 'Lỗi khi cập nhật trạng thái'));
    }
} catch (Exception $e) {
    die(JsonMsg('error', $e->getMessage()));
}
