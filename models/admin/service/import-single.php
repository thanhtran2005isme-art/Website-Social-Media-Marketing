<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
header('Content-Type: application/json');

function isPositiveInt($value) {
    return filter_var($value, FILTER_VALIDATE_INT) !== false && $value > 0;
}

// Hàm kiểm tra số thực dương
function isPositiveFloat($value) {
    return filter_var($value, FILTER_VALIDATE_FLOAT) !== false && $value >= 0;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (!$user || empty($user)) {
        die(JsonMsg('error', 'Vui lòng đăng nhập để thực hiện'));
    }

    if ($data_user['role'] != '1') {
        die(JsonMsg('error', 'Bạn không có quyền truy cập vào trang này'));
    }
    if ($general_data['status_demo'] == 1) {
        die(JsonMsg('error', 'Đây là trang web demo bạn không thể thực hiện thao tác'));
    }
    try {
        // Lấy và validate dữ liệu đầu vào
        $apiProviderId = Anti_xss($_POST['provider'] ?? '');
        if (!isPositiveInt($apiProviderId)) {
            throw new Exception('ID nhà cung cấp API không hợp lệ.');
        }

        $price_percentage_increase = Anti_xss($_POST['price_percentage_increase'] ?? 0);
        if (!isPositiveFloat($price_percentage_increase) || $price_percentage_increase > 1000) {
            throw new Exception('Phần trăm tăng giá phải là số từ 0 đến 1000.');
        }

        $service_id = Anti_xss($_POST['service_id'] ?? 0);
        if (!isPositiveInt($service_id)) {
            throw new Exception('ID dịch vụ không hợp lệ.');
        }

        $name = Anti_xss($_POST['name'] ?? '');
        if (empty($name) || strlen($name) > 255) {
            throw new Exception('Tên dịch vụ không được để trống và không vượt quá 255 ký tự.');
        }

        $category = Anti_xss($_POST['category'] ?? '');
        if (empty($category) || strlen($category) > 100) {
            throw new Exception('Danh mục không được để trống và không vượt quá 100 ký tự.');
        }

        $rate = Anti_xss($_POST['rate'] ?? 0);
        if (!isPositiveFloat($rate)) {
            throw new Exception('Giá gốc phải là số thực dương.');
        }

        $min = Anti_xss($_POST['min'] ?? 0);
        if (!isPositiveInt($min)) {
            throw new Exception('Số lượng tối thiểu phải là số nguyên dương.');
        }

        $max = Anti_xss($_POST['max'] ?? 0);
        if (!isPositiveInt($max) || $max < $min) {
            throw new Exception('Số lượng tối đa phải là số nguyên dương và lớn hơn số lượng tối thiểu.');
        }

        $dripfeed = Anti_xss($_POST['dripfeed'] ?? 0);
        if (!in_array($dripfeed, [0, 1])) {
            throw new Exception('Dripfeed chỉ nhận giá trị 0 hoặc 1.');
        }

        // Kiểm tra API Provider
        $apiProvider = $db->get_row("SELECT * FROM api_providers WHERE id = '{$apiProviderId}' LIMIT 1");
        if (!$apiProvider) {
            throw new Exception('Nhà cung cấp API không tồn tại.');
        }

        // Tìm social media ID (giả sử hàm này đã được định nghĩa)
        $socialMediaId = findSocialMedia($name, $category);
        if (!isset($socialMediaId['id']) || !isPositiveInt($socialMediaId['id'])) {
            $socialMediaId['id'] = 0; // Gán mặc định nếu không tìm thấy
        }

        // Kiểm tra và thêm danh mục nếu chưa tồn tại
        $categoryExists = $db->get_row("SELECT * FROM `categories` WHERE `category_title` = '{$category}'");
        if (!$categoryExists) {
            $db->insert("categories", [
                'social_media_id' => $socialMediaId['id'],
                'category_title' => $category,
                'status' => 1,
                'created_at' => gettime(),
                'updated_at' => gettime()
            ]);
        }

        // Kiểm tra dịch vụ đã tồn tại chưa
        $serviceExists = $db->get_row("SELECT * FROM `services` WHERE `api_service_id` = '{$service_id}'");
        if (!$serviceExists) {
            $idCat = $db->get_row("SELECT * FROM `categories` WHERE `category_title` = '{$category}'")['id'] ?? 0;
            if (!isPositiveInt($idCat)) {
                throw new Exception('Không tìm thấy ID danh mục phù hợp.');
            }

            // Tính giá mới
            $increased_price = ($rate * $price_percentage_increase) / 100;
            $conversion_rate = floatval($apiProvider['conversion_rate']);
            if ($conversion_rate <= 0) {
                throw new Exception('Tỷ giá chuyển đổi của nhà cung cấp không hợp lệ.');
            }

            $original_price = $rate;
            $new_price = ($rate + $increased_price);

            // Thêm dịch vụ vào database
            $db->insert("services", [
                'service_title' => $name,
                'category_id' => $idCat,
                'min_amount' => $min,
                'max_amount' => $max,
                'original_price' => $original_price,
                'price' => $new_price,
                'price_percentage_increase' => $price_percentage_increase,
                'api_provider_id' => $apiProviderId,
                'api_service_id' => $service_id,
                'drip_feed' => $dripfeed,
                'api_provider_price' => $rate,
                'created_at' => gettime(),
                'updated_at' => gettime()
            ]);

            $count = 1; // Số lượng dịch vụ thêm thành công (ở đây là 1)
            die(JsonMsg('success', "Thêm $count dịch vụ thành công"));
        } else {
            throw new Exception('Dịch vụ với ID này đã tồn tại.');
        }
    } catch (Exception $e) {
        die(JsonMsg('error', $e->getMessage()));
    }
}
?>