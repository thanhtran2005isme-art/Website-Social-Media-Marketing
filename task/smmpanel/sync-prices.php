<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
header('Content-Type: application/json');

if ($general_data['status_demo'] == 1) {
    die(JsonMsg('error', 'Đây là trang web demo bạn không thể thực hiện thao tác'));
}
try {
    // Fetch all active API providers
    $apiProviders = $db->get_list("SELECT * FROM api_providers WHERE status = 1");

    if (empty($apiProviders)) {
        throw new Exception('Không có nhà cung cấp API nào đang hoạt động.');
    }

    $currency = cur_setting();
    $currencyCode = $currency['currency_code'] ?? 'USD';
    $autoRoundingDecimalPlaces = $currency['auto_rounding_x_decimal_places'] ?? 2;

    $totalUpdated = 0;

    foreach ($apiProviders as $apiProvider) {
        try {
            if($apiProvider['auto_sync'] == 0) continue;
            $smm = new SmmPanel($apiProvider['url'], $apiProvider['api_key']);
            $apiServicesData = $smm->getServices();

            if (!$apiServicesData) {
                continue;
            }

            $defaultPricePercentageIncrease = (int) ($apiProvider['price_percentage_increase'] ?? $currency['default_price_percentage_increase'] ?? 25);

            $localServices = $db->get_list("SELECT * FROM services WHERE api_provider_id = " . (int)$apiProvider['id']);
            if (empty($localServices)) {
                continue;
            }
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
                            'service_type' => $apiService['type'],
                            'price' => $newRate,
                            'original_price' => $price,
                            'price_percentage_increase' => $defaultPricePercentageIncrease,
                            'api_provider_price' => $apiService['rate'],
                            'updated_at' => gettime()
                        ];
                        if ($db->update('services', $updateData, "id = " . (int)$service['id'])) {
                            $totalUpdated++;
                        }
                        break;
                    }
                }
            }
        } catch (Exception $e) {
            continue;
        }
    }

    if ($totalUpdated === 0) {
        throw new Exception('Không có dịch vụ nào được cập nhật.');
    }

    die(JsonMsg('success', 'Đã cập nhật ' . $totalUpdated . ' dịch vụ thành công.'));
} catch (Exception $e) {
    die(JsonMsg('error', $e->getMessage()));
}
