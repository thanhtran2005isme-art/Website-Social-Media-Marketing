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
            if (!isset($_POST['ids']) || !is_array($_POST['ids']) || empty($_POST['ids'])) {
                throw new Exception('Dữ liệu không hợp lệ');
            }

            $ids = array_map('intval', $_POST['ids']);
            $safeIds = array_map(function ($id) use ($db) {
                return Anti_xss($id);
            }, $ids);
            $placeholders = implode(',', $safeIds);
        
            $sql = "DELETE FROM services WHERE id IN ($placeholders)";
            $db->query($sql);

            die(JsonMsg('success', 'Đã xóa dịch vụ thành công'));
        } catch (Exception $e) {
            die(JsonMsg('error', $e->getMessage()));
        }
    } else {
        die(JsonMsg('error', 'Vui lòng đăng nhập để thực hiện'));
    }
}
