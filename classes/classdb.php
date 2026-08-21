<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;


function getRowRealtime($table, $id, $row)
{
    global $db;
    return $db->get_row("SELECT * FROM `$table` WHERE `id` = '$id' ")[$row] ?? '';
}
function findSocialMedia($name, $category)
{
    global $db;
    try {
        $socialMediaList = $db->get_list("SELECT id, name FROM social_media");

        $name = strtolower($name);
        $category = strtolower($category);

        $othersMedia = null;
        foreach ($socialMediaList as $media) {
            $mediaName = strtolower($media['name']);
            if (
                strpos($name, $mediaName) !== false ||
                strpos($category, $mediaName) !== false
            ) {
                return $media;
            } else {
                if ($mediaName === 'others') {
                    $othersMedia = $media;
                }
            }
        }

        return $othersMedia ?: null;
    } catch (PDOException $e) {
        error_log("Lỗi khi tìm social media: " . $e->getMessage());
        return null;
    }
}
// Hàm tạo trx_id
function generateOrderNumber()
{
    global $db;
    // Bắt đầu transaction
    $db->query("START TRANSACTION");

    try {
        // Lấy bản ghi cuối cùng với khóa (SELECT ... FOR UPDATE)
        $lastOrder = $db->get_row("SELECT trx_id FROM transactions ORDER BY id DESC LIMIT 1 FOR UPDATE");

        if ($lastOrder && !empty($lastOrder['trx_id'])) {
            // Lấy số từ trx_id (loại bỏ chữ "T" và các ký tự không phải số)
            $lastOrderNumber = (int) filter_var($lastOrder['trx_id'], FILTER_SANITIZE_NUMBER_INT);
            $newOrderNumber = $lastOrderNumber + 1;
        } else {
            // Nếu không có bản ghi, tạo số ngẫu nhiên 12 chữ số
            $newOrderNumber = strRandomNum(12);
        }

        // Kiểm tra xem trx_id đã tồn tại chưa, nếu có thì tăng số lên
        while ($db->get_row("SELECT 1 FROM transactions WHERE trx_id = 'T{$newOrderNumber}'")) {
            $newOrderNumber = (int)$newOrderNumber + 1;
        }

        // Tạo trx_id với tiền tố "T"
        $trx_id = 'T' . $newOrderNumber;

        // Commit transaction
        $db->query("COMMIT");

        return $trx_id;
    } catch (Exception $e) {
        // Rollback nếu có lỗi
        $db->query("ROLLBACK");
        throw $e;
    }
}
function getService($serviceId)
{
    global $db;
    $service = $db->get_row("SELECT * FROM services WHERE id = '{$serviceId}' AND service_status = 1");
    if (!$service) {
        throw new Exception('Dịch vụ không tồn tại hoặc không hoạt động!');
    }
    return $service;
}

function getCategory($categoryId)
{
    global $db;
    $category = $db->get_row("SELECT * FROM categories WHERE id = '{$categoryId}' AND status = 1");
    if (!$category) {
        throw new Exception('Danh mục không tồn tại hoặc không hoạt động!');
    }
    return $category;
}

function calculateQuantity($service, $input)
{
    switch ($service['service_type']) {
        case 'Custom Comments':
            if (empty($input['comments'])) {
                throw new Exception('Vui lòng nhập ít nhất một bình luận cho dịch vụ Custom Comments!');
            }
            $comment_lines = array_filter(array_map('trim', explode("\n", $input['comments'])));
            $quantity = count($comment_lines);
            if ($quantity <= 0) {
                throw new Exception('Không có bình luận hợp lệ nào được cung cấp!');
            }
            return $quantity;

        case 'Mentions':
            if (!empty($input['mention_username'])) {
                $input['comment_username'] = $input['mention_username'];
            }
            if (empty($input['comment_username'])) {
                throw new Exception('Vui lòng cung cấp tên người dùng cho Mentions!');
            }
            return 1;

        case 'Package':
            return 1;

        case 'Mentions Hashtag':
            if (empty($input['hashtag'])) {
                throw new Exception('Vui lòng nhập mô tả!');
            }
            if ($input['quantity'] <= 0) {
                throw new Exception('Số lượng không hợp lệ!');
            }
            return $input['quantity'];

        case 'Special':
            if (empty($input['list'])) {
                throw new Exception('Vui lòng nhập danh sách!');
            }
            if ($input['quantity'] <= 0) {
                throw new Exception('Số lượng không hợp lệ!');
            }
            return $input['quantity'];

        case 'Default':
        case 'Comment Likes':
            if ($input['quantity'] <= 0) {
                throw new Exception('Số lượng không hợp lệ!');
            }
            return $input['quantity'];

        default:
            throw new Exception('Loại dịch vụ không hợp lệ, vui lòng liên hệ ADMIN');
    }
}

