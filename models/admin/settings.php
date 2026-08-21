<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
$db = new DB();
if (!$user || empty($user)) {
    die(JsonMsg('error', 'Vui lòng đăng nhập để thực hiện'));
}
if ($data_user['role'] != '1') {
    die(JsonMsg('error', 'Bạn không có quyền truy cập vào trang này'));
}
if ($db->setting('status_demo') == 1) {
    die(JsonMsg('error', 'Đây là trang web demo bạn không thể thực hiện thao tác'));
}

$upload_dir = $_SERVER['DOCUMENT_ROOT'] . '/uploads/';
if (!is_dir($upload_dir)) {
    mkdir($upload_dir, 0755, true);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $settings = $_POST['settings'] ?? [];

    $file_fields = ['logo', 'logo_mobile', 'favicon', 'thumbnail'];
    $old_files = [];
    foreach ($file_fields as $field) {
        $row = $db->get_row("SELECT `value` FROM `settings` WHERE `key` = '" . Anti_xss($field) . "'");
        $old_files[$field] = $row ? $row['value'] : null;
    }

    $allowed_extensions = ['jpg', 'jpeg', 'png', 'ico'];

    foreach ($file_fields as $field) {
        if (!empty($_FILES[$field]['name'])) {
            $file_name = $_FILES[$field]['name'];
            $file_tmp = $_FILES[$field]['tmp_name'];
            $file_ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));

            if (in_array($file_ext, $allowed_extensions)) {
                $new_file_name = uniqid() . '.' . $file_ext;
                $destination = $upload_dir . $new_file_name;

                if (move_uploaded_file($file_tmp, $destination)) {
                    $settings[$field] = '/uploads/' . $new_file_name;

                    if (!empty($old_files[$field]) && file_exists($_SERVER['DOCUMENT_ROOT'] . $old_files[$field])) {
                        unlink($_SERVER['DOCUMENT_ROOT'] . $old_files[$field]);
                    }
                } else {
                    die(JsonMsg('error', "Lỗi khi tải lên file $field."));
                }
            } else {
                die(JsonMsg('error', "Định dạng file $field không hợp lệ. Chỉ hỗ trợ: " . implode(', ', $allowed_extensions)));
            }
        }
    }

    $db->begin_transaction();
    try {
        $existing_keys = array_column($db->get_list("SELECT `key` FROM `settings`"), 'key');
        $updated = false;
        foreach ($settings as $key => $value) {
            if (in_array($key, $existing_keys)) {
                if ($key === 'system_notification') {
                    $escaped_value = $value === null ? '' : "'" . Anti_xss($value) . "'";
                } else {
                    $escaped_value = $value === null ? '' : "'" . (function_exists('Anti_xss') ? Anti_xss($value) : Anti_xss($value)) . "'";
                }
                $escaped_key = function_exists('Anti_xss') ? Anti_xss($key) : Anti_xss($key);
                $sql = "UPDATE `settings` SET `value` = $escaped_value WHERE `key` = '$escaped_key'";
                $db->query($sql);
                $updated = true;
            }
        }

        if (!$updated && !empty($settings)) {
            throw new Exception('Không có khóa nào hợp lệ để cập nhật.');
        }
        $db->commit();
        die(JsonMsg('success', 'Cài đặt đã được lưu thành công!'));
    } catch (Exception $e) {
        $db->rollback();
        die(JsonMsg('error', 'Lỗi khi lưu cài đặt: ' . $e->getMessage()));
    }
    $db->dis_connect();
}
