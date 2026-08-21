<?php
header('Content-Type: application/json');
require_once realpath($_SERVER['DOCUMENT_ROOT']) . '/libs/init.php';

$response = ['success' => false, 'message' => ''];

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    $response['message'] = 'Phương thức không được hỗ trợ';
    echo json_encode($response);
    exit;
}

$input = json_decode(file_get_contents('php://input'), true);

if (!$user) {
    $response['message'] = 'Chưa đăng nhập';
    echo json_encode($response);
    exit;
}


try {
    if ($general_data['status_demo'] == 1) {
        throw new Exception('Đây là trang web demo bạn không thể thực hiện thao tác');
    }
    // Start transaction
    $db->begin_transaction();

    if (isset($input['order_id']) && !empty($input['order_id'])) {
        // Single order update
        $order_id = Anti_xss($input['order_id']);

        // Get API credentials and api_order_id
        $credentials = getApiCredentials($order_id, $data_user['id']);
        if (!$credentials) {
            throw new Exception('Không tìm thấy thông tin API hoặc ID đơn hàng cho đơn hàng');
        }

        // Initialize SmmPanel
        $smmPanel = new SmmPanel($credentials['api_url'], $credentials['api_key']);

        // Check order status using api_order_id
        $apiResponse = $smmPanel->checkOrderStatus($credentials['api_order_id']);
        $newStatus = $apiResponse['status'] ?? 'Unknown';

        // Update local database
        $result = $db->update(
            'orders',
            ['status' => strtolower($newStatus)],
            "`id` = '$order_id' AND `user_id` = '{$data_user['id']}'"
        );

        if (!$result) {
            throw new Exception('Không thể cập nhật đơn hàng trong cơ sở dữ liệu');
        }

        // Commit transaction
        $db->commit();
        $response['success'] = true;
    } elseif (isset($input['order_ids']) && is_array($input['order_ids']) && !empty($input['order_ids'])) {
        // Bulk order update
        $order_ids = array_map('intval', $input['order_ids']);

        // Group orders by API provider
        $orders_by_provider = [];
        $order_id_to_api_order_id = [];

        foreach ($order_ids as $order_id) {
            $order_id = Anti_xss($order_id);
            $credentials = getApiCredentials($order_id, $data_user['id']);
            if (!$credentials) {
                throw new Exception("Không tìm thấy thông tin API hoặc ID đơn hàng cho đơn hàng #$order_id");
            }

            $provider_key = $credentials['api_url'] . '|' . $credentials['api_key'];
            $orders_by_provider[$provider_key][] = [
                'order_id' => $order_id,
                'api_order_id' => $credentials['api_order_id']
            ];
            $order_id_to_api_order_id[$order_id] = $credentials['api_order_id'];
        }

        // Process each provider's orders
        foreach ($orders_by_provider as $provider_key => $orders) {
            list($api_url, $api_key) = explode('|', $provider_key);
            $smmPanel = new SmmPanel($api_url, $api_key);

            // Collect api_order_ids
            $api_order_ids = array_map(fn($order) => $order['api_order_id'], $orders);

            // Call checkMultipleOrdersStatus
            $apiResponse = $smmPanel->checkMultipleOrdersStatus($api_order_ids);

            // Update each order
            foreach ($orders as $order) {
                $order_id = $order['order_id'];
                $api_order_id = $order['api_order_id'];

                if (!isset($apiResponse[$api_order_id])) {
                    throw new Exception("Không nhận được trạng thái cho đơn hàng #$order_id (API order #$api_order_id)");
                }

                $status_data = $apiResponse[$api_order_id];
                if (isset($status_data['error'])) {
                    throw new Exception("Lỗi API cho đơn hàng #$order_id: " . $status_data['error']);
                }

                $newStatus = $status_data['status'] ?? 'Unknown';

                // Update local database
                $result = $db->update(
                    'orders',
                    [
                        'status' => strtolower($newStatus),
                        'start_counter' => $status_data['start_count'] ?? '',
                        'remains' => $status_data['remains'] ?? ''
                    ],
                    "`id` = '$order_id' AND `user_id` = '{$data_user['id']}'"
                );

                if (!$result) {
                    throw new Exception("Không thể cập nhật đơn hàng #$order_id trong cơ sở dữ liệu");
                }
            }
        }

        // Commit transaction
        $db->commit();
        $response['success'] = true;
    } else {
        throw new Exception('Dữ liệu không hợp lệ');
    }
} catch (Exception $e) {
    // Rollback transaction on any error
    $db->rollback();
    $response['message'] = $e->getMessage();
}

echo json_encode($response);