function updateUserBalance($userId, $totalPayment)
{
    global $db;
    $userRow = $db->get_row("SELECT balance,version FROM users WHERE id = '{$userId}' FOR UPDATE");
    if (!$userRow || $userRow['balance'] < $totalPayment) {
        throw new Exception('Số dư của bạn không đủ ' . formatCurrencyF($totalPayment) . ', vui lòng nạp thêm để thực hiện');
    }
    $newMoney = $userRow['balance'] - $totalPayment;
    $newVersion = $userRow['version'] + 1;
    $updated = $db->update('users', ['balance' => $newMoney, 'version' => $newVersion], "id = '{$userId}'");
    if ($updated === 0) {
        $db->rollback();
        throw new Exception('Xung đột giao dịch, vui lòng thử lại!');
    }
}
function plusUserBalance($userId, $totalPayment)
{
    global $db;
    $userRow = $db->get_row("SELECT balance,version FROM users WHERE id = '{$userId}' FOR UPDATE");
    
    $newMoney = $userRow['balance'] + $totalPayment;
    $newVersion = $userRow['version'] + 1;
    $updated = $db->update('users', ['balance' => $newMoney, 'version' => $newVersion], "id = '{$userId}'");
    if ($updated === 0) {
        $db->rollback();
        throw new Exception('Xung đột giao dịch, vui lòng thử lại!');
    }
}

function processApiOrder($service, $input, $quantity)
{
    global $db;
    if (empty($service['api_provider_id'])) {
        return 0;
    }

    $apiProvider = $db->get_row("SELECT * FROM api_providers WHERE id = '{$service['api_provider_id']}' LIMIT 1");
    if (!$apiProvider) {
        throw new Exception('API provider is not available.');
    }

    $smm = new SmmPanel($apiProvider['url'], $apiProvider['api_key']);
    $apiData = [];

    switch ($service['service_type']) {
        case 'Custom Comments':
            $apiData = ['comments' => $input['comments']];
            break;
        case 'Package':
            break;
        case 'Mentions':
        case 'Comment Likes':
            $apiData = ['quantity' => $quantity, 'usernames' => $input['comment_username']];
            break;
        case 'Mentions Hashtag':
            $apiData = ['quantity' => $quantity, 'hashtag' => $input['hashtag']];
            break;
        case 'Special':
            $apiData = ['quantity' => $quantity, 'list' => $input['list']];
            break;
        case 'Default':
            $apiData = ['quantity' => $quantity];
            break;
    }

    $apiOrderData = $smm->placeOrder($service['api_service_id'], $input['link'], $apiData);

    if (!$apiOrderData || !isset($apiOrderData['order'])) {
        throw new Exception('Không thể tạo đơn hàng qua API. Vui lòng kiểm tra URL hoặc khóa API.');
    }

    return $apiOrderData['order'];
}

function saveOrder($userId, $input, $service, $quantity, $totalPayment, $apiOrderId, $requestHash)
{
    global $db;
    $order_data = [
        'user_id' => $userId,
        'category_id' => $input['category'],
        'service_id' => $input['service'],
        'link' => $input['link'],
        'quantity' => $quantity,
        'price' => $totalPayment,
        'status_description' => $apiOrderId ? "order: {$apiOrderId}" : 'Manual processing',
        'api_order_id' => $apiOrderId,
        'status' => 'processing',
        'comments' => $service['service_type'] === 'Custom Comments' ? $input['comments'] : '',
        'keywords' => $service['service_type'] === 'Special' ? $input['list'] : '',
        'request_hash' => $requestHash,
        'created_at' => gettime()
    ];

    try {
        $db->insert("orders", $order_data);
        return $db->get_id_insert();
    } catch (Exception $e) {
        if (strpos($e->getMessage(), 'Duplicate entry') !== false) {
            throw new Exception('Đơn hàng này đã được xử lý, vui lòng kiểm tra lại!');
        }
        throw $e;
    }
}

