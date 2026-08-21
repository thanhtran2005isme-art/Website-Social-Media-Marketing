<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
header('Content-Type: application/json');

try {
    $category_id = isset($_POST['category_id']) ? intval($_POST['category_id']) : null;
    if ($category_id) {
        // Join services with categories and social_media to get the icon
        $services = $db->get_list("
            SELECT s.id, s.service_title as name, s.price, sm.icon
            FROM services s
            INNER JOIN categories c ON s.category_id = c.id
            LEFT JOIN social_media sm ON c.social_media_id = sm.id
            WHERE s.category_id = '{$category_id}'
            ORDER BY s.service_title ASC
        ");

        // Format price using formatCurrencyF
        foreach ($services as &$service) {
            $service['price'] = formatCurrencyF($service['price']);
        }
        unset($service);

        echo json_encode(['status' => 'success', 'msg' => 'Lấy dịch vụ thành công', 'data' => $services]);
    } else {
        throw new Exception('Không có ID danh mục');
    }
} catch (Exception $e) {
    echo json_encode(['status' => 'error', 'msg' => $e->getMessage()]);
}
?>