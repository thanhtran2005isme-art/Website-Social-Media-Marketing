<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
header('Content-Type: application/json');

try {
    $social_media_id = isset($_POST['social_media_id']) ? intval($_POST['social_media_id']) : null;

    if ($social_media_id) {
        // Join categories with social_media to get the icon
        $categories = $db->get_list("
            SELECT c.id, c.category_title as name, sm.icon
            FROM categories c
            LEFT JOIN social_media sm ON c.social_media_id = sm.id
            WHERE c.social_media_id = '{$social_media_id}'
            ORDER BY c.category_title ASC
        ");
        echo json_encode(['status' => 'success', 'msg' => 'Lấy dữ liệu thành công', 'data' => $categories]);
    } else {
        throw new Exception('Không có social_media_id');
    }
} catch (Exception $e) {
    echo json_encode(['status' => 'error', 'msg' => $e->getMessage()]);
}
?>