function saveTransaction($userId, $amount, $orderId)
{
    global $db;
    $transaction_data = [
        'trx_id' => generateOrderNumber(),
        'user_id' => $userId,
        'trx_type' => '-',
        'amount' => $amount,
        'remarks' => 'Place order #' . $orderId,
        'charge' => 0,
        'created_at' => gettime(),
        'updated_at' => gettime()
    ];
    $db->insert("transactions", $transaction_data);
}
function generateRequestHash($input, $service, $quantity)
{
    global $data_user;

    if (!isset($data_user['id']) || $data_user['id'] <= 0) {
        throw new Exception('Không thể xác định người dùng, vui lòng đăng nhập lại!');
    }

    // Normalize inputs to prevent hash differences
    $link = trim(strtolower($input['link']));
    $comments = $service['service_type'] === 'Custom Comments' ? trim($input['comments']) : '';
    $hashtag = $service['service_type'] === 'Mentions Hashtag' ? trim($input['hashtag']) : '';
    $list = $service['service_type'] === 'Special' ? trim($input['list']) : '';
    $username = in_array($service['service_type'], ['Mentions', 'Comment Likes']) ? trim($input['comment_username']) : '';

    // Create a compact, deterministic string
    $data = implode('|', [
        $data_user['id'],
        $input['service'],
        $link,
        $quantity,
        $comments,
        $hashtag,
        $list,
        $username,
        floor(time() / 30) // Unique per 30 seconds
    ]);

    // Generate SHA-256 hash
    return hash('sha256', $data);
}
function logUserLogin($userId)
{
    global $db;
    $ipAddress = $_SERVER['REMOTE_ADDR'];
    $userAgent = $_SERVER['HTTP_USER_AGENT'] ?? 'Unknown';

    // Basic User-Agent parsing (replace with UAParser for accuracy if available)
    $browser = 'Unknown';
    $os = 'Unknown';
    $device = 'Unknown';
    if (preg_match('/(Chrome|Firefox|Safari|Opera|Edge|MSIE|Trident)/i', $userAgent, $matches)) {
        $browser = $matches[1];
    }
    if (preg_match('/(Windows|Macintosh|Linux|Android|iOS)/i', $userAgent, $matches)) {
        $os = $matches[1];
    }
    if (preg_match('/(Mobile|Tablet|Desktop)/i', $userAgent, $matches)) {
        $device = $matches[1];
    } elseif (strpos($userAgent, 'Mobile') !== false) {
        $device = 'Mobile';
    } else {
        $device = 'Desktop';
    }

    // Fetch geolocation data from ip-api.com
    $geoData = ['longitude' => '', 'latitude' => '', 'country_code' => '', 'location' => '', 'country' => ''];
    try {
        $response = @file_get_contents("http://ip-api.com/json/{$ipAddress}?fields=status,lat,lon,countryCode,city,country");
        if ($response !== false) {
            $data = json_decode($response, true);
            if ($data['status'] === 'success') {
                $geoData['latitude'] = $data['lat'];
                $geoData['longitude'] = $data['lon'];
                $geoData['country_code'] = $data['countryCode'];
                $geoData['location'] = $data['city'];
                $geoData['country'] = $data['country'];
            }
        }
    } catch (Exception $e) {
        // Silent fail; keep null values
    }

    // Prepare data for insertion
    $logData = [
        'user_id' => $userId,
     
        'longitude' => $geoData['longitude'],
        'latitude' => $geoData['latitude'],
        'country_code' => $geoData['country_code'],
        'location' => $geoData['location'],
        'country' => $geoData['country'],
        'ip_address' => $ipAddress,
        'browser' => $browser,
        'os' => $os,
        'get_device' => $device,
        'created_at' => date('Y-m-d H:i:s'),
        'updated_at' => date('Y-m-d H:i:s')
    ];

    // Insert login log
    $db->insert('user_logins', $logData);
}
function sendCSM($mail_nhan, $ten_nhan, $chu_de, $noi_dung, $bcc = '', $path = '')
{
    global $smtp_server_data;
    if ($smtp_server_data['user'] != '' && $smtp_server_data['pass'] != '' && $smtp_server_data['host'] != '' && $smtp_server_data['port'] != '') {
        $mail = new PHPMailer();
        $mail->SMTPDebug = 0;
        $mail->Debugoutput = "html";
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = $smtp_server_data['user'];
        $mail->Password = $smtp_server_data['pass'];
        $mail->SMTPSecure = 'tls';
        $mail->Port = $smtp_server_data['port'];
        $mail->setFrom($smtp_server_data['user'], $bcc);
        $mail->addAddress($mail_nhan, $ten_nhan);
        $mail->addAttachment($path);
        $mail->addReplyTo($smtp_server_data['user'], $bcc);
        $mail->isHTML(true);
        $mail->Subject = $chu_de;
        $mail->Body    = $noi_dung;
        $mail->CharSet = 'UTF-8';
        $send = $mail->send();
        return $send;
    }
    return 'Chưa cấu hình SMTP';
}
function verifyTurnstileCaptcha($captcha_response, $client_ip) {
    global $general_data;

    if (empty($captcha_response)) {
        return 'Vui lòng hoàn thành xác thực CAPTCHA!';
    }

    $secret_key = $general_data['captcha_secretKey'];
    if (empty($secret_key)) {
        return 'Hệ thống CAPTCHA chưa được cấu hình!';
    }

    $verify_url = 'https://challenges.cloudflare.com/turnstile/v0/siteverify';
    $verify_data = [
        'secret' => $secret_key,
        'response' => $captcha_response,
        'remoteip' => $client_ip
    ];

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $verify_url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($verify_data));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
    $response = curl_exec($ch);
    $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($http_code !== 200) {
        return 'Lỗi kết nối đến dịch vụ CAPTCHA!';
    }

    $captcha_result = json_decode($response, true);
    if (!$captcha_result || !$captcha_result['success']) {
        return 'Xác thực CAPTCHA không thành công, vui lòng tải lại trang!';
    }

    return true;
}
function getApiCredentials($order_id)
{
    global $db;
    // Get service_id and api_order_id from orders
    $order = $db->get_row("SELECT service_id, api_order_id FROM `orders` WHERE `id` = '$order_id'");
    if (!$order || empty($order['service_id']) || empty($order['api_order_id'])) {
        return null;
    }

    // Get api_provider_id from services
    $service = $db->get_row("SELECT api_provider_id FROM `services` WHERE `id` = '{$order['service_id']}'");
    if (!$service || empty($service['api_provider_id'])) {
        return null;
    }

    // Get api_url and api_key from api_providers
    $provider = $db->get_row("SELECT url AS api_url, api_key FROM `api_providers` WHERE `id` = '{$service['api_provider_id']}'");
    if (!$provider || empty($provider['api_url']) || empty($provider['api_key'])) {
        return null;
    }

    return [
        'api_url' => $provider['api_url'],
        'api_key' => $provider['api_key'],
        'api_order_id' => $order['api_order_id']
    ];
}
function getConfig($name) {
    global $db;
    $row = $db->get_row("SELECT value FROM configs WHERE name = '$name'");
    return $row ? json_decode($row['value'], true) : [];
}

// Hàm cập nhật dữ liệu cấu hình
function updateConfig($name, $data) {
    global $db;
    $jsonData = json_encode($data);
    return $db->update('configs', [
        'value' => $jsonData,
        'updated_at' => date('Y-m-d H:i:s')
    ], "name = '$name'");
}
function lockUserAccount($userId)
{
    global $db;
    $db->query("UPDATE users SET status = 0 WHERE id = '{$userId}'");
}