<?php
header('Content-Type: application/json');
require_once realpath($_SERVER['DOCUMENT_ROOT']) . '/libs/init.php';
if (!$user || empty($user)) {
    die(JsonMsg('error', 'Chưa đăng nhập'));
}
if ($data_user['role'] != '1') {
    die(JsonMsg('error', 'Bạn không có quyền truy cập vào trang này'));
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST' || !isset($_POST['id'])) {
     die(JsonMsg('error', 'Yêu cầu không hợp lệ!'));
}

$coupon_id = (int)Anti_xss($_POST['id']);
$coupon = $db->get_row("SELECT * FROM coupons WHERE id = '{$coupon_id}'");

if ($coupon) {
    echo json_encode(['status' => "success", 'coupon' => $coupon]);
} else {
    echo json_encode(['status' => "error", 'msg' => 'Coupon không tồn tại!']);
}

$db->dis_connect();
