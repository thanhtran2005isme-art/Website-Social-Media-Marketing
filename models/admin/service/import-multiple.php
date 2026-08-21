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

            $apiProvider = $db->get_row("SELECT * FROM api_providers WHERE id = '{$apiProviderId}' LIMIT 1");

            if (!$apiProvider) {
                throw new Exception('API provider is not available.');
            }

            $smm = new SmmPanel($apiProvider['url'], $apiProvider['api_key']);
            $apiServicesData = $smm->getServices();

            if (!$apiServicesData) {
                throw new Exception('Please Check your API URL Or API Key.');
            }

            if ($_POST['import_quantity'] === 'selectItem') {
                $selectedServices = explode(',', $req['select_service'] ?? '');
                $apiServicesData = array_filter($apiServicesData, function ($service) use ($selectedServices) {
                    return in_array($service['service'], $selectedServices);
                });
                $apiServicesData = array_values($apiServicesData);
            }


            $count = 0;
            foreach ($apiServicesData as $apiService) {
                $socialMediaId = findSocialMedia($apiService['name'], $apiService['category']);
                //print_r($socialMediaId);
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
                    $idCat = $db->get_row("SELECT * FROM `categories` WHERE `category_title` ='{$apiService['category']}'")['id'] ?? 0;

                    $description = $apiService['desc'] ?? $apiService['description'] ?? '';
                    $currency = cur_setting();

                    $currency_code                     = $currency['currency_code'] ?? 'USD';
                    $auto_rounding_x_decimal_places    = $currency['auto_rounding_x_decimal_places'] ?? 2;
                    $default_price_percentage_increase = $_POST['price_percentage_increase'] ?? 25;

                    $price = $apiService['rate'] ?? 0;

                    if (!$apiProvider['rate_per_1k']) {
                        $price = (float) ($price * 1000);
                    }


                    $price = convert_currency($price, $apiProvider['conversion_rate'], $apiProvider['currency'], $currency_code);
                    $original_rate = $price;
                    $new_rate    = $price + ($price * $default_price_percentage_increase / 100);
                    $new_rate    = round($new_rate, $auto_rounding_x_decimal_places);


                    $db->insert("services", array(
                        'service_title' => $apiService['name'],
                        'category_id' => $idCat,
                        'min_amount' => $apiService['min'],
                        'max_amount' => $apiService['max'],
                        'service_type' => $apiService['type'],
                        'original_price' => $original_rate,
                        'price' =>  $new_rate,
                        'price_percentage_increase' =>  $default_price_percentage_increase,
                        'api_provider_id' =>  $apiProviderId,
                        'api_service_id' => $apiService['service'],
                        'drip_feed' => $apiService['dripfeed'] ?? $apiService['drip_feed'] ?? 0,
                        'api_provider_price' => $apiService['rate'],
                        'refill' => isset($apiService['refill']) ? intval($apiService['refill']) : 0,
                        'cancel' => isset($apiService['cancel']) ? intval($apiService['cancel']) : 0,
                        'description' => $description,
                        'created_at' => gettime(),
                        'updated_at' => gettime()
                    ));
                }

                $count++;
                if ($_POST['import_quantity'] === 'all' || $_POST['import_quantity'] === 'selectItem') {
                    continue;
                } elseif ($_POST['import_quantity'] == $count) {
                    break;
                }
            }
            die(JsonMsg('success', 'Thêm ' . $count . ' dịch vụ thành công'));
        } catch (Exception $e) {
            die(JsonMsg('error', $e->getMessage()));
        }
    } else {
        die(JsonMsg('error', 'Vui lòng đăng nhập để thực hiện'));
    }
}
