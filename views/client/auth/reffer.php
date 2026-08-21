<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');

if (isset($_GET['aff'])) {
    $affiliate_code = Anti_xss($_GET['aff']);
    $ip_address = $_SERVER['REMOTE_ADDR'];
    $current_time = date('Y-m-d H:i:s');
    $time_threshold = date('Y-m-d H:i:s', strtotime('-1 hour')); // Giới hạn 1 giờ

    // Kiểm tra xem IP đã click vào affiliate_code trong 1 giờ gần nhất chưa
    $existing_click = $db->get_row("SELECT id FROM affiliate_clicks WHERE affiliate_code = '$affiliate_code' AND ip_address = '$ip_address' AND clicked_at >= '$time_threshold'");

    if (!$existing_click) {
        // Ghi nhận lượt click mới
        $data = [
            'affiliate_code' => $affiliate_code,
            'ip_address' => $ip_address,
            'clicked_at' => $current_time
        ];

        $db->begin_transaction();
        try {
            if ($db->insert('affiliate_clicks', $data)) {
                $db->commit();
            } else {
                $db->rollback();
            }
        } catch (Exception $e) {
            $db->rollback();
            error_log("Error recording click: " . $e->getMessage());
        }
    }

    // Lưu affiliate_code vào session để sử dụng khi đăng ký
    $_SESSION['affiliate_code'] = $affiliate_code;

    new Redirect('/register');
}

$db->dis_connect();
