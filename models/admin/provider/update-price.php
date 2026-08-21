<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if ($user) {
        if ($data_user['role'] != '1') {
            die(JsonMsg('error', 'Bạn không có quyền truy cập vào trang này'));
        }
        if ($general_data['status_demo'] == 1) {
            die(JsonMsg('error', 'Đây là trang web demo bạn không thể thực hiện thao tác'));
        }
        try {
            $apiProviderId = Anti_xss($_POST['provider']) ?? null;
            if (!$apiProviderId) {
                throw new Exception('Vui lòng chọn nhà cung cấp API.');
            }

            $apiProvider = $db->get_row("SELECT * FROM api_providers WHERE id = '" . (int)$apiProviderId . "' LIMIT 1");

            if (!$apiProvider) {
                throw new Exception('API provider is not available.');
            }

            $smm = new SmmPanel($apiProvider['url'], $apiProvider['api_key']);
            $apiServicesData = $smm->getServices();

            if (!$apiServicesData) {
                throw new Exception('Please Check your API URL Or API Key.');
            }

            $currency = cur_setting();
            $currencyCode = $currency['currency_code'] ?? 'USD';
            $autoRoundingDecimalPlaces = $currency['auto_rounding_x_decimal_places'] ?? 2;
            $defaultPricePercentageIncrease = (int) ($apiProvider['price_percentage_increase'] ?? $currency['default_price_percentage_increase'] ?? 25);
            $localServices = $db->get_list("SELECT * FROM services WHERE api_provider_id = " . (int)$apiProviderId);
            $updated = 0;
            foreach ($localServices as $service) {
                foreach ($apiServicesData as $apiService) {
                    if ($apiService['service'] == $service['api_service_id']) {
                        $price = (float) ($apiService['rate'] ?? 0);
                        if (!$apiProvider['rate_per_1k']) {
                            $price = (float) ($price * 1000);
                        }
                        $price = (float) ($price * $apiProvider['conversion_rate']);
                        $newRate = $price + (float) ($price * ($defaultPricePercentageIncrease / 100));
                        $newRate = round($newRate, $autoRoundingDecimalPlaces);

                        $updateData = [
                            'price' => $newRate,
                            'original_price' => $price,
                            'price_percentage_increase' => $defaultPricePercentageIncrease,
                            'api_provider_price' => $apiService['rate'],
                            'updated_at' => gettime()
                        ];
                        if ($db->update('services', $updateData, "id = " . (int)$service['id'])) {
                            $updated++;
                        }
                        break;
                    }
                }
            }

            if ($updated === 0) {
                throw new Exception('Không có dịch vụ nào được cập nhật.');
            }
            die(JsonMsg('success', 'Đã cập nhật ' . $updated . ' dịch vụ thành công (Tỷ giá: ' . number_format($apiProvider['conversion_rate']) . '; Tăng: ' . $defaultPricePercentageIncrease . '%)'));

        } catch (Exception $e) {
            die(JsonMsg('error', $e->getMessage()));
        }
    } else {
        die(JsonMsg('error', 'Vui lòng đăng nhập để thực hiện'));
    }
}
?>