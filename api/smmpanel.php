<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
header("Access-Control-Allow-Origin: *"); // Cho phép tất cả các miền
header("Access-Control-Allow-Methods: GET, POST, OPTIONS"); // Cho phép các phương thức GET, POST, OPTIONS
header("Access-Control-Allow-Headers: Authorization, Content-Type"); // Cho phép các tiêu đề tùy chỉnh, chẳng hạn như
header('Content-Type: application/json; charset=utf-8');

function error_response($message)
{
    return json_encode(['status' => 'error', 'error' => $message]);
}

// Hàm kiểm tra API Key
function check_api_key($db, $key)
{
    return $db->get_row("SELECT * FROM users WHERE api_token = '" . Anti_xss($key) . "'");
}

// Đọc input từ x-www-form-urlencoded
if ($_SERVER['REQUEST_METHOD'] !== 'POST' && $_SERVER['REQUEST_METHOD'] !== 'GET') {
    echo error_response('Method not allowed');
    exit;
}

$input = $_REQUEST;

if (!$input || !isset($input['key']) || !isset($input['action'])) {
    $services = $db->get_list("
            SELECT
                s.api_service_id AS service,
                s.service_title AS name,
                c.category_title AS category,
                sm.name AS platform,
                s.price AS rate,
                s.min_amount AS min,
                s.max_amount AS max,
                s.service_type AS type,
                s.refill,
                s.cancel
            FROM services s
            LEFT JOIN categories c ON s.category_id = c.id
            LEFT JOIN social_media sm ON c.social_media_id = sm.id
        ");
    // Convert refill and cancel to boolean
    foreach ($services as &$service) {
        $service['refill'] = (bool)$service['refill'];
        $service['cancel'] = (bool)$service['cancel'];
    }
    echo json_encode($services);
    exit;
}
if (!$input || !isset($input['key']) || !isset($input['action'])) {
    echo error_response('Missing parameters');
    exit;
}
$key = Anti_xss($input['key']);
$action = Anti_xss($input['action']);

// Kiểm tra API Key
$user = check_api_key($db, $key);
if (!$user) {
    echo error_response('Invalid API key');
    exit;
}

// Xử lý các action
switch ($action) {
    case 'services':
        $services = $db->get_list("
            SELECT
                s.api_service_id AS service,
                s.service_title AS name,
                c.category_title AS category,
                sm.name AS platform,
                s.price AS rate,
                s.min_amount AS min,
                s.max_amount AS max,
                s.service_type AS type,
                s.refill,
                s.cancel
            FROM services s
            LEFT JOIN categories c ON s.category_id = c.id
            LEFT JOIN social_media sm ON c.social_media_id = sm.id
        ");
        // Convert refill and cancel to boolean
        foreach ($services as &$service) {
            $service['refill'] = (bool)$service['refill'];
            $service['cancel'] = (bool)$service['cancel'];
        }
        echo json_encode($services);
        break;

    case 'add':
        if (!isset($input['service']) || !isset($input['link'])) {
            echo error_response('Missing parameters');
            exit;
        }
        $service_id = (int)Anti_xss($input['service']);
        $link = Anti_xss($input['link']);

        // Kiểm tra dịch vụ
        $service = $db->get_row("SELECT * FROM services WHERE api_service_id = '{$service_id}'");
        if (!$service) {
            echo error_response('Invalid service');
            exit;
        }
        $apiProvider = $db->get_row("SELECT * FROM api_providers WHERE id = '{$service['api_provider_id']}' LIMIT 1");
        if (!$apiProvider) {
            echo error_response('API provider is not available');
            exit;
        }

        $smm = new SmmPanel($apiProvider['url'], $apiProvider['api_key']);

        // Xử lý theo type dịch vụ
        $type = strtolower($service['service_type']);
        $quantity = isset($input['quantity']) ? (int)Anti_xss($input['quantity']) : 0;
        $extra_params = [];

        switch ($type) {
            case 'default':
                if ($quantity < $service['min_amount'] || $quantity > $service['max_amount']) {
                    echo error_response("Quantity must be between {$service['min_amount']} and {$service['max_amount']}");
                    exit;
                }
                break;
            case 'custom comments':
                if (!isset($input['comments']) || empty($input['comments'])) {
                    echo error_response('Missing comments');
                    exit;
                }
                // Preprocess comments: replace literal \n with actual newlines
                $comments_input = str_replace('\\n', "\n", $input['comments']);
                // Normalize newlines (\r\n or \r to \n)
                $comments_input = preg_replace("/\r\n|\r/", "\n", $comments_input);
                // Split, trim, and filter comments
                $comments = array_filter(array_map('trim', explode("\n", $comments_input)));
                $quantity = count($comments); // Set quantity as the number of comments
                if ($quantity < $service['min_amount'] || $quantity > $service['max_amount']) {
                    echo error_response("Number of comments must be between {$service['min_amount']} and {$service['max_amount']}");
                    exit;
                }
                $extra_params['comments'] = $input['comments'];
                break;
            case 'mentions':
                if (!isset($input['usernames']) || empty($input['usernames'])) {
                    echo error_response('Missing usernames');
                    exit;
                }
                $extra_params['usernames'] = $input['usernames'];
                if ($quantity < $service['min_amount'] || $quantity > $service['max_amount']) {
                    echo error_response("Quantity must be between {$service['min_amount']} and {$service['max_amount']}");
                    exit;
                }
                break;
            case 'mentions hashtag':
                if (!isset($input['hashtags']) || empty($input['hashtags'])) {
                    echo error_response('Missing hashtags');
                    exit;
                }
                $extra_params['hashtags'] = $input['hashtags'];
                if ($quantity < $service['min_amount'] || $quantity > $service['max_amount']) {
                    echo error_response("Quantity must be between {$service['min_amount']} and {$service['max_amount']}");
                    exit;
                }
                break;
            case 'comment likes':
                if (!isset($input['comment_id']) || empty($input['comment_id'])) {
                    echo error_response('Missing comment_id');
                    exit;
                }
                $extra_params['comment_id'] = $input['comment_id'];
                if ($quantity < $service['min_amount'] || $quantity > $service['max_amount']) {
                    echo error_response("Quantity must be between {$service['min_amount']} and {$service['max_amount']}");
                    exit;
                }
                break;
            case 'package':
                // Package không cần quantity
                $quantity = 0;
                break;
            case 'special':
                if (!isset($input['keywords']) || empty($input['keywords'])) {
                    echo error_response('Missing keywords');
                    exit;
                }
                $extra_params['keywords'] = $input['keywords'];
                if ($quantity < $service['min_amount'] || $quantity > $service['max_amount']) {
                    echo error_response("Quantity must be between {$service['min_amount']} and {$service['max_amount']}");
                    exit;
                }
                break;
            default:
                echo error_response('Invalid service type');
                exit;
        }

        // Tính phí
        $charge = ($type === 'package') ? $service['price'] : ($quantity / 1000) * $service['price'];
        if ($user['balance'] < $charge) {
            echo error_response('Insufficient balance');
            exit;
        }

        // Bắt đầu transaction
        $db->begin_transaction();
        try {
            // Trừ số dư
            $db->tru('users', 'balance', $charge, "id = {$user['id']}");

            // Thêm đơn hàng
            $order_data = [
                'user_id' => $user['id'],
                'service_id' => $service_id,
                'category_id' => $service['category_id'],
                'link' => $link,
                'quantity' => $quantity,
                'status' => 'Pending',
                'charge' => $charge,
                'price' => $charge,
                'start_counter' => 0,
                'remains' => $quantity,
                'created_at' => gettime()
            ];
            if (!$db->insert('orders', $order_data)) {
                throw new Exception('Failed to create order');
            }
            $order_id = $db->get_id_insert();

            // Prepare extra data for SMM API
            $smm_extra_data = [];
            if ($type === 'custom_comments') {
                $smm_extra_data['comments'] = $extra_params['comments'];
            } elseif ($type === 'mentions') {
                $smm_extra_data['usernames'] = $extra_params['usernames'];
            } elseif ($type === 'mentions_hashtag') {
                $smm_extra_data['hashtags'] = $extra_params['hashtags'];
            } elseif ($type === 'comment_likes') {
                $smm_extra_data['comment_id'] = $extra_params['comment_id'];
            } elseif ($type === 'special') {
                $smm_extra_data['keywords'] = $extra_params['keywords'];
            }

            // Add quantity if not a package
            if ($type !== 'package') {
                $smm_extra_data['quantity'] = $quantity;
            }

            // Send order to SMM Panel API
            $smm_response = $smm->placeOrder($service_id, $link, $smm_extra_data);

            // Check if SMM API returned an order ID
            if (!isset($smm_response['order'])) {
                throw new Exception('Failed to place order on SMM Panel: ' . json_encode($smm_response));
            }

            // Store SMM order ID in database
            $db->update('orders', ['api_order_id' => $smm_response['order']], "id = $order_id");

            // Commit transaction
            $db->commit();
            echo json_encode(['status' => 'success', 'order' => $order_id]);
        } catch (Exception $e) {
            $db->rollback();
            echo error_response($e->getMessage());
        }
        break;

    case 'status':
        if (!isset($input['order']) && !isset($input['orders'])) {
            echo error_response('Missing order or orders parameter');
            exit;
        }
        if (isset($input['order'])) {
            $order_id = (int)$input['order'];
            $order = $db->get_row("SELECT status, charge, start_counter as start_count, remains FROM orders WHERE id = $order_id AND user_id = {$user['id']}");
            if (!$order) {
                echo error_response('Incorrect order ID');
                exit;
            }
            echo json_encode($order);
        } else {
            $order_ids = explode(',', $input['orders']);
            $order_ids = array_map('intval', $order_ids);
            $order_ids_str = implode(',', $order_ids);
            $orders = $db->get_list("SELECT id, status, charge, start_counter as start_count, remains FROM orders WHERE id IN ($order_ids_str) AND user_id = {$user['id']}");
            $result = [];
            foreach ($orders as $order) {
                $result[$order['id']] = [
                    'status' => $order['status'],
                    'charge' => $order['charge'],
                    'start_count' => $order['start_count'],
                    'remains' => $order['remains']
                ];
            }
            echo json_encode($result);
        }
        break;

    case 'balance':
        echo json_encode([
            'status' => 'success',
            'balance' => $user['balance'],
            'currency' => 'VND'
        ]);
        break;

    case 'refill':
        if (!isset($input['order'])) {
            echo error_response('Missing order parameter');
            exit;
        }
        $order_id = (int)$input['order'];

        // Kiểm tra đơn hàng
        $order = $db->get_row("SELECT o.*, s.refill,s.is_refill_automatic, s.api_provider_id FROM orders o JOIN services s ON o.service_id = s.api_service_id WHERE o.id = $order_id AND o.user_id = {$user['id']}");
        if (!$order) {
            echo error_response('Incorrect order ID');
            exit;
        }
        if (!$order['refill']) {
            echo error_response('Service does not support refill');
            exit;
        }
        if ($order['status'] == 'completed' && !isset($order['refill_status']) || $order['refill_status'] == "completed" || $order['refill_status'] == "partial" || $order['refill_status'] == "canceled" || $order['refill_status'] == "refunded") {
            if ($order['is_refill_automatic'] == 1) {
                $apiProvider = $db->get_row("SELECT * FROM api_providers WHERE id = '{$order['api_provider_id']}' LIMIT 1");
                if (!$apiProvider) {
                    echo error_response('API provider is not available');
                    exit;
                }
                $smm = new SmmPanel($apiProvider['url'], $apiProvider['api_key']);

                // Bắt đầu transaction
                $db->begin_transaction();
                try {
                    $smm_response = $smm->createRefill($order['api_order_id']);
                    if (!isset($smm_response['refill'])) {
                        throw new Exception('You are not eligible to send refill request');
                    }
                    $db->update('orders', ['api_refill_id' => $smm_response['refill'], 'refill_status' => 'awaiting', 'refilled_at' => gettime()], "id = '{$order['id']}'");

                    $db->commit();
                    echo json_encode(['status' => 'success', 'refill' => $order['id']]);
                } catch (Exception $e) {
                    $db->rollback();
                    echo error_response($e->getMessage());
                }
            } else {
                $db->update('orders', ['refill_status' => 'awaiting', 'refilled_at' => gettime()], "id = '{$order['id']}'");
            }
        } else {
            echo error_response('Order is not eligible for refill');
            exit;
        }
        break;

    case 'multiple_refill':
        if (!isset($input['orders'])) {
            echo error_response('Missing orders parameter');
            exit;
        }
        $order_ids = array_map('intval', explode(',', $input['orders']));
        if (empty($order_ids)) {
            echo error_response('Invalid orders parameter');
            exit;
        }
        if (count($order_ids) > 100) {
            echo error_response('Maximum 100 orders allowed for multiple refill');
            exit;
        }

        // Fetch orders with refill eligibility
        $orders = $db->get_list("
                SELECT o.*, s.refill, s.is_refill_automatic, s.api_provider_id
                FROM orders o
                JOIN services s ON o.service_id = s.api_service_id
                WHERE o.id IN (" . implode(',', $order_ids) . ") AND o.user_id = {$user['id']}
            ");
        if (count($orders) !== count($order_ids)) {
            echo error_response('One or more order IDs are invalid');
            exit;
        }

        // Validate orders for refill eligibility
        $refill_requests = [];
        foreach ($orders as $order) {
            if (!$order['refill']) {
                echo error_response("Service for order {$order['id']} does not support refill");
                exit;
            }
            if ($order['status'] !== 'completed' || (isset($order['refill_status']) && in_array($order['refill_status'], ['completed', 'partial', 'canceled', 'refunded']))) {
                echo error_response("Order {$order['id']} is not eligible for refill");
                exit;
            }
            $refill_requests[] = [
                'order_id' => $order['id'],
                'api_order_id' => $order['api_order_id'],
                'is_refill_automatic' => $order['is_refill_automatic'],
                'api_provider_id' => $order['api_provider_id']
            ];
        }

        // Ensure all orders use the same API provider
        $api_provider_ids = array_unique(array_column($refill_requests, 'api_provider_id'));
        if (count($api_provider_ids) > 1) {
            echo error_response('Orders must use the same API provider for multiple refill');
            exit;
        }

        // Fetch API provider
        $apiProvider = $db->get_row("SELECT * FROM api_providers WHERE id = '{$refill_requests[0]['api_provider_id']}' LIMIT 1");
        if (!$apiProvider) {
            echo error_response('API provider is not available');
            exit;
        }

        $smm = new SmmPanel($apiProvider['url'], $apiProvider['api_key']);

        // Begin transaction
        $db->begin_transaction();
        try {
            $updated_order_ids = [];
            foreach ($refill_requests as $request) {
                $update_data = [
                    'refill_status' => 'awaiting',
                    'refilled_at' => gettime()
                ];

                if ($request['is_refill_automatic']) {
                    // Automatic refill: Send to SMM Panel
                    $smm_response = $smm->createRefill($request['api_order_id']);
                    if (!isset($smm_response['refill'])) {
                        throw new Exception("Failed to create refill for order {$request['order_id']}: " . json_encode($smm_response));
                    }
                    $update_data['api_refill_id'] = $smm_response['refill'];
                }

                // Update order with refill status
                if (!$db->update('orders', $update_data, "id = '{$request['order_id']}'")) {
                    throw new Exception("Failed to update refill status for order {$request['order_id']}");
                }
                $updated_order_ids[] = $request['order_id'];
            }

            // Commit transaction
            $db->commit();
            echo json_encode(['status' => 'success', 'orders' => $updated_order_ids]);
        } catch (Exception $e) {
            $db->rollback();
            echo error_response($e->getMessage());
        }
        break;

    case 'refill_status':
        if (!isset($input['order'])) {
            echo error_response('Missing order parameter');
            exit;
        }
        $order_id = (int)$input['order'];

        // Fetch order with refill details
        $order = $db->get_row("
                SELECT o.*, s.refill, s.api_provider_id
                FROM orders o
                JOIN services s ON o.service_id = s.api_service_id
                WHERE o.id = $order_id AND o.user_id = {$user['id']}
            ");
        if (!$order) {
            echo error_response('Incorrect order ID');
            exit;
        }
        if (!$order['refill']) {
            echo error_response('Service does not support refill');
            exit;
        }
        if (!isset($order['refill_status']) || $order['refill_status'] !== 'awaiting') {
            echo error_response('No active refill request for this order');
            exit;
        }

        // Update status if automatic refill
        if ($order['api_refill_id']) {
            $apiProvider = $db->get_row("SELECT * FROM api_providers WHERE id = '{$order['api_provider_id']}' LIMIT 1");
            if (!$apiProvider) {
                echo error_response('API provider is not available');
                exit;
            }

            $smm = new SmmPanel($apiProvider['url'], $apiProvider['api_key']);
            $smm_response = $smm->getRefillStatus($order['api_refill_id']);
            if (isset($smm_response['status'])) {
                $db->update('orders', ['refill_status' => $smm_response['status']], "id = $order_id");
                $order['refill_status'] = $smm_response['status'];
            } else {
                echo error_response('Failed to fetch refill status from SMM Panel');
                exit;
            }
        }

        echo json_encode([
            'status' => 'success',
            'order' => $order_id,
            'refill_status' => $order['refill_status']
        ]);
        break;

    case 'multiple_refill_status':
        if (!isset($input['orders'])) {
            echo error_response('Missing orders parameter');
            exit;
        }
        $order_ids = array_map('intval', explode(',', $input['orders']));
        if (empty($order_ids)) {
            echo error_response('Invalid orders parameter');
            exit;
        }

        // Fetch orders with refill details
        $orders = $db->get_list("
                SELECT o.*, s.refill, s.api_provider_id
                FROM orders o
                JOIN services s ON o.service_id = s.api_service_id
                WHERE o.id IN (" . implode(',', $order_ids) . ") AND o.user_id = {$user['id']}
            ");
        if (count($orders) !== count($order_ids)) {
            echo error_response('One or more order IDs are invalid');
            exit;
        }

        // Validate orders for active refill requests
        $valid_orders = [];
        foreach ($orders as $order) {
            if (!$order['refill']) {
                echo error_response("Service for order {$order['id']} does not support refill");
                exit;
            }
            if (!isset($order['refill_status']) || $order['refill_status'] !== 'awaiting') {
                echo error_response("No active refill request for order {$order['id']}");
                exit;
            }
            $valid_orders[] = $order;
        }

        // Group orders by API provider for automatic refills
        $provider_orders = [];
        foreach ($valid_orders as $order) {
            if ($order['api_refill_id']) {
                $provider_orders[$order['api_provider_id']][] = $order;
            }
        }

        $result = [];
        foreach ($valid_orders as $order) {
            $result[$order['id']] = [
                'order' => $order['id'],
                'refill_status' => $order['refill_status']
            ];
        }

        // Update statuses for automatic refills
        foreach ($provider_orders as $api_provider_id => $orders) {
            $apiProvider = $db->get_row("SELECT * FROM api_providers WHERE id = '$api_provider_id' LIMIT 1");
            if (!$apiProvider) {
                echo error_response('API provider is not available');
                exit;
            }

            $smm = new SmmPanel($apiProvider['url'], $apiProvider['api_key']);
            $api_refill_ids = array_column($orders, 'api_refill_id');
            $smm_response = $smm->getMultipleRefillStatus($api_refill_ids);

            foreach ($orders as $order) {
                if (isset($smm_response[$order['api_refill_id']]['status'])) {
                    $new_status = $smm_response[$order['api_refill_id']]['status'];
                    $db->update('orders', ['refill_status' => $new_status], "id = {$order['id']}");
                    $result[$order['id']]['refill_status'] = $new_status;
                }
            }
        }

        echo json_encode(['status' => 'success', 'orders' => $result]);
        break;

    case 'cancel':
        if (!isset($input['order'])) {
            echo error_response('Missing order parameter');
            exit;
        }
        $order_id = (int)$input['order'];

        // Kiểm tra đơn hàng
        $order = $db->get_row("SELECT o.*, s.cancel, s.api_provider_id FROM orders o JOIN services s ON o.service_id = s.api_service_id WHERE o.id = $order_id AND o.user_id = {$user['id']}");
        if (!$order) {
            echo error_response('Incorrect order ID');
            exit;
        }
        if ($order['status'] !== 'pending' && $order['status'] !== 'processing') {
            echo error_response('Order is not eligible for cancellation');
            exit;
        }
        if (!$order['cancel']) {
            echo error_response('Service does not support cancellation');
            exit;
        }

        // Kiểm tra nhà cung cấp API
        $apiProvider = $db->get_row("SELECT * FROM api_providers WHERE id = '{$order['api_provider_id']}' LIMIT 1");
        if (!$apiProvider) {
            echo error_response('API provider is not available');
            exit;
        }

        $smm = new SmmPanel($apiProvider['url'], $apiProvider['api_key']);

        // Bắt đầu transaction
        $db->begin_transaction();
        try {
            // Gửi yêu cầu hủy đến SMM Panel
            $smm_response = $smm->cancelOrder($order['api_order_id']);
            if (!isset($smm_response['status']) || $smm_response['status'] !== 'success') {
                throw new Exception('Failed to cancel order on SMM Panel: ' . json_encode($smm_response));
            }

            // Cập nhật trạng thái đơn hàng
            $db->update('orders', ['status' => 'canceled'], "id = $order_id");

            // Hoàn tiền
            $db->cong('users', 'balance', $order['charge'], "id = {$user['id']}");

            // Commit transaction
            $db->commit();
            echo json_encode(['status' => 'success', 'order' => $order_id]);
        } catch (Exception $e) {
            $db->rollback();
            echo error_response($e->getMessage());
        }
        break;

    default:
        echo error_response('Invalid action');
        break;
}

$db->dis_connect();
