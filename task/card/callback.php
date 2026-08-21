<?php
header('Content-Type: application/json');
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';

$partner_key = $charging_data['partner_key'] ?? '';
$fees = $charging_data['fees'] ?? [];

// Khởi tạo phản hồi mặc định
$response = ['status' => 'error', 'message' => 'Lỗi không xác định'];

try {
    // Lấy và lọc dữ liệu từ GET
    $status = Anti_xss($_GET['status'] ?? '');
    $message = Anti_xss($_GET['message'] ?? '');
    $request_id = Anti_xss($_GET['request_id'] ?? '');
    $declared_value = Anti_xss($_GET['declared_value'] ?? '');
    $card_value = Anti_xss($_GET['card_value'] ?? '');
    $value = Anti_xss($_GET['value'] ?? '');
    $amount = Anti_xss($_GET['amount'] ?? '');
    $code = Anti_xss($_GET['code'] ?? '');
    $serial = Anti_xss($_GET['serial'] ?? '');
    $telco = Anti_xss($_GET['telco'] ?? '');
    $trans_id = Anti_xss($_GET['trans_id'] ?? '');
    $callback_sign = Anti_xss($_GET['callback_sign'] ?? '');

    // Kiểm tra dữ liệu đầu vào
    if (empty($request_id) || empty($status) || empty($callback_sign)) {
        throw new Exception('Thiếu tham số bắt buộc.');
    }

    // Xác minh callback_sign
    $expected_sign = md5($partner_key . $request_id . $trans_id . $status);
    if ($callback_sign !== $expected_sign) {
        throw new Exception('Chữ ký callback không hợp lệ.');
    }

    // Kiểm tra giao dịch tồn tại
    $transaction = $db->get_row("SELECT * FROM card_transactions WHERE request_id = '$request_id' FOR UPDATE");
    if (!$transaction) {
        throw new Exception('Không tìm thấy giao dịch với request_id: ' . $request_id);
    }

    // Kiểm tra user_id
    $user_id = $transaction['user_id'];
    if (empty($user_id)) {
        throw new Exception('Giao dịch không liên kết với user.');
    }

    // Lấy chiết khấu từ cấu hình
    $fee = isset($fees[$telco]) ? $fees[$telco] : 0;
    $real_amount = $amount; // Số tiền nhận được từ callback (amount)

    // Chuẩn bị dữ liệu cập nhật giao dịch
    $update_data = [
        'status' => $status == '1' ? 'success' : 'failed',
        'message' => $message,
        'amount' => $card_value, // Mệnh giá thực của thẻ
        'real_amount' => $real_amount, // Số tiền nhận được
        'code' => ($code), // Mã hóa code
        'serial' => $serial, // Mã hóa serial
        'telco' => $telco,
        'trans_id' => $trans_id,
        'fee' => $fee
    ];

    // Bắt đầu transaction
    $db->begin_transaction();

    // Cập nhật giao dịch
    if (!$db->update('card_transactions', $update_data, "request_id = '$request_id'")) {
        $db->rollback();
        throw new Exception('Lỗi cập nhật giao dịch vào cơ sở dữ liệu.');
    }

    // Nếu giao dịch thành công, cộng tiền cho user và ghi log giao dịch
    if ($status == '1') {
        // Kiểm tra user tồn tại
        $user = $db->get_row("SELECT balance FROM users WHERE id = '$user_id' FOR UPDATE");
        if (!$user) {
            $db->rollback();
            throw new Exception('Không tìm thấy user với ID: ' . $user_id);
        }

        // Cộng tiền vào số dư
        $new_balance = $user['balance'] + $real_amount;
        if (!$db->update('users', ['balance' => $new_balance], "id = '$user_id'")) {
            $db->rollback();
            throw new Exception('Lỗi cập nhật số dư user.');
        }

       

        // Lưu giao dịch tài chính
        $transaction_data = [
            'trx_id' => generateOrderNumber(),
            'user_id' => $user_id,
            'trx_type' => '+',
            'amount' => $real_amount,
            'remarks' => 'Nạp thẻ thành công: ' . $telco . ', mệnh giá: ' . $card_value . ', thực nhận: ' . $real_amount,
            'charge' => 0,
            'created_at' => gettime(),
            'updated_at' => gettime()
        ];

        if (!$db->insert('transactions', $transaction_data)) {
            $db->rollback();
            throw new Exception('Lỗi lưu giao dịch tài chính.');
        }
        sendTelegramNotification(
            '📥 Nạp thẻ thành công',
            [
                'ID Giao dịch' => $transaction['id'],
                'ID Người dùng' => $user_id,
                'Nhà mạng' => $transaction['telco'],
                'Mệnh giá' => formatCurrencyF($transaction['amount']),
                'Thực nhận' => formatCurrencyF($real_amount),
                'Thời gian' => date('Y-m-d H:i:s')
            ]
        );
    }

    // Xóa dữ liệu nhạy cảm
    // if (!$db->update('card_transactions', ['code' => null, 'serial' => null], "request_id = '$request_id'")) {
    //     $db->rollback();
    //     throw new Exception('Lỗi xóa dữ liệu nhạy cảm.');
    // }

    $db->commit();
    $response = [
        'status' => 'success',
        'message' => 'Callback xử lý thành công.'
    ];
} catch (Exception $e) {
    if ($db->in_transaction()) {
        $db->rollback();
    }
    $response = [
        'status' => 'error',
        'message' => $e->getMessage()
    ];
    http_response_code(400);
    // Ghi log lỗi
    error_log('Callback error: ' . $e->getMessage());
} finally {
    $db->dis_connect();
}

echo json_encode($response);
?>