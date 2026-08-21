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
            if (!isset($_POST['ids']) || !is_array($_POST['ids']) || empty($_POST['ids']) || empty($_POST['price_percentage_increase'])) {
                throw new Exception('Dữ liệu không hợp lệ');
            }
            $percentage = isset($_POST['price_percentage_increase']) ? floatval($_POST['price_percentage_increase']) : 0;

            $ids = array_map('intval', $_POST['ids']);
            $safeIds = array_map(function ($id) use ($db) {
                return Anti_xss($id);
            }, $ids);
            $ids_list = implode(',', $safeIds);

            $query = "UPDATE services 
                      SET price = price + (price * $percentage / 100),
                          price_percentage_increase = $percentage
                      WHERE id IN ($ids_list)";

            $result = $db->query($query);

            if (!$result) {
                throw new Exception('Không thể cập nhật giá: ' . $db->error);
            }
            die(JsonMsg('success', 'Giá đã được cập nhật thành công.'));
        } catch (Exception $e) {
            die(JsonMsg('error', $e->getMessage()));
        }
    } else {
        die(JsonMsg('error', 'Vui lòng đăng nhập để thực hiện'));
    }
}
