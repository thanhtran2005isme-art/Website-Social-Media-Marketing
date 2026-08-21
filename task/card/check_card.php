<?php
header('Content-Type: application/json');
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';

$api_url = $charging_data['api_url'] ?? '';
$partner_id = $charging_data['partner_id'] ?? '';
$partner_key = $charging_data['partner_key'] ?? '';
$fees = $charging_data['fees'] ?? [];

// Khởi tạo phản hồi mặc định
$response = ['status' => 'error', 'message' => 'Lỗi không xác định', 'processed' => 0, 'errors' => []];

try {
    // Truy vấn các giao dịch cần kiểm tra (ví dụ: status = 'pending' hoặc 'success')
    $transactions = $db->get_list("SELECT id, user_id, telco, amount, code, serial, request_id, status 
                                   FROM card_transactions 
                                   WHERE status = 'pending'
                                   LIMIT 50"); // Giới hạn để tránh xử lý quá nhiều

    if (empty($transactions)) {
        throw new Exception('Không có giao dịch nào cần kiểm tra.');
    }

    $processed = 0;
    $errors = [];

    // Bắt đầu transaction
    $db->begin_transaction();

    foreach ($transactions as $transaction) {
        try {
            // Kiểm tra dữ liệu giao dịch
            if (empty($transaction['telco']) || empty($transaction['amount']) || empty($transaction['request_id']) || empty($transaction['code']) || empty($transaction['serial'])) {
                throw new Exception('Dữ liệu giao dịch không đầy đủ cho request_id: ' . $transaction['request_id']);
            }

            // Lấy code và serial
            $code = $transaction['code'];
            $serial = $transaction['serial'];

            // Lấy chiết khấu
            $fee = isset($fees[$transaction['telco']]) ? $fees[$transaction['telco']] : 0;
            $real_amount = $transaction['amount'] * (1 - $fee / 100);

            // Tạo chữ ký
            $sign = md5($partner_key . $code . $serial);

            // Chuẩn bị dữ liệu gửi đến API
            $data = [
                'telco' => $transaction['telco'],
                'code' => $code,
                'serial' => $serial,
                'amount' => $transaction['amount'],
                'request_id' => $transaction['request_id'],
                'partner_id' => $partner_id,
                'sign' => $sign,
                'command' => 'check'
            ];

            // Gửi yêu cầu đến API bằng cURL
            $ch = curl_init($api_url);
            if (!$ch) {
                throw new Exception('Không thể khởi tạo cURL.');
            }
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
            $api_response = curl_exec($ch);
            if ($api_response === false) {
                $curl_error = curl_error($ch);
                curl_close($ch);
                throw new Exception('Lỗi cURL: ' . $curl_error);
            }
            curl_close($ch);

            // Xử lý phản hồi từ API
            $result = json_decode($api_response, true);
            if ($result === null) {
                throw new Exception('Phản hồi API không hợp lệ.');
            }

            $update_data = [
                'status' => isset($result['status']) ? ($result['status'] == '1' ? 'success' : 'error') : 'error',
                'message' => isset($result['message']) ? $result['message'] : 'Không có thông báo',
                'amount' => isset($result['card_value']) ? $result['card_value'] : $transaction['amount']
            ];

            // Cập nhật giao dịch
            if (!$db->update('card_transactions', $update_data, "id = '{$transaction['id']}'")) {
                throw new Exception('Lỗi cập nhật giao dịch cho request_id: ' . $transaction['request_id']);
            }

            // Nếu thẻ hợp lệ (status = 1), cộng tiền cho user
            if ($result['status'] == '1') {
                // Kiểm tra user tồn tại
                $user_id = $transaction['user_id'];
                if (empty($user_id)) {
                    throw new Exception('Giao dịch không liên kết với user cho request_id: ' . $transaction['request_id']);
                }

                $user = $db->get_row("SELECT balance FROM users WHERE id = '$user_id' FOR UPDATE");
                if (!$user) {
                    throw new Exception('Không tìm thấy user với ID: ' . $user_id);
                }

                // Cộng tiền vào số dư
                $new_balance = $user['balance'] + $real_amount;
                if (!$db->update('users', ['balance' => $new_balance], "id = '$user_id'")) {
                    throw new Exception('Lỗi cập nhật số dư user cho request_id: ' . $transaction['request_id']);
                }

                $transaction_data = [
                    'trx_id' => generateOrderNumber(),
                    'user_id' => $user_id,
                    'trx_type' => '+',
                    'amount' => $real_amount,
                    'remarks' => 'Kiểm tra thẻ thành công: ' . $transaction['telco'] . ', mệnh giá: ' . $transaction['amount'] . ', thực nhận: ' . $real_amount,
                    'charge' => 0,
                    'created_at' => gettime(),
                    'updated_at' => gettime()
                ];
                if (!$db->insert('transactions', $transaction_data)) {
                    throw new Exception('Lỗi lưu giao dịch tài chính cho request_id: ' . $transaction['request_id']);
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
            } else {
                // Ghi log nếu thẻ lỗi
                error_log("Card error for request_id: {$transaction['request_id']}, message: {$result['message']}");
            }

            $processed++;
        } catch (Exception $e) {
            $errors[] = [
                'request_id' => $transaction['request_id'],
                'error' => $e->getMessage()
            ];
            error_log('Check card error for request_id: ' . $transaction['request_id'] . ': ' . $e->getMessage());
            continue; // Tiếp tục với giao dịch tiếp theo
        }
    }

    // Commit transaction
    $db->commit();
    $response = [
        'status' => 'success',
        'message' => 'Đã xử lý kiểm tra thẻ.',
        'processed' => $processed,
        'errors' => $errors
    ];
} catch (Exception $e) {
    if ($db->in_transaction()) {
        $db->rollback();
    }
    $response = [
        'status' => 'error',
        'message' => $e->getMessage(),
        'processed' => 0,
        'errors' => []
    ];
    error_log('Check card transactions error: ' . $e->getMessage());
} finally {
    $db->dis_connect();
}

echo json_encode($response);
