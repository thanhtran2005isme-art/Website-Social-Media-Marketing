<?php
require_once realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php';
header('Content-Type: application/json');
try {
    $service_id = isset($_POST['service_id']) ? intval($_POST['service_id']) : null;

    if ($service_id) {
        $service = $db->get_row("
        SELECT 
            id,
            service_title AS name,
            service_type,
            min_amount,
            max_amount,
            price,
            description,
            (
                SELECT AVG(TIMESTAMPDIFF(SECOND, o.created_at, o.added_on))
                FROM orders o
                WHERE o.service_id = services.id
                AND o.status = 'completed'
                AND o.created_at IS NOT NULL
                AND o.added_on IS NOT NULL
            ) AS avg_time_seconds
        FROM services 
        WHERE id = '{$service_id}'
    ");
        if ($service) {
            $avg_time = 'No data';
            if (!is_null($service['avg_time_seconds']) && $service['avg_time_seconds'] > 0) {
                $seconds = round($service['avg_time_seconds']);
                $hours = floor($seconds / 3600);
                $minutes = floor(($seconds % 3600) / 60);
                $secs = $seconds % 60;
                $time_parts = [];
                if ($hours > 0) {
                    $time_parts[] = "{$hours}h";
                }
                if ($minutes > 0 || $hours > 0) {
                    $time_parts[] = "{$minutes}m";
                }
                $time_parts[] = "{$secs}s";
                $avg_time = implode(' ', $time_parts);
            }

            $service['price_per_1'] = $service['price'] / 1000;

            $service['price_formatted'] = formatCurrencyF($service['price']);
            $service['avg_time'] = $avg_time;
            echo json_encode(['status' => 'success', 'data' => $service]);
        } else {
            throw new Exception('Không tìm thấy dịch vụ');
        }
    } else {
        throw new Exception('Không có service_id');
    }
} catch (Exception $e) {
    die(JsonMsg('error', $e->getMessage()));
}
