<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
date_default_timezone_set('Asia/Ho_Chi_Minh');

header('Content-Type: application/json');

try {
    if (php_sapi_name() !== 'cli' && $_SERVER['REQUEST_METHOD'] !== 'GET') {
        die(json_encode(['status' => 'error', 'msg' => 'Phương thức yêu cầu không hợp lệ!']));
    }
    $batch_size = 100;
    $updated_orders = [];
    $total_updated = 0;
    $offset = 0;
    $has_more_orders = true;
    while ($has_more_orders) {
        $db->begin_transaction();

        $sql = "SELECT o.id,o.refunded,o.quantity, o.api_order_id, o.service_id, o.status, o.price, o.user_id, s.api_provider_id, s.cancel
            FROM orders o
            JOIN services s ON o.service_id = s.id
            WHERE o.status IN ('pending', 'processing')
            LIMIT $batch_size OFFSET $offset";
        $orders = $db->get_list($sql);

        if (empty($orders)) {
            // $db->commit();
            // die(json_encode(['status' => 'success', 'msg' => 'Không có đơn hàng nào cần cập nhật!']));
            $db->commit();
            $has_more_orders = false;
            break;
        }

        $api_providers = [];
        $orders_by_provider = [];

        // Group orders by api_provider_id
        foreach ($orders as $order) {
            $api_provider_id = $order['api_provider_id'];
            if (!isset($api_providers[$api_provider_id])) {
                $sql = "SELECT url, api_key FROM api_providers WHERE id = '" . Anti_xss($api_provider_id) . "'";
                $api_providers[$api_provider_id] = $db->get_row($sql);
                if (!$api_providers[$api_provider_id]) {
                    error_log("Order {$order['id']}: API provider {$api_provider_id} not found");
                    continue;
                }
            }
            $orders_by_provider[$api_provider_id][] = $order;
        }

        $updated_orders = [];

        // Process each provider's orders
        foreach ($orders_by_provider as $api_provider_id => $provider_orders) {
            $url = $api_providers[$api_provider_id]['url'];
            $api_key = $api_providers[$api_provider_id]['api_key'];
            $smm_panel = new SmmPanel($url, $api_key);

            // Collect api_order_ids
            $order_ids = array_map(fn($order) => $order['api_order_id'], $provider_orders);

            try {
                // Call checkMultipleOrdersStatus
                $status_data = $smm_panel->checkMultipleOrdersStatus($order_ids);

                foreach ($provider_orders as $order) {
                    $order_id = $order['id'];
                    $api_order_id = $order['api_order_id'];

                    // Check if status data exists for this order
                    if (!isset($status_data[$api_order_id])) {
                        error_log("Order {$order_id}: No status data returned for API order {$api_order_id}");
                        continue;
                    }

                    $order_status = $status_data[$api_order_id];

                    if (isset($order_status['error'])) {
                        error_log("Order {$order_id}: API error - " . $order_status['error']);
                        continue;
                    }

                    $new_status = $order['status'];
                    $status_description = isset($order_status['status']) ? "API Status: {$order_status['status']}" : 'No status provided';

                    if (isset($order_status['status'])) {
                        switch (strtolower($order_status['status'])) {
                            case 'completed':
                            case 'complated':
                                $new_status = 'completed';
                                break;
                            case 'pending':
                                $new_status = 'pending';
                                break;
                            case 'processing':
                            case 'inprogress':
                            case 'in progress':
                                $new_status = 'processing';
                                break;
                            case 'canceled':
                            case 'cancelled':
                                $new_status = 'canceled';
                                break;
                            case 'failed':
                            case 'error':
                                $new_status = 'failed';
                                break;
                            case 'partial':
                                $new_status = 'partial';
                                $status_description .= isset($order_status['remains']) ? "; Remains: {$order_status['remains']}" : '';
                                break;
                            default:
                                $new_status = 'unknown';
                                $status_description = "API Status: Unknown ({$order_status['status']})";
                        }
                    }

                    $update_data = [
                        'status' => $new_status,
                        'status_description' => $status_description,
                        'updated_at' => gettime(),
                        'note' => isset($order_status['note']) ? trim(htmlspecialchars(addslashes($order_status['note']))) : '',
                        'start_counter' => isset($order_status['start_count']) ? (int)$order_status['start_count'] : '',
                        'remains' => isset($order_status['remains']) ? (int)$order_status['remains'] : '',
                        'updated_at' => gettime()
                    ];

                    if ($new_status !== $order['status'] || isset($order_status['charge']) || isset($order_status['start_count']) || isset($order_status['remains'])) {
                        $where = "id = '" . Anti_xss($order['id']) . "'";
                        $db->update('orders', $update_data, $where);

                        if ($new_status === 'canceled' || $new_status === 'partial' && isset($order['cancel']) && $order['cancel'] == 1) {
                            try {
                                if ($order['refunded'] == 1) {
                                    continue;
                                }
                                if ($order['price'] <= 0 || $order['quantity'] <= 0) {
                                    continue;
                                }

                                $totalRefund = 0;
                                if ($new_status === 'canceled') {
                                    $totalRefund = $order['price'];
                                } elseif ($new_status === 'partial') {
                                    $remains = (int) ($order_status['remains'] ?? 0);
                                    $remains = min($remains, $order['quantity']);
                                    $remains = max($remains, 0);
                                    $totalRefund = ($order['quantity'] > 0 && $remains > 0)
                                        ? ($order['price'] / $order['quantity']) * $remains
                                        : 0;
                                }

                                if ($totalRefund <= 0) {
                                    continue;
                                }

                                $user_id = $order['user_id'];

                                $sql = "UPDATE users SET balance = balance + " . ($totalRefund) . " WHERE id = '" . ($user_id) . "'";
                                $db->query($sql);

                                $trx_id = generateOrderNumber();
                                $transaction_data = [
                                    'trx_id' => $trx_id,
                                    'user_id' => $user_id,
                                    'trx_type' => '+',
                                    'amount' => $totalRefund,
                                    'remarks' => "Refund for $new_status order $order_id",
                                    'charge' => 0,
                                    'created_at' => gettime(),
                                    'updated_at' => gettime()
                                ];

                                $db->insert("transactions", $transaction_data);
                                $db->update('orders', ['status' => 'refund', 'refunded' => 1], "id = '" . Anti_xss($order['id']) . "'");
                            } catch (Exception $e) {
                                error_log("Failed to refund for order $order_id: " . $e->getMessage());
                            }
                        }

                        $updated_orders[] = [
                            'order_id' => $order['id'],
                            'api_order_id' => $order['api_order_id'],
                            'new_status' => $new_status,
                            'description' => $status_description,
                            'note' => $status_description,
                            'start_counter' => isset($update_data['start_count']) ? $update_data['start_count'] : '',
                            'remains' => isset($update_data['remains']) ? $update_data['remains'] : ''
                        ];
                        $total_updated++;
                    }
                }
            } catch (Exception $e) {
                error_log("Failed to check multiple orders status for provider {$api_provider_id}: " . $e->getMessage());
                continue;
            }
        }
        $db->commit();
        $offset += $batch_size;
    }
  
    die(json_encode([
        'status' => 'success',
        'msg' => 'Cập nhật trạng thái đơn hàng hoàn tất!',
        'data' => [
            'updated_orders' => $updated_orders,
            'total_updated' => count($updated_orders)
        ]
    ], JSON_UNESCAPED_UNICODE));
} catch (Exception $e) {
    $db->rollback();
    error_log("CheckStatus Error: {$e->getMessage()}");
    die(json_encode([
        'status' => 'error',
        'msg' => 'Lỗi hệ thống: ' . $e->getMessage()
    ], JSON_UNESCAPED_UNICODE));
}
