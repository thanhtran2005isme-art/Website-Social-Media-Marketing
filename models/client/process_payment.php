<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    exit(JsonMsg('error', 'Phương thức yêu cầu không hợp lệ!'));
}

try {
    if ($general_data['status_demo'] == 1) {
        throw new Exception('Đây là trang web demo bạn không thể thực hiện thao tác');
    }
    if (!isset($_POST['csrf_token']) || empty(trim($_POST['csrf_token']))) {
        throw new Exception('Yêu cầu không hợp lệ: Thiếu CSRF token!');
    }

    $csrf_token = Anti_xss($_POST['csrf_token']);
    if (!verifyCsrfToken($csrf_token)) {
        throw new Exception('Yêu cầu không hợp lệ: CSRF token không hợp lệ!');
    }

    if (!$user || empty($user)) {
        logSecurityIssue('Unauthorized access attempt', $_SERVER['REMOTE_ADDR']);
        throw new Exception('Vui lòng đăng nhập để tiếp tục thanh toán!');
    }

    if (!isset($data_user['id']) || !isset($data_user['status'])) {
        logSecurityIssue('Invalid user data', $_SERVER['REMOTE_ADDR']);
        throw new Exception('Dữ liệu người dùng không hợp lệ!');
    }

    if ($data_user['status'] == 0) {
        logSecurityIssue("Locked account access attempt: {$data_user['id']}", $_SERVER['REMOTE_ADDR']);
        throw new Exception('Tài khoản của bạn đã bị khoá, vui lòng liên hệ admin!');
    }

    if (isRateLimited($data_user['id'])) {
        throw new Exception('Bạn đang gửi yêu cầu quá nhanh, vui lòng thử lại sau!');
    }

    $input = sanitizeInput([
        'category' => intval($_POST['category'] ?? 0),
        'service' => intval($_POST['service'] ?? 0),
        'link' => trim($_POST['link']) ?? '',
        'quantity' => intval($_POST['quantity'] ?? 0),
        'check' => filter_var($_POST['check'] ?? false, FILTER_VALIDATE_BOOLEAN),
        'drip_feed' => filter_var($_POST['drip_feed'] ?? false, FILTER_VALIDATE_BOOLEAN),
        'runs' => intval($_POST['runs'] ?? 0),
        'interval' => trim($_POST['interval'] ?? ''),
        'comments' => trim($_POST['comments'] ?? ''),
        'comment_username' => trim($_POST['comment_username'] ?? ''),
        'mention_username' => trim($_POST['mention_username'] ?? ''),
        'hashtag' => trim($_POST['hashtag'] ?? ''),
        'list' => trim($_POST['list'] ?? ''),
        'coupon_code' => trim($_POST['coupon_code'] ?? '')
    ]);

    if ($input['category'] <= 0 || $input['service'] <= 0 || empty($input['link'])) {
        throw new Exception('Dữ liệu đầu vào không hợp lệ!');
    }

    $blacklist = $db->get_row("SELECT link,reason FROM blacklist_links WHERE link = '{$input['link']}' ");
    if ($blacklist) {
        throw new Exception($blacklist['reason']);
    }


    $service = getService($input['service']);
    $category = getCategory($input['category']);

    $quantity = calculateQuantity($service, $input);

    if ($quantity < $service['min_amount'] || $quantity > $service['max_amount']) {
        throw new Exception("Số lượng phải nằm trong khoảng từ {$service['min_amount']} đến {$service['max_amount']}!");
    }

    $price_per_1 = $service['price'] / 1000;
    $price = $quantity * $price_per_1;
    $final_price = $price;

    if (!empty($input['coupon_code'])) {
        $coupon = $db->get_row("SELECT * FROM coupons WHERE code = '{$input['coupon_code']}' AND status = 1 AND (start_date IS NULL OR start_date <= NOW()) AND (end_date IS NULL OR end_date >= NOW()) AND (max_uses = 0 OR used_count < max_uses)");
        if ($coupon) {
            if (!empty($coupon['min_order_value']) && $quantity < $coupon['min_order_value']) {
                throw new Exception("Số lượng phải tối thiểu " . number_format($coupon['min_order_value'], 2) . " của điều kiện mã giảm giá");
            }
            if (!empty($coupon['max_order_value']) && $quantity > $coupon['max_order_value']) {
                throw new Exception("Số lượng không được vượt quá " . number_format($coupon['max_order_value'], 2) . " của điều kiện mã giảm giá");
            }

            if ($coupon['discount_type'] === 'percentage') {
                $discount = $price * ($coupon['discount_value'] / 100);
                $final_price = $price - $discount;
            } else {
                $final_price = $price - $coupon['discount_value'];
            }
            $final_price = max(0, $final_price);

            $db->query("UPDATE coupons SET used_count = used_count + 1 WHERE id = '{$coupon['id']}'");
        } else {
            throw new Exception("Mã coupon không hợp lệ hoặc đã hết hạn!");
        }
    }

    if ($final_price <= 0) {
        logSecurityIssue("Invalid payment amount: {$final_price}", $_SERVER['REMOTE_ADDR']);
        throw new Exception('Số tiền thanh toán không hợp lệ!');
    }
    $request_hash = generateRequestHash($input, $service, $quantity);

    $db->begin_transaction();

    updateUserBalance($data_user['id'], $final_price);

    $api_order_id = processApiOrder($service, $input, $quantity);

    $order_id = saveOrder($data_user['id'], $input, $service, $quantity, $final_price, $api_order_id, $request_hash);

    saveTransaction($data_user['id'], $final_price, $order_id);

    $db->commit();

    sendTelegramNotification(
        '📦 Đơn hàng mới',
        [
            'ID Đơn hàng' => htmlspecialchars($order_id, ENT_QUOTES, 'UTF-8'),
            'ID Người dùng' => htmlspecialchars($data_user['id'], ENT_QUOTES, 'UTF-8'),
            'Dịch vụ' => htmlspecialchars($service['service_title'], ENT_QUOTES, 'UTF-8'),
            'Số lượng' => htmlspecialchars($quantity, ENT_QUOTES, 'UTF-8'),
            'Tổng tiền' => htmlspecialchars(formatCurrencyF($final_price), ENT_QUOTES, 'UTF-8'),
            'Link' => htmlspecialchars($input['link'], ENT_QUOTES, 'UTF-8'),
            'Thời gian' => date('Y-m-d H:i:s')
        ]
    );

    exit(JsonMsg('success', 'Thanh toán thành công'));
} catch (Exception $e) {
    if ($db->in_transaction()) {
        $db->rollback();
    }
    if ($e->getCode() === 1062) {
        sendTelegramNotification(
            '⚠️ Lỗi đơn hàng',
            [
                'ID Người dùng' => htmlspecialchars($data_user['id'] ?? 'N/A', ENT_QUOTES, 'UTF-8'),
                'Lỗi' => 'Đơn hàng trùng lặp',
                'Chi tiết' => htmlspecialchars($e->getMessage(), ENT_QUOTES, 'UTF-8')
            ]
        );
        exit(JsonMsg('error', 'Đơn hàng này đã được xử lý, vui lòng kiểm tra lại!'));
    }
    exit(JsonMsg('error', $e->getMessage()));
}
