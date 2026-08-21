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
        $action = Anti_xss($_POST['action']);
        if (empty($action)) {
            die(JsonMsg('error', 'Vui lòng chọn dữ liệu'));
        }
        switch ($action) {
            case 'removeFlatform':
                $id = isset($_POST['id']) ? Anti_xss($_POST['id']) : 0;
                if ($id <= 0) {
                    die(JsonMsg('error', 'Invalid ID'));
                }
                $check = $db->get_row("SELECT * FROM `social_media` WHERE `id` = {$id}");
                if (!$check) {
                    die(JsonMsg('error', 'IP không tồn tại'));
                }
                $isRemove = $db->remove("social_media", " `id` = '$id' ");
                if ($isRemove) {
                    $imagePath = '../..' . $check['icon'];
                    if (!empty($check['icon']) &&  file_exists($imagePath)) {
                        unlink($imagePath);
                    }
                    die(JsonMsg('success', 'Xóa nền tảng thành công'));
                }
                die(JsonMsg('error', 'Đã xảy ra lỗi khi xóa nền tảng'));
                break;
            case 'removeProvider':
                $id = isset($_POST['id']) ? Anti_xss($_POST['id']) : 0;
                if ($id <= 0) {
                    die(JsonMsg('error', 'Invalid ID'));
                }
                $check = $db->get_row("SELECT * FROM `api_providers` WHERE `id` = {$id}");
                if (!$check) {
                    die(JsonMsg('error', 'IP không tồn tại'));
                }

                // Start a transaction to ensure data consistency
                $db->begin_transaction();

                try {
                    // Delete related services
                    $db->remove("services", "`api_provider_id` = '$id'");

                    $db->query("DELETE FROM `categories` WHERE `id` NOT IN (SELECT DISTINCT `category_id` FROM `services`)");

                    $isRemove = $db->remove("api_providers", "`id` = '$id'");

                    if ($isRemove) {
                        $db->commit();
                        die(JsonMsg('success', 'Xóa nhà cung cấp và dữ liệu liên quan thành công'));
                    } else {
                        throw new Exception('Failed to delete provider');
                    }
                } catch (Exception $e) {
                    $db->rollback();
                    die(JsonMsg('error', 'Đã xảy ra lỗi khi xóa nhà cung cấp: ' . $e->getMessage()));
                }
                break;
            case 'removeCategory':
                if (isset($_POST['id']) && is_numeric($_POST['id'])) {
                    // Single deletion
                    $id = (int)$_POST['id'];
                    if ($id <= 0) {
                        die(JsonMsg('error', 'Invalid ID'));
                    }
                    $check = $db->get_row("SELECT * FROM `categories` WHERE `id` = $id");
                    if (!$check) {
                        die(JsonMsg('error', 'Danh mục không tồn tại'));
                    }
                    $isRemove = $db->remove("categories", "`id` = '$id'");
                    if ($isRemove) {
                        $imagePath = '../..' . $check['image'];
                        if (!empty($check['image']) && file_exists($imagePath)) {
                            unlink($imagePath);
                        }
                        die(JsonMsg('success', 'Xóa danh mục thành công'));
                    }
                    die(JsonMsg('error', 'Đã xảy ra lỗi khi xóa danh mục'));
                } elseif (isset($_POST['ids']) && is_array($_POST['ids']) && !empty($_POST['ids'])) {
                    // Validate and sanitize bulk deletion
                    $ids = array_filter(array_map('intval', $_POST['ids']), function ($id) {
                        return $id > 0;
                    });
                    if (empty($ids)) {
                        die(JsonMsg('error', 'Danh sách ID không hợp lệ'));
                    }
                    // Limit bulk deletion to prevent abuse (e.g., max 100 IDs)
                    if (count($ids) > 100) {
                        die(JsonMsg('error', 'Quá nhiều danh mục được chọn (tối đa 100)'));
                    }
                    $ids_string = implode(',', $ids);
                    // Check if categories exist
                    $existing = $db->get_list("SELECT id, image FROM `categories` WHERE `id` IN ($ids_string)");
                    if (empty($existing)) {
                        die(JsonMsg('error', 'Không có danh mục nào tồn tại'));
                    }
                    $existing_ids = array_column($existing, 'id');
                    $missing_ids = array_diff($ids, $existing_ids);
                    if (!empty($missing_ids)) {
                        die(JsonMsg('error', 'Một số danh mục không tồn tại: ' . implode(', ', $missing_ids)));
                    }
                    $isRemove = $db->remove("categories", "`id` IN ($ids_string)");
                    if ($isRemove) {
                        // Delete associated images
                        foreach ($existing as $category) {
                            $imagePath = '../..' . $category['image'];
                            if (!empty($category['image']) && file_exists($imagePath)) {
                                unlink($imagePath);
                            }
                        }
                        die(JsonMsg('success', 'Xóa các danh mục thành công'));
                    }
                    die(JsonMsg('error', 'Đã xảy ra lỗi khi xóa các danh mục'));
                } else {
                    die(JsonMsg('error', 'Dữ liệu không hợp lệ'));
                }
                break;
            case 'removeUser':
                $id = isset($_POST['id']) ? Anti_xss($_POST['id']) : 0;
                if ($id <= 0) {
                    die(JsonMsg('error', 'Invalid ID'));
                }
                $check = $db->get_row("SELECT * FROM `users` WHERE `id` = {$id}");
                if (!$check) {
                    die(JsonMsg('error', 'Người dùng không tồn tại'));
                }
                $isRemove = $db->remove("users", " `id` = '$id' ");
                if ($isRemove) {
                    die(JsonMsg('success', 'Xóa người dùng thành công'));
                }
                die(JsonMsg('error', 'Đã xảy ra lỗi khi xóa người dùng'));
                break;
            case 'deleteOrder':
                $id = isset($_POST['id']) ? Anti_xss($_POST['id']) : 0;
                if ($id <= 0) {
                    die(JsonMsg('error', 'Invalid ID'));
                }
                $check = $db->get_row("SELECT * FROM `orders` WHERE `id` = {$id}");
                if (!$check) {
                    die(JsonMsg('error', 'Đơn hàng không tồn tại'));
                }
                $isRemove = $db->remove("orders", " `id` = '$id' ");
                if ($isRemove) {
                    die(JsonMsg('success', 'Xóa đơn hàng thành công'));
                }
                die(JsonMsg('error', 'Đã xảy ra lỗi khi xóa đơn hàng'));
                break;
            case 'bulkDeleteOrders':
                $ids = isset($_POST['ids']) && is_array($_POST['ids']) ? array_map('intval', $_POST['ids']) : [];

                if (empty($ids)) {
                    die(JsonMsg('error', 'Không có đơn hàng nào được chọn'));
                }

                try {
                    $ids = array_map('intval', $_POST['ids']);

                    $safeIds = array_map(function ($id) use ($db) {
                        return Anti_xss($id);
                    }, $ids);
                    $placeholders = implode(',', $safeIds);

                    $query = "DELETE FROM orders WHERE id IN ($placeholders)";

                    $db->query($query);

                    die(JsonMsg('success', 'Đơn hàng đã được xóa thành công'));
                } catch (Exception $e) {
                    die(JsonMsg('error', $e->getMessage()));
                }
                break;
            case 'removeCurrency':
                $id = isset($_POST['id']) ? Anti_xss($_POST['id']) : 0;
                if ($id <= 0) {
                    die(JsonMsg('error', 'Invalid ID'));
                }
                $check = $db->get_row("SELECT * FROM `currencies` WHERE `id` = {$id}");
                if (!$check) {
                    die(JsonMsg('error', 'Tiền tệ không tồn tại'));
                }
                $isRemove = $db->remove("currencies", " `id` = '$id' ");
                if ($isRemove) {
                    die(JsonMsg('success', 'Xóa tiền tệ thành công'));
                }
                die(JsonMsg('error', 'Đã xảy ra lỗi khi xóa tiền tệ'));
                break;
            case 'removeBank':
                $id = isset($_POST['id']) ? Anti_xss($_POST['id']) : 0;
                if ($id <= 0) {
                    die(JsonMsg('error', 'Invalid ID'));
                }
                $check = $db->get_row("SELECT * FROM `banks` WHERE `id` = {$id}");
                if (!$check) {
                    die(JsonMsg('error', 'Ngân hàng không tồn tại'));
                }
                $isRemove = $db->remove("banks", " `id` = '$id' ");
                if ($isRemove) {
                    die(JsonMsg('success', 'Xóa ngân hàng thành công'));
                }
                die(JsonMsg('error', 'Đã xảy ra lỗi khi xóa ngân hàng'));
                break;
            case 'removeIP':
                $id = isset($_POST['id']) ? Anti_xss($_POST['id']) : 0;
                if ($id <= 0) {
                    die(JsonMsg('error', 'Invalid ID'));
                }
                $check = $db->get_row("SELECT * FROM `blacklist_ips` WHERE `id` = {$id}");
                if (!$check) {
                    die(JsonMsg('error', 'ID không tồn tại'));
                }
                $isRemove = $db->remove("blacklist_ips", " `id` = '$id' ");
                if ($isRemove) {
                    die(JsonMsg('success', 'Xóa thành công'));
                }
                die(JsonMsg('error', 'Đã xảy ra lỗi khi xóa'));
                break;
            case 'removeLink':
                $id = isset($_POST['id']) ? Anti_xss($_POST['id']) : 0;
                if ($id <= 0) {
                    die(JsonMsg('error', 'Invalid ID'));
                }
                $check = $db->get_row("SELECT * FROM `blacklist_links` WHERE `id` = {$id}");
                if (!$check) {
                    die(JsonMsg('error', 'ID không tồn tại'));
                }
                $isRemove = $db->remove("blacklist_links", " `id` = '$id' ");
                if ($isRemove) {
                    die(JsonMsg('success', 'Xóa thành công'));
                }
                die(JsonMsg('error', 'Đã xảy ra lỗi khi xóa'));
                break;
            case 'removeEmail':
                $id = isset($_POST['id']) ? Anti_xss($_POST['id']) : 0;
                if ($id <= 0) {
                    die(JsonMsg('error', 'Invalid ID'));
                }
                $check = $db->get_row("SELECT * FROM `blacklist_emails` WHERE `id` = {$id}");
                if (!$check) {
                    die(JsonMsg('error', 'ID không tồn tại'));
                }
                $isRemove = $db->remove("blacklist_emails", " `id` = '$id' ");
                if ($isRemove) {
                    die(JsonMsg('success', 'Xóa thành công'));
                }
                die(JsonMsg('error', 'Đã xảy ra lỗi khi xóa'));
                break;
            case 'removeCoupon':
                $id = isset($_POST['id']) ? Anti_xss($_POST['id']) : 0;
                if ($id <= 0) {
                    die(JsonMsg('error', 'Invalid ID'));
                }
                $check = $db->get_row("SELECT * FROM `coupons` WHERE `id` = {$id}");
                if (!$check) {
                    die(JsonMsg('error', 'ID không tồn tại'));
                }
                $isRemove = $db->remove("coupons", " `id` = '$id' ");
                if ($isRemove) {
                    die(JsonMsg('success', 'Xóa thành công'));
                }
                die(JsonMsg('error', 'Đã xảy ra lỗi khi xóa'));
                break;
            case 'removeFaq':
                $faq_id = isset($_POST['id']) ? Anti_xss($_POST['id']) : 0;
                if ($faq_id <= 0) {
                    die(JsonMsg('error', 'Invalid ID'));
                }

                $result = $db->get_row("
                    SELECT cd.id, c.id as content_id
                    FROM content_details cd
                    JOIN contents c ON c.id = cd.content_id
                    WHERE cd.id = " . (int)$faq_id . "
                    AND c.name = 'faq'
                    AND c.type = 'multiple'
                    LIMIT 1
                ");

                if (!$result) {
                    die(JsonMsg('error', 'FAQ item not found'));
                }
                $content_id = (int)$result['content_id'];

                $delete_details_result = $db->query(
                    "
                    DELETE FROM content_details
                    WHERE id = " . (int)$faq_id
                );

                $delete_contents_result = $db->query("
                    DELETE FROM contents
                    WHERE id = " . (int)$content_id . "
                    AND name = 'faq'
                    AND type = 'multiple'
                ");

                if ($delete_details_result && $delete_contents_result) {
                    die(JsonMsg('success', 'Câu hỏi thường gặp đã được xóa thành công'));
                } else {
                    die(JsonMsg('error', 'Failed to delete FAQ'));
                }
                break;
            case 'removeContact':
                $contact_id = isset($_POST['id']) ? Anti_xss($_POST['id']) : 0;
                if ($contact_id <= 0) {
                    die(JsonMsg('error', 'Invalid ID'));
                }

                $result = $db->get_row("
                        SELECT cd.id, c.id as content_id
                        FROM content_details cd
                        JOIN contents c ON c.id = cd.content_id
                        WHERE cd.id = " . (int)$contact_id . "
                        AND c.name = 'contact'
                        AND c.type = 'multiple'
                        LIMIT 1
                    ");

                if (!$result) {
                    die(JsonMsg('error', 'FAQ item not found'));
                }
                $content_id = (int)$result['content_id'];

                $delete_details_result = $db->query(
                    "
                        DELETE FROM content_details
                        WHERE id = " . (int)$contact_id
                );

                $delete_contents_result = $db->query("
                        DELETE FROM contents
                        WHERE id = " . (int)$content_id . "
                        AND name = 'contact'
                        AND type = 'multiple'
                    ");

                if ($delete_details_result && $delete_contents_result) {
                    die(JsonMsg('success', 'Liên kết đã được xóa thành công'));
                } else {
                    die(JsonMsg('error', 'Failed to delete Contact'));
                }
                break;
            default:
                // code...
                break;
        }
    } else {
        die(JsonMsg('error', 'Vui lòng đăng nhập để thực hiện'));
    }
}
