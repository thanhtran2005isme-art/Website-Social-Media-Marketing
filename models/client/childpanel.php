<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if ($general_data['status_demo'] == 1) {
        die(JsonMsg('error', 'Đây là trang web demo bạn không thể thực hiện thao tác'));
    }
    if (!$user || empty($user)) {
        die(JsonMsg('error', 'Vui lòng đăng nhập để thực hiện'));
    }

    if (!isset($data_user['id']) || !isset($data_user['status'])) {
        die(JsonMsg('error', 'Dữ liệu người dùng không hợp lệ!'));
    }

    $domain = Anti_xss($_POST['domain']);
    $user_id = $data_user['id'];

    if (!preg_match('/^[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)+$/', $domain)) {
        die(JsonMsg('error', 'Tên miền không hợp lệ!'));
    } elseif ($domain === MAIN_PANEL_DOMAIN) {
        die(JsonMsg('error', 'Không thể sử dụng domain của Main Panel!'));
    } else {
        // Kiểm tra domain đã tồn tại
        $existing = $db->num_rows("SELECT id FROM child_panels WHERE domain = '$domain'");
        if ($existing) {
            die(JsonMsg('error', 'Tên miền đã được sử dụng!'));
        } else {
            $panel_id = bin2hex(random_bytes(8));
            $db->insert('child_panels', [
                'user_id' => $user_id,
                'domain' => $domain,
                'panel_id' => $panel_id
            ]);
            die(JsonMsg('success', 'Child Panel đã được tạo thành công'));

            // $panel_dir = realpath($_SERVER['DOCUMENT_ROOT']) . "/child_panels/$domain";
            // if (!mkdir($panel_dir, 0755, true)) {
            //     $message = '<div class="alert alert-danger">Không thể tạo thư mục cho Child Panel!</div>';
            // } else {
            //     // Tạo PANEL_ID duy nhất
            //     $panel_id = bin2hex(random_bytes(8));

            //     // Sao chép tệp mẫu
            //     $template_dir = __DIR__ . '/templates';
            //     $files = ['config.php', 'index.php', 'api.php', 'order.php', 'login.php', 'init.php'];
            //     foreach ($files as $file) {
            //         if (file_exists("$template_dir/$file")) {
            //             copy("$template_dir/$file", "$panel_dir/$file");
            //         }
            //     }

            //     // Cấu hình config.php cho Child Panel
            //     $config_content = file_get_contents("$panel_dir/config.php");
            //     $config_content = str_replace(
            //         ['{{DB_NAME}}', '{{DB_USER}}', '{{DB_PASS}}', '{{API_URL}}', '{{API_KEY}}', '{{PANEL_ID}}'],
            //         [DB_NAME, DB_USER, DB_PASS, API_URL, API_KEY, $panel_id],
            //         $config_content
            //     );
            //     file_put_contents("$panel_dir/config.php", $config_content);

            //     // Mô phỏng Cloudflare API trên localhost
            //     if (IS_LOCALHOST) {
            //         $message .= '<div class="alert alert-info">Bỏ qua Cloudflare API trên localhost. Mô phỏng tạo DNS record cho ' . htmlspecialchars($domain) . '</div>';
            //     } else {
            //         // Tạo bản ghi DNS trong Cloudflare
            //         $subdomain = explode('.', $domain)[0];
            //         $url = "https://api.cloudflare.com/client/v4/zones/" . CLOUDFLARE_ZONE_ID . "/dns_records";
            //         $data = [
            //             'type' => 'A',
            //             'name' => $domain,
            //             'content' => SERVER_IP,
            //             'ttl' => 3600,
            //             'proxied' => true
            //         ];

            //         $ch = curl_init($url);
            //         curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            //         curl_setopt($ch, CURLOPT_POST, true);
            //         curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
            //         curl_setopt($ch, CURLOPT_HTTPHEADER, [
            //             'Authorization: Bearer ' . CLOUDFLARE_API_TOKEN,
            //             'Content-Type: application/json'
            //         ]);
            //         $response = curl_exec($ch);
            //         curl_close($ch);

            //         $result = json_decode($response, true);
            //         if (!$result['success']) {
            //             $message = '<div class="alert alert-danger">Không thể tạo bản ghi DNS: ' . json_encode($result['errors']) . '</div>';
            //             // Xóa thư mục nếu DNS thất bại
            //             rmdir($panel_dir);
            //             exit;
            //         }
            //     }

            //     // Lưu thông tin Child Panel
            //     $db->insert('child_panels', [
            //         'user_id' => $user_id,
            //         'domain' => $domain,
            //         'panel_id' => $panel_id
            //     ]);

            //     $message .= '<div class="alert alert-success">Child Panel đã được tạo thành công tại: <a href="http://' . htmlspecialchars($domain) . '" target="_blank">http://' . htmlspecialchars($domain) . '</a></div>';
            // }
        }
    }
}
