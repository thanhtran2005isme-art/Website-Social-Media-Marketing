<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if ($user) {
        if ($data_user['role'] != '1') {
            die(JsonMsg('error', 'Bạn không có quyền truy cập vào trang này'));
        }
        if ($general_data['status_demo'] == 1) {
            die(JsonMsg('error', 'Đây là trang web demo bạn không thể thực hiện thao tác'));
        }
        try {
            $apiProviderId = Anti_xss($_POST['api_provider_id']) ?? null;
            if (!$apiProviderId) {
                throw new Exception('Vui lòng chọn nhà cung cấp API.');
            }

            $apiProvider = $db->get_row("SELECT * FROM api_providers WHERE id = '{$apiProviderId}' LIMIT 1");

            if (!$apiProvider) {
                throw new Exception('API provider is not available.');
            }

            // Sử dụng class SmmPanel
            $smm = new SmmPanel($apiProvider['url'], $apiProvider['api_key']);
            $services = $smm->getServices();
            $updatedServices = [];
            foreach ($services as $service) {
                if (!isset($service['rate']) || !is_numeric($service['rate'])) {
                    throw new Exception("Invalid or missing rate for service ID {$service['service_id']}");
                }
                $currency = cur_setting();
                $currency_code = $currency['currency_code'] ?? 'USD';
                $price = $service['rate'] ?? 0;
                if (!$apiProvider['rate_per_1k']) {
                    $price = (float) ($price * 1000);
                }
                $price = convert_currency($price, $apiProvider['conversion_rate'], $apiProvider['currency'], $currency_code);

                $service['rate'] = $price;
                $updatedServices[] = $service;
            }
            $_SESSION['api_services'] = $updatedServices;
            $_SESSION['api_provider'] = $apiProvider;
            $_SESSION['provider_id'] = $apiProviderId;
            die(JsonMsg('success', 'Lấy dịch vụ thành công'));
        } catch (Exception $e) {
            die(JsonMsg('error', $e->getMessage()));
        }
    } else {
        die(JsonMsg('error', 'Vui lòng đăng nhập để thực hiện'));
    }
}
