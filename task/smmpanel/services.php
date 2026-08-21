<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
header('Content-Type: application/json');
$validServiceTypes = [
    'default',
    'custom comments',
    'comment likes',
    'mentions',
    'mentions hashtag',
    'package',
    'special'
];

if ($general_data['status_demo'] == 1) {
    die(JsonMsg('error', 'Đây là trang web demo bạn không thể thực hiện thao tác'));
}

try {

    $apiProviders = $db->get_list("SELECT * FROM api_providers WHERE status = 1");

    if (!$apiProviders) {
        throw new Exception('Không có nhà cung cấp API nào khả dụng.');
    }

    $totalServicesAdded = 0;
    $logMessages = [];

    foreach ($apiProviders as $apiProvider) {
        try {
            if ($apiProvider['auto_import'] == 0) continue;
            $smm = new SmmPanel($apiProvider['url'], $apiProvider['api_key']);
            $apiServicesData = $smm->getServices();

            if (!$apiServicesData) {
                $logMessages[] = "Nhà cung cấp ID {$apiProvider['id']}: Kiểm tra URL API hoặc API Key.";
                continue;
            }
            $importQuantity = 'all';
            $defaultPricePercentageIncrease = $apiProvider['price_percentage_increase'];

            $count = 0;

            foreach ($apiServicesData as $apiService) {
                $socialMediaId = findSocialMedia($apiService['name'], $apiService['category']);
           
                $categoryExists = $db->get_row("SELECT * FROM `categories` WHERE `category_title` ='{$apiService['category']}'");

                if (!$categoryExists) {
                    $db->insert("categories", array(
                        'social_media_id' => $socialMediaId['id'] ?? 0,
                        'category_title' => $apiService['category'],
                        'status' => 1,
                        'created_at' => gettime(),
                        'updated_at' => gettime()
                    ));
                }

                $serviceExists = $db->get_row("SELECT * FROM `services` WHERE `api_service_id` ='{$apiService['service']}' AND `api_provider_id` = '{$apiProvider['id']}'");
                if (!$serviceExists) {
                  //  echo 1;
                     $idCat = $db->get_row("SELECT * FROM `categories` WHERE `category_title` ='{$apiService['category']}'")['id'] ?? 0;

                    $description = $apiService['desc'] ?? $apiService['description'] ?? '';
                    $currency = cur_setting();

                    $currency_code = $currency['currency_code'] ?? 'USD';
                    $auto_rounding_x_decimal_places = $currency['auto_rounding_x_decimal_places'] ?? 2;

                    $price = $apiService['rate'] ?? 0;
                    if (!$apiProvider['rate_per_1k']) {
                        $price = (float) ($price * 1000);
                    }
                    $price = convert_currency($price, $apiProvider['conversion_rate'], $apiProvider['currency'], $currency_code);
                    $original_rate = $price;
                    $new_rate = $price + ($price * $defaultPricePercentageIncrease / 100);
                    $new_rate = round($new_rate, $auto_rounding_x_decimal_places);
                  
                    $db->insert("services", array(
                        'service_title' => $apiService['name'],
                        'category_id' => $idCat,
                        'min_amount' => $apiService['min'],
                        'max_amount' => $apiService['max'],
                        'service_type' => $apiService['type'],
                        'original_price' => $original_rate,
                        'price' => $new_rate,
                        'price_percentage_increase' => $defaultPricePercentageIncrease,
                        'api_provider_id' => $apiProvider['id'],
                        'api_service_id' => $apiService['service'],
                        'drip_feed' => isset($apiService['dripfeed']) ? intval($apiService['dripfeed']) : (isset($apiService['drip_feed']) ? intval($apiService['drip_feed']) : 0),
                        'api_provider_price' => $apiService['rate'],
                        'refill' => isset($apiService['refill']) ? intval($apiService['refill']) : 0,
                        'cancel' => isset($apiService['cancel']) ? intval($apiService['cancel']) : 0,
                        'description' => $description,
                        'created_at' => gettime(),
                        'updated_at' => gettime()
                    ));

                    $count++;
                    $totalServicesAdded++;
                }
            }
//var_dump($apiServicesData);
            $logMessages[] = "Nhà cung cấp ID {$apiProvider['id']}: Thêm {$count} dịch vụ thành công.";
        } catch (Exception $e) {
            $logMessages[] = "Nhà cung cấp ID {$apiProvider['id']}: Lỗi - {$e->getMessage()}";
            continue;
        }
    }

    file_put_contents('cron_import_services.log', implode("\n", $logMessages) . "\n", FILE_APPEND);

    die(JsonMsg('success', "Hoàn tất! Thêm tổng cộng {$totalServicesAdded} dịch vụ mới."));
} catch (Exception $e) {

    file_put_contents('cron_import_services.log', "Lỗi chung: {$e->getMessage()}\n", FILE_APPEND);
    die(JsonMsg('error', $e->getMessage()));
}
