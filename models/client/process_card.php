<?php
header('Content-Type: application/json');
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';

$api_url = $charging_data['api_url'] ?? '';
$partner_id = $charging_data['partner_id'] ?? '';
$partner_key = $charging_data['partner_key'] ?? '';
$fees = $charging_data['fees'] ?? [];

// Khởi tạo phản hồi mặc định
$response = ['status' => 'error', 'message' => 'Lỗi không xác định'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        if ($general_data['status_demo'] == 1) {
            throw new Exception('Đây là trang web demo bạn không thể thực hiện thao tác');
        }
        $telco = Anti_xss($_POST['telco'] ?? '');
        $amount = Anti_xss($_POST['amount'] ?? '');
        $code = Anti_xss($_POST['code'] ?? '');
        $serial = Anti_xss($_POST['serial'] ?? '');
        $request_id = time(); // ID yêu cầu duy nhất
        $user_id = $data_user['id']; // Thay bằng $_SESSION['user_id'] nếu có hệ thống đăng nhập

        // Lấy chiết khấu từ cấu hình
        $fee = isset($fees[$telco]) ? $fees[$telco] : 0;
        $real_amount = $amount * (1 - $fee / 100); // Tính tổng thực nhận

        // Kiểm tra dữ liệu đầu vào
        if (empty($telco) || empty($amount) || empty($code) || empty($serial)) {
            throw new Exception('Vui lòng điền đầy đủ thông tin thẻ cào.');
        }
        if (!isset($fees[$telco])) {
            throw new Exception('Loại thẻ không được hỗ trợ.');
        }
        if (empty($partner_id) || empty($partner_key)) {
            throw new Exception('Cấu hình API không hợp lệ.');
        }

        // Chuẩn bị dữ liệu gửi đến API
        $data = [
            'partner_id' => $partner_id,
            'telco' => $telco,
            'amount' => $amount,
            'code' => $code,
            'serial' => $serial,
            'request_id' => $request_id,
            'sign' => md5($partner_key . $code . $serial),
            'command' => 'charging'
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

        $db->begin_transaction();
        if ($result['status'] === '99') {
            $response = [
                'status' => 'success',
                'message' => 'Gửi thẻ thành công! Mệnh giá: ' . formatCurrencyF($result['amount']) . '. Thực nhận: ' . formatCurrencyF($real_amount) . '.',
                'amount' => formatCurrencyF($result['amount'])
            ];
            // Lưu giao dịch thành công
            $insert_data = [
                'user_id' => $user_id,
                'telco' => $telco,
                'amount' => $amount,
                'code' => $code,
                'serial' => $serial,
                'status' => 'pending',
                'message' => $response['message'],
                'request_id' => $request_id,
                'fee' => $fee,
                'real_amount' => $real_amount
            ];
            if (!$db->insert('card_transactions', $insert_data)) {
                $db->rollback();
                throw new Exception('Lỗi lưu giao dịch vào cơ sở dữ liệu.');
            }
            $db->commit();
        }
        if ($result["status"] == 3 && $result["message"] == "PENDING") {
            $response = [
                'status' => 'success',
                'message' => 'Gửi thẻ thành công! Mệnh giá: ' . formatCurrencyF($result['amount']) . '. Thực nhận: ' . formatCurrencyF($real_amount) . '.',
                'amount' => formatCurrencyF($result['amount'])
            ];
            // Lưu giao dịch thành công
            $insert_data = [
                'user_id' => $user_id,
                'telco' => $telco,
                'amount' => $amount,
                'code' => $code,
                'serial' => $serial,
                'status' => 'pending',
                'message' => $response['message'],
                'request_id' => $request_id,
                'fee' => $fee,
                'real_amount' => $real_amount
            ];
            if (!$db->insert('card_transactions', $insert_data)) {
                $db->rollback();
                throw new Exception('Lỗi lưu giao dịch vào cơ sở dữ liệu.');
            }
            $db->commit();
        } else {
            $db->rollback();
            throw new Exception(htmlspecialchars($result['message'] ?? 'Lỗi không xác định từ API.'));
        }
    } catch (Exception $e) {
        if ($db->in_transaction()) {
            $db->rollback();
        }
        $response = [
            'status' => 'error',
            'message' => $e->getMessage()
        ];
    } finally {
        $db->dis_connect();
    }
}

echo json_encode($response);
