<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';

try {
    // Check if user is logged in
    if (!$user) {
        throw new Exception("Vui lòng đăng nhập để thực hiện chuyển đổi");
    }

    // Get and sanitize currency code from POST request
    $currency_code = isset($_POST['currency_code']) ? Anti_xss($_POST['currency_code']) : null;

    // Validate currency code
    if (!$currency_code) {
        throw new Exception("Mã tiền tệ là bắt buộc");
    }

    // Check if the currency code exists and is active
    $exists = $db->get_row("SELECT COUNT(*) FROM `currencies` WHERE `currency_code` = '{$currency_code}' AND `status` = 1");
    if (!$exists) {
        throw new Exception("Mã tiền tệ không hợp lệ");
    }

    // Update user's currency in the database
    $db->query("UPDATE `users` SET `currency_code` = '{$currency_code}' WHERE `id` = '{$data_user['id']}'");

    // Return success response
    die(JsonMsg("success", "Chuyển đổi tiền tệ thành công"));

} catch (Exception $e) {
    // Return error response with the caught exception message
    die(JsonMsg("error", $e->getMessage()));
}