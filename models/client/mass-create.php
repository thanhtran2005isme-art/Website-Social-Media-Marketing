<?php
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/libs/init.php');
header('Content-Type: application/json');

$response = [
    'success' => false,
    'message' => '',
    'errors' => [],
    'comment_counts' => [],
    'suggestion_counts' => [],
    'username_counts' => []
];

// Check user authentication
if (!isset($data_user['id'])) {
    $response['message'] = 'Vui lòng đăng nhập để đặt hàng.';
    echo json_encode($response);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['orders'])) {
    $user_id = $data_user['id'];
    $orders_input = trim($_POST['orders']);
    $errors = [];
    $success_count = 0;
    $total_price = 0;
    $valid_orders = [];
    $comment_counts = [];
    $suggestion_counts = [];
    $username_counts = [];

    // Split input into lines
    $order_lines = array_filter(array_map('trim', explode("\n", $orders_input)));

    if (empty($order_lines)) {
        $errors[] = 'Vui lòng nhập ít nhất một đơn hàng.';
    } else {
        // Validate all orders before transaction
        foreach ($order_lines as $index => $line) {
            $parts = array_map('trim', explode('|', $line));
            $line_number = $index + 1;

            // Validate format
            if (count($parts) < 3) {
                $errors[] = "Dòng $line_number: Định dạng không hợp lệ. Yêu cầu: service_id | link | quantity.";
                continue;
            }

            $service_id = Anti_xss($parts[0]);
            $link = Anti_xss($parts[1]);
            $quantity = Anti_xss($parts[2]);
            $comments = isset($parts[3]) ? Anti_xss($parts[3]) : '';
            $keywords = isset($parts[4]) ? Anti_xss($parts[4]) : '';

            // Validate service_id and fetch API provider details
            $service = $db->get_row("
                SELECT s.*, p.url, p.api_key 
                FROM `services` s 
                LEFT JOIN `api_providers` p ON s.api_provider_id = p.id 
                WHERE s.id = '{$service_id}' AND s.service_status = 1
            ");
            if (!$service || empty($service['url']) || empty($service['api_key'])) {
                $errors[] = "Dòng $line_number: Dịch vụ ID $service_id không tồn tại, không hoạt động hoặc thiếu thông tin nhà cung cấp API.";
                continue;
            }

            // Validate link
            if (!filter_var($link, FILTER_VALIDATE_URL)) {
                $errors[] = "Dòng $line_number: Link không hợp lệ.";
                continue;
            }

            // Validate quantity
            if (!is_numeric($quantity) || $quantity < $service['min_amount'] || $quantity > $service['max_amount']) {
                $errors[] = "Dòng $line_number: Số lượng phải từ {$service['min_amount']} đến {$service['max_amount']}.";
                continue;
            }

            // Calculate price
            $price = ($quantity / 1000) * $service['price'];

            // Validate based on service_type and input format
            $comment_count = 0;
            $suggestion_count = 0;
            $username_count = 0;
            $api_data = [];
            switch ($service['service_type']) {
                case 'Custom Comments':
                    if (!$comments) {
                        $errors[] = "Dòng $line_number: Dịch vụ yêu cầu danh sách bình luận.";
                        continue 2; // Skip to next order line
                    }
                    $comments_array = array_filter(array_map('trim', explode('/', $comments)));
                    if (empty($comments_array)) {
                        $errors[] = "Dòng $line_number: Bình luận không hợp lệ.";
                        continue 2;
                    }
                    $comment_count = count($comments_array);
                    if ($comment_count != $quantity) {
                        $errors[] = "Dòng $line_number: Số lượng bình luận ($comment_count) không khớp với số lượng chỉ định ($quantity).";
                        continue 2;
                    }
                    $comments = implode(PHP_EOL, $comments_array);
                    $api_data = ['comments' => $comments];
                    $comment_counts[] = ['line' => $line_number, 'comments' => $comment_count];
                    break;

                case 'Special':
                    if (!$comments) {
                        $errors[] = "Dòng $line_number: Dịch vụ yêu cầu danh sách gợi ý.";
                        continue 2;
                    }
                    $suggestions_array = array_filter(array_map('trim', explode('/', $comments)));
                    if (empty($suggestions_array)) {
                        $errors[] = "Dòng $line_number: Danh sách gợi ý không hợp lệ.";
                        continue 2;
                    }
                    $suggestion_count = count($suggestions_array);
                    foreach ($suggestions_array as $suggestion) {
                        if (empty($suggestion)) {
                            $errors[] = "Dòng $line_number: Gợi ý trống không hợp lệ.";
                            continue;
                        }
                    }
                    $list = implode('/', $suggestions_array);
                    $api_data = ['quantity' => $quantity, 'list' => $list];
                    if ($keywords) {

                        $keyword = trim($keywords);
                        if (empty($keyword)) {
                            $errors[] = "Dòng $line_number: Từ khóa tìm kiếm không hợp lệ.";
                            continue 2;
                        }
                        $api_data['keyword'] = $keyword;
                    }
                    $suggestion_counts[] = ['line' => $line_number, 'suggestions' => $suggestion_count];
                    break;

                case 'Mentions':
                case 'Comment Likes':
                    if (!$comments) {
                        $errors[] = "Dòng $line_number: Dịch vụ yêu cầu danh sách tên người dùng.";
                        continue 2;
                    }
                    $usernames_array = array_filter(array_map('trim', explode('/', $comments)));
                    if (empty($usernames_array)) {
                        $errors[] = "Dòng $line_number: Tên người dùng không hợp lệ.";
                        continue 2;
                    }
                    $username_count = count($usernames_array);
                    foreach ($usernames_array as $username) {
                        if (!preg_match('/^[a-zA-Z0-9._]+$/', $username)) {
                            $errors[] = "Dòng $line_number: Tên người dùng '$username' không hợp lệ.";
                            continue;
                        }
                    }
                    $usernames = implode('/', $usernames_array);
                    $api_data = ['quantity' => $quantity, 'usernames' => $usernames];
                    $username_counts[] = ['line' => $line_number, 'usernames' => $username_count];
                    break;

                case 'Mentions Hashtag':
                    if (!$keywords) {
                        $errors[] = "Dòng $line_number: Dịch vụ yêu cầu từ khóa tìm kiếm.";
                        continue 2;
                    }
                    $keyword = trim($keywords);
                    if (empty($keyword)) {
                        $errors[] = "Dòng $line_number: Từ khóa tìm kiếm không hợp lệ.";
                        continue 2;
                    }
                    $api_data = ['quantity' => $quantity, 'hashtag' => $keyword];
                    break;
                case 'Package':
                    $api_data = [];
                    if ($comments) {
                        $errors[] = "Dòng $line_number: Dịch vụ không hỗ trợ bình luận hoặc gợi ý.";
                        continue 2;
                    }
                    if ($keywords) {
                        $errors[] = "Dòng $line_number: Dịch vụ không hỗ trợ từ khóa.";
                        continue 2;
                    }
                    break;
                case 'Default':
                    $api_data = ['quantity' => $quantity];
                    if ($comments) {
                        $errors[] = "Dòng $line_number: Dịch vụ không hỗ trợ bình luận hoặc gợi ý.";
                        continue 2;
                    }
                    if ($keywords) {
                        $errors[] = "Dòng $line_number: Dịch vụ không hỗ trợ từ khóa.";
                        continue 2;
                    }
                    break;

                default:
                    $errors[] = "Dòng $line_number: Loại dịch vụ '{$service['service_type']}' không được hỗ trợ.";
                    continue 2;
            }


            $total_price += $price;
            if ($total_price > $data_user['balance']) {
                $errors[] = "Dòng $line_number: Số dư không đủ để đặt đơn hàng.";
                break;
            }


            // Store valid order data
            $valid_orders[] = [
                'user_id' => $user_id,
                'service_id' => $service_id,
                'category_id' => $service['category_id'],
                'link' => $link,
                'quantity' => $quantity,
                'price' => $price,
                'comments' => $comments ?: '',
                'keywords' => $keywords ?: '',
                'api_service_id' => $service['api_service_id'],
                'api_url' => $service['url'],
                'api_key' => $service['api_key'],
                'api_data' => $api_data
            ];
        }


        if (!empty($valid_orders)) {
            foreach ($valid_orders as $index => $order) {
                $line_number = $index + 1;
                try {
                    // Start transaction for this order
                    $db->begin_transaction();

                    // Check user balance
                    $userRow = $db->get_row("SELECT balance, version FROM users WHERE id = '{$user_id}' FOR UPDATE");
                    if (!$userRow) {
                        throw new Exception("Không thể truy xuất thông tin người dùng.");
                    }
                    if ($userRow['balance'] < $order['price']) {
                        $errors[] = "Dòng $line_number: Số dư không đủ để đặt đơn hàng này (cần " . formatCurrencyF($order['price']) . ", còn " . formatCurrencyF($userRow['balance']) . ").";
                        $db->rollback();
                        continue;
                    }
                    $requestHash = implode('|', [
                        $order['user_id'],
                        $order['service_id'],
                        $order['link'],
                        $order['quantity'],
                        $order['comments'],
                        $order['keywords'],
                        floor(time() / 30)
                    ]);

                    $existing_order = $db->get_row("SELECT id FROM orders WHERE request_hash = '{$requestHash}'");
                    if ($existing_order) {
                        $errors[] = "Line $line_number: Duplicate order detected.";
                        continue;
                    }

                    $smmPanel = new SmmPanel($order['api_url'], $order['api_key']);

                    $api_response = $smmPanel->placeOrder(
                        $order['api_service_id'],
                        $order['link'],
                        $order['api_data']
                    );

                    if (!$api_response || !isset($api_response['order'])) {
                        $error_msg = isset($api_response['error']) ? $api_response['error'] : 'Không thể tạo đơn hàng qua API.';
                        $errors[] = "Dòng $line_number: $error_msg (giá: " . formatCurrencyF($order['price']) . ")";
                        $db->rollback();
                        continue;
                    }



                    $order_data = [
                        'user_id' => $order['user_id'],
                        'service_id' => $order['service_id'],
                        'category_id' => $order['category_id'],
                        'link' => $order['link'],
                        'quantity' => $order['quantity'],
                        'status_description' => "order: {$api_response['order']}",
                        'price' => $order['price'],
                        'status' => 'pending',
                        'created_at' => gettime(),
                        'api_order_id' => $api_response['order'],
                        'comments' => $order['comments'],
                        'keywords' => $order['keywords'],
                        'request_hash' => hash('sha256', $requestHash)
                    ];

                    if (!$db->insert('orders', $order_data)) {
                        throw new Exception("Lỗi khi lưu đơn hàng vào cơ sở dữ liệu.");
                    }


                    $new_balance = $userRow['balance'] - $order['price'];
                    $new_version = $userRow['version'] + 1;
                    if (!$db->update('users', ['balance' => $new_balance, 'version' => $new_version], "id = '{$user_id}'")) {
                        throw new Exception("Lỗi khi cập nhật số dư.");
                    }


                    $db->commit();
                    $success_count++;
                    $total_price += $order['price'];
                } catch (Exception $e) {
                    $db->rollback();
                    $errors[] = "Dòng $line_number: " . $e->getMessage();
                }
            }
        }
    }

    $response['success'] = $success_count > 0;
    $response['message'] = $success_count > 0 ? "Đã đặt thành công $success_count đơn hàng!" : "Không có đơn hàng nào được đặt.";
    $response['errors'] = $errors;
    $response['comment_counts'] = $comment_counts;
    $response['suggestion_counts'] = $suggestion_counts;
    $response['username_counts'] = $username_counts;
}

echo json_encode($response);
exit;
