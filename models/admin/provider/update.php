<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    die(JsonMsg('error', 'Invalid request method'));
}
if (!$user || empty($user)) {
    die(JsonMsg('error', 'Chưa đăng nhập'));
}
if ($data_user['role'] != '1') {
    die(JsonMsg('error', 'Bạn không có quyền truy cập vào trang này'));
}
if ($general_data['status_demo'] == 1) {
    die(JsonMsg('error', 'Đây là trang web demo bạn không thể thực hiện thao tác'));
}
$id = isset($_POST['id']) ? (int)$_POST['id'] : 0;

if ($id > 0) {
    $provider = $db->get_row("SELECT * FROM `api_providers` WHERE id = $id");

    if ($provider) {

        $smm = new SmmPanel($provider['url'], $provider['api_key']);
        $apiServicesData = $smm->getBalance();

        if (!$apiServicesData) {
            die(JsonMsg('error', 'Vui lòng kiểm tra URL API hoặc Khóa API của bạn.'));
        }

        $balance = round((float) $apiServicesData['balance'], 2);

        $db->update('api_providers', ['balance' => $balance, 'currency'=>$apiServicesData['currency']], "id = " . (int)$id);
        die(json_encode([
            'status' => 'success',
            'balance' => $balance,
            'msg' => 'Balance updated successfully'
        ]));
    } else {
        die(json_encode([
            'status' => 'error',
            'msg' => 'Provider not found'
        ]));
    }
} else {
    die(json_encode([
        'status' => 'error',
        'msg' => 'Invalid provider ID'
    ]));
}
