<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
header('Content-Type: application/json');
if ($general_data['status_demo'] == 1) {
     die(JsonMsg('error', 'Đây là trang web demo bạn không thể thực hiện thao tác'));
}
if (!$user || empty($user)) {
   die(JsonMsg('error', 'Vui lòng đăng nhập để thực hiện'));
}

if (!isset($data_user['id']) || !isset($data_user['status'])) {
    die(JsonMsg('error', 'Dữ liệu người dùng không hợp lệ!'));
}
// Lấy dữ liệu đầu vào
$coupon_code = Anti_xss($_POST['coupon_code']);
$quantity = (int)Anti_xss($_POST['quantity']);
$service_id = (int)Anti_xss($_POST['service_id']);

// Kiểm tra dữ liệu đầu vào
if (empty($coupon_code) || $quantity <= 0 || $service_id <= 0) {
    die(JsonMsg('error', 'Dữ liệu đầu vào không hợp lệ!'));
}

// Lấy thông tin dịch vụ từ bảng services
$service = $db->get_row("SELECT price FROM services WHERE id = '{$service_id}'");
if (!$service) {
   die(JsonMsg('error', 'Dịch vụ không tồn tại!'));
}
$price_per_1 = $service['price'] / 1000;
// Tính giá dựa trên quantity và price của dịch vụ
$price = $price_per_1 * $quantity;

// Kiểm tra coupon
$coupon = $db->get_row("SELECT * FROM coupons WHERE code = '{$coupon_code}' AND status = 1 AND (start_date IS NULL OR start_date <= NOW()) AND (end_date IS NULL OR end_date >= NOW()) AND (max_uses = 0 OR used_count < max_uses)");

if ($coupon) {
    // Kiểm tra min_order_value
    if (!empty($coupon['min_order_value']) && $price < $coupon['min_order_value']) {
        die(JsonMsg('error', "Số lượng đơn hàng phải tối thiểu " . number_format($coupon['min_order_value'], 2) . ""));
    }
    // Kiểm tra max_order_value
    if (!empty($coupon['max_order_value']) && $price > $coupon['max_order_value']) {
        die(JsonMsg('error', "Số lượng đơn hàng không được vượt quá " . number_format($coupon['max_order_value'], 2) . ""));
    }

    // Tính giá sau khi áp dụng coupon
    $final_price = $price;
    if ($coupon['discount_type'] === 'percentage') {
        $discount = $price * ($coupon['discount_value'] / 100);
        $final_price = $price - $discount;
    } else {
        $final_price = $price - $coupon['discount_value'];
    }
    $final_price = max(0, $final_price);

    // Trả về kết quả
    echo json_encode([
        'status' => "success",
        'discount_type' => $coupon['discount_type'],
        'discount_value' => $coupon['discount_value'],
        'original_price' => formatCurrencyF($price),
        'final_price' => formatCurrencyF($final_price),
        'discount_amount' => formatCurrencyF($price - $final_price)
    ]);
} else {
    die(JsonMsg('error', 'Mã coupon không hợp lệ hoặc đã hết hạn!'));
}

$db->dis_connect();
