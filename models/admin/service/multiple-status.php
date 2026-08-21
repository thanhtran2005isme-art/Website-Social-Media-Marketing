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
            if (!isset($_POST['ids']) || !is_array($_POST['ids']) || empty($_POST['ids']) || !isset($_POST['status'])) {
                throw new Exception('Dữ liệu không hợp lệ');
            }

            $ids = array_map('intval', $_POST['ids']);
            $status = (int)$_POST['status'];

            if ($status !== 0 && $status !== 1) {
                throw new Exception('Giá trị trạng thái không hợp lệ');
            }

            $safeIds = array_map(function ($id) use ($db) {
                return Anti_xss($id);
            }, $ids);
            $placeholders = implode(',', $safeIds);
        
            $sql = "UPDATE services SET service_status = '{$status}' WHERE `id` IN ($placeholders)";
            $db->query($sql);

            die(JsonMsg('success', 'Trạng thái dịch vụ được cập nhật thành công'));
        } catch (Exception $e) {
            die(JsonMsg('error', $e->getMessage()));
        }
    } else {
        die(JsonMsg('error', 'Vui lòng đăng nhập để thực hiện'));
    }
}
