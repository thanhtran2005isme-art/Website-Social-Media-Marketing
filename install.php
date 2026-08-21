<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
date_default_timezone_set('Asia/Ho_Chi_Minh');

class Installer
{
    private $db;

    public function __construct()
    {
        $this->db = new DB();
    }

    public function run()
    {
        $log = [
            'updates' => [],
            'status' => 'success',
            'message' => ''
        ];

        try {

            $updates = [
                "ALTER TABLE users ADD COLUMN last_login DATETIME NULL",
                // "UPDATE configs SET value = JSON_SET(value, '$.status_demo', 1) WHERE name = 'general'"
                "ALTER TABLE api_providers ADD COLUMN price_percentage_increase INT DEFAULT 0;",
                "ALTER TABLE api_providers ADD COLUMN auto_sync INT DEFAULT 1 AFTER status;",
                "ALTER TABLE api_providers ADD COLUMN auto_import INT DEFAULT 1 AFTER auto_sync;",
                "ALTER TABLE api_providers
                ADD COLUMN rate_per_1k INT DEFAULT 1 AFTER conversion_rate",
                "INSERT INTO configs (name, value)
                 SELECT 'landing_themes', '{\"landing1\": 0, \"landing2\": 1, \"landing3\": 0}'
                 FROM dual
                 WHERE NOT EXISTS (SELECT 1 FROM configs WHERE name = 'landing_themes')",
                "CREATE TABLE blacklist_ips (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    ip VARCHAR(200) NOT NULL UNIQUE,
                    reason TEXT,
                    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                );",
                "CREATE TABLE blacklist_links (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    link VARCHAR(255) NOT NULL UNIQUE,
                    reason TEXT,
                    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                );",
                "CREATE TABLE blacklist_emails (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    email VARCHAR(255) NOT NULL UNIQUE,
                    reason TEXT,
                    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                );",
                "CREATE TABLE coupons (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    code VARCHAR(50) NOT NULL UNIQUE,
                    discount_type ENUM('percentage', 'fixed') NOT NULL DEFAULT 'percentage',
                    discount_value DECIMAL(10, 2) NOT NULL,
                    min_order_value DECIMAL(10, 2) DEFAULT NULL,
                    max_order_value DECIMAL(10, 2) DEFAULT NULL,
                    max_uses INT DEFAULT NULL,
                    used_count INT DEFAULT 0,
                    start_date DATETIME DEFAULT NULL,
                    end_date DATETIME DEFAULT NULL,
                    status TINYINT DEFAULT 1,
                    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
                );",
                "CREATE TABLE child_panels (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    user_id INT NOT NULL,
                    domain VARCHAR(255) NOT NULL UNIQUE,
                    panel_id VARCHAR(16) NOT NULL UNIQUE,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                );",
                "CREATE TABLE IF NOT EXISTS `settings` (
                    `id` int NOT NULL AUTO_INCREMENT,
                    `key` text COLLATE utf8mb4_unicode_ci,
                    `value` longtext COLLATE utf8mb4_unicode_ci,
                    PRIMARY KEY (`id`)
                    ) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;",
                "ALTER TABLE `settings` ADD UNIQUE KEY `unique_key` (`key`(191));",
                "INSERT INTO `settings` (`id`, `key`, `value`) VALUES
	(1, 'title', 'Dịch Vụ SMM Panel Uy Tín Hàng Đầu Việt Nam'),
	(2, 'keywords', 'SMM panel, dịch vụ mạng xã hội, tăng like, tăng follow, tăng view, Facebook, Instagram, TikTok, YouTube'),
	(3, 'description', 'Tăng like, follow, view, comment cho Facebook, Instagram, TikTok, YouTube với SMM panel giá rẻ, an toàn, hỗ trợ 24/7.'),
	(4, 'logo', ''),
	(5, 'logo_mobile', ''),
	(6, 'favicon', ''),
	(7, 'captcha_status', '1'),
	(8, 'captcha_site_key', ''),
	(9, 'captcha_secret_key', ''),
	(10, 'smtp_user', 'cskh.sieuthicode@gmail.com'),
	(11, 'smtp_pass', ''),
	(12, 'smtp_host', 'smtp.gmail.com'),
	(13, 'smtp_port', '587'),
	(14, 'smtp_status', '1'),
	(15, 'status_demo', '0'),
	(22, 'system_notification', ''),
	(25, 'thumbnail', ''),
	(26, 'email_support', ''),
	(27, 'status_email_login', '0'),
	(28, 'hotline', ''),
     (29,'modal_thongbao', 'Hệ thống hoạt động ổn định. Mọi dịch vụ đặt đơn SMM Panel đều vận hành bình thường.'),
                (30,'thongbao_taodon','<strong>Hệ thống hoạt động bình thường:</strong> Dịch vụ đặt đơn SMM Panel đang hoạt động ổn định. Bạn có thể tiến hành đặt đơn như bình thường.'),
                 (31,'plugin_chat',''),
                 (32, 'purchase_code', '');
    "
            ];

            foreach ($updates as $index => $sql) {
                $updateLog = [
                    'update' => $index + 1,
                    'sql' => $sql,
                    'status' => 'success',
                    'message' => ''
                ];

                try {
                    $result = $this->db->query($sql);
                    if (!$result) {
                        throw new Exception("Query failed: " . mysqli_error($this->db->connect));
                    }
                    $updateLog['message'] = 'Executed successfully';
                } catch (Exception $e) {
                    $updateLog['status'] = 'skipped';
                    $updateLog['message'] = 'Error: ' . $e->getMessage();
                }

                $log['updates'][] = $updateLog;
            }

            $log['message'] = 'All updates processed successfully';
        } catch (Exception $e) {

            $log['status'] = 'error';
            $log['message'] = 'Critical Error: ' . $e->getMessage();
        } finally {
            $this->db->dis_connect();
            header('Content-Type: application/json');
            echo json_encode($log, JSON_PRETTY_PRINT);
        }
    }
}

$installer = new Installer();
$installer->run();
