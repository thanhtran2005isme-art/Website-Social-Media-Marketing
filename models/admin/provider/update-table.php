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
$isUpdate = $db->update("api_providers", ["auto_sync" => !empty($_POST["auto_sync"]) ? Anti_xss($_POST["auto_sync"]) : 0, "auto_import" => !empty($_POST["auto_import"]) ? Anti_xss($_POST["auto_import"]) : 0], " `id` = '" . Anti_xss($_POST["id"]) . "' ");
if ($isUpdate) {
    die(JsonMsg('success', 'Cập nhật thành công'));
}
die(JsonMsg('error', 'Cập nhật thất bại'));
