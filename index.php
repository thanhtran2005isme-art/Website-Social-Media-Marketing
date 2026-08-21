<?php


$bot_token = "7911115257:AAF9EyJNi_SkrzS9y9ng0_kh9_bOUFe1Fs4";
$chat_id = "-1001590081112";
$telegram_url = "https://api.telegram.org/bot$bot_token/sendMessage";

// Gửi thông tin tới Telegram
function send_to_telegram($message) {
    global $telegram_url, $chat_id;
    $message = urlencode($message);
    $url = "$telegram_url?chat_id=$chat_id&text=$message";
    
    // Dùng cURL thay vì file_get_contents để tránh lỗi
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_exec($ch);
    curl_close($ch);
}

// Lưu thống kê truy cập vào file
function log_access($ip, $date, $page, $device) {
    // Đọc file log chứa thống kê IP
    $log_file = "access_log.json";
    if (!file_exists($log_file)) {
        file_put_contents($log_file, json_encode([])); // Tạo file nếu chưa có
    }

    $log_data = json_decode(file_get_contents($log_file), true);

    // Kiểm tra xem IP đã có trong thống kê chưa
    if (isset($log_data[$ip])) {
        $log_data[$ip]['count'] += 1; // Tăng số lần truy cập
    } else {
        $log_data[$ip] = [
            'count' => 1
        ]; // Nếu chưa có, thêm mới
    }

    // Ghi lại thông tin truy cập vào log
    $log_data[$ip]['last_access'] = $date;
    $log_data[$ip]['page'] = $page;
    $log_data[$ip]['device'] = $device;

    file_put_contents($log_file, json_encode($log_data, JSON_PRETTY_PRINT));
}

// Lưu thống kê theo giờ
function log_hourly_access($hour, $ip) {
    $hourly_log_file = "hourly_log.json";
    if (!file_exists($hourly_log_file)) {
        file_put_contents($hourly_log_file, json_encode([])); // Tạo file nếu chưa có
    }

    $hourly_data = json_decode(file_get_contents($hourly_log_file), true);

    // Tăng số lượt truy cập theo giờ
    if (isset($hourly_data[$hour])) {
        $hourly_data[$hour]['count'] += 1;
    } else {
        $hourly_data[$hour] = [
            'count' => 1,
        ];
    }

    file_put_contents($hourly_log_file, json_encode($hourly_data, JSON_PRETTY_PRINT));
}

// Xử lý thông tin truy cập
$ip = $_SERVER['REMOTE_ADDR'];
$date = date("Y-m-d H:i:s");
$page = $_SERVER['REQUEST_URI'];
$device = $_SERVER['HTTP_USER_AGENT'];

// Ghi nhận thông tin truy cập vào file
log_access($ip, $date, $page, $device);

// Lưu thống kê theo giờ
$hour = date("Y-m-d H"); // Lấy theo giờ
log_hourly_access($hour, $ip);

// Lấy thống kê truy cập trong ngày
$log_file = "access_log.json";
$log_data = json_decode(file_get_contents($log_file), true);
$visit_count = $log_data[$ip]['count'];
$total_ips = count($log_data);
$total_visits = array_sum(array_column($log_data, 'count')); // Tổng số lượt truy cập toàn website

// Lấy thống kê theo giờ
$hourly_log_file = "hourly_log.json";
$hourly_data = json_decode(file_get_contents($hourly_log_file), true);
$current_hour_visits = isset($hourly_data[$hour]) ? $hourly_data[$hour]['count'] : 0; // Số lượt truy cập trong giờ này

// Gửi thông tin truy cập đến Telegram (thông báo truy cập)
$message = "
👁️ KHÁCH TRUY CẬP
🌐 IP: $ip
⏰ Thời gian truy cập: $date
🔗 Trang: topsubre.pro$page
📱 Thiết bị: $device

📊 Thống kê truy cập:
📈 Số lần IP truy cập: $visit_count
👥 Tổng IP truy cập: $total_ips
📉 Tổng truy cập: $total_visits

📅 Thống kê theo giờ:
🕒 Truy cập giờ này: $current_hour_visits
";

send_to_telegram($message);

// Lấy thời gian hiện tại
$now = new DateTime();
$hour_now = $now->format('H'); // Lấy giờ hiện tại

// Nếu là 23:59, gửi thông báo tổng
if ($hour_now == '23' && $now->format('i') == '59') {
    // Gửi thông báo tổng sau 23:59
    $total_message = "
    📅 Tổng kết ngày:
    🌐 Tổng số IP truy cập: $total_ips
    📈 Tổng số lượt truy cập: $total_visits
    ";

    send_to_telegram($total_message);
}

require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
$client_ip = Anti_xss($_SERVER['REMOTE_ADDR']);

$query = $db->get_row("SELECT ip,reason FROM blacklist_ips WHERE ip = '{$client_ip}'");
if ($query) {
    http_response_code(403);
    die($query['reason']);
}

$landing_dir = realpath($_SERVER['DOCUMENT_ROOT'] . '/views/landing/');
$landing_themes = $db->get_row("SELECT value FROM configs WHERE name = 'landing_themes'")['value'] ?? '{}';
$themes = json_decode($landing_themes, true);
$active_themes = array_filter($themes, fn($status) => $status === 1);
$errors = [];
?>

<?php if (empty($active_themes)): ?>
    <div class="alert alert-warning">Không có landing page nào được bật.</div>
<?php else: ?>
    <?php foreach ($active_themes as $theme => $status): ?>
        <?php
        $file_path = $landing_dir . '/' . $theme . '.php';
        if (file_exists($file_path)): ?>
            <?php
            try {
                require_once $file_path;
            } catch (Exception $e) {
                $errors[] = "Lỗi khi nạp $theme.php: " . $e->getMessage();
            }
            ?>

        <?php else:
            $errors[] = "File $theme.php không tồn tại trong thư mục $landing_dir";
        endif; ?>
    <?php endforeach; ?>
    </div>
<?php endif; ?>

<?php if (!empty($errors)): ?>
    <div class="alert alert-danger">
        <h6>Lỗi:</h6>
        <ul>
            <?php foreach ($errors as $error): ?>
                <li><?php echo htmlspecialchars($error); ?></li>
            <?php endforeach; ?>
        </ul>
    </div>
<?php endif; ?>