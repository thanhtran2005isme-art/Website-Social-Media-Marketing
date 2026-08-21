<?php
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php');

if (isset($_GET['id']) && $data_user['role'] == 1) {
    $service = $db->get_row("SELECT * FROM `services` WHERE `id` = '" . Anti_xss($_GET['id']) . "' ");
    if (!$service) {
        new Redirect('/admin/service');
    }
} else {
    new Redirect('/admin/service');
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && $data_user['role'] == 1) {
    if ($general_data['status_demo'] == 1) {
        alertBack("Đây là trang web demo bạn không thể thực hiện thao tác");
    }

    // Debug POST data
    var_dump($_POST); // Inspect all POST data
    error_log(print_r($_POST, true)); // Log POST data to error log

    $name = Anti_xss($_POST['name']);
    $category = Anti_xss($_POST['category']);
    $min_amount = Anti_xss($_POST['min_amount']);
    $max_amount = Anti_xss($_POST['max_amount']);
    $price = Anti_xss($_POST['price']);
    $status = isset($_POST['status']) ? 1 : 0;
    $drip_feed = isset($_POST['drip_feed']) ? 1 : 0;
    $manual_api = Anti_xss($_POST['manual_api']);
    $refill = isset($_POST['refill']) ? Anti_xss($_POST['refill']) : 0;
    $description = Anti_xss($_POST['description']);
    $service_type = isset($_POST['service_type']) ? Anti_xss($_POST['service_type']) : 'Default';

    // Debug service_type specifically
    error_log("Service Type: " . $service_type);

    if (empty($name) || empty($category) || empty($min_amount) || empty($max_amount) || empty($price)) {
        alertBack("Vui lòng điền đầy đủ các trường bắt buộc!");
    }

    $data = [
        'service_title' => $name,
        'category_id' => $category,
        'min_amount' => $min_amount,
        'max_amount' => $max_amount,
        'price' => $price,
        'service_status' => $status,
        'drip_feed' => $drip_feed,
        'is_refill_automatic' => $manual_api,
        'refill' => $refill,
        'service_type' => $service_type,
        'description' => $description,
        'created_at' => gettime(),
        'updated_at' => gettime()
    ];

    if ($manual_api == 1) {
        $api_provider_id = isset($_POST['api_provider_id']) ? Anti_xss($_POST['api_provider_id']) : 0;
        $api_service_id = isset($_POST['api_service_id']) ? Anti_xss($_POST['api_service_id']) : 0;

        $data['api_provider_id'] = $api_provider_id;
        $data['api_service_id'] = $api_service_id;
    } else {
        $data['api_provider_id'] = 0;
        $data['api_service_id'] = 0;
    }

    // Log the update query
    $condition = "id = '" . $service['id'] . "'";
    error_log("Update Query: UPDATE services SET " . http_build_query($data, '', ', ') . " WHERE $condition");

    if ($db->update('services', $data, $condition)) {
        alertBack("Cập nhật dịch vụ thành công!");
    } else {
        alertBack("Lỗi khi cập nhật dịch vụ!");
    }
    $db->dis_connect();
}
$manual_api_initial = $service['is_refill_automatic'] ?? 0;
?>

<div class="content-body">
    <div class="page-titles">
        <ol class="breadcrumb">
            <li>
                <h5 class="bc-title">Dịch vụ</h5>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Home </a>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">Dịch vụ</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Chỉnh sửa dịch vụ [<?= $service['service_title'] ?>]</a></li>
        </ol>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-12">
                <div class="card card-collapse">
                    <div class="card-header">
                        <h3 class="card-title">Chỉnh sửa dịch vụ [<?= $service['service_title'] ?>]</h3>
                        <a class="collapse-indicator" data-bs-toggle="collapse" href="#collapseFilter" role="button" aria-expanded="true" aria-controls="collapseFilter">
                            <i class="fa fa-angle-down"></i>
                        </a>
                    </div>
                    <div class="collapsed collapse show" id="collapseFilter">
                        <div class="card-body">
                            <form action="" method="POST" enctype="multipart/form-data">
                                <div class="row mb-4 d-flex align-items-center">
                                    <div class="col-md-6">
                                        <label for="nameLabel" class="form-label">Tên dịch vụ</label>
                                        <input type="text" class="form-control" name="name" id="nameLabel" placeholder="Name" aria-label="Name" autocomplete="off" value="<?= $service['service_title'] ?>">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="categoryLabel" class="form-label">Danh mục</label>
                                        <div class="tom-select-custom">
                                            <select class="selectpicker form-select" name="category" autocomplete="off">
                                                <option value="">Select category</option>
                                                <?php foreach ($db->get_list("SELECT * FROM `categories` WHERE `status` = 1 ORDER BY `id` DESC") as $cate): ?>
                                                    <option value="<?= $cate['id'] ?>" <?= $service['category_id'] == $cate['id'] ? 'selected' : '' ?>><?= $cate['category_title'] ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-4 d-flex align-items-center">
                                    <div class="col-md-6">
                                        <label for="minAmountLabel" class="form-label">Mua tối thiểu</label>
                                        <input type="number" class="form-control" name="min_amount" id="minAmountLabel" placeholder="Min Amount" aria-label="Min Amount" autocomplete="off" value="<?= $service['min_amount'] ?>">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="maxAmountLabel" class="form-label">Mua tối đa</label>
                                        <input type="number" class="form-control" name="max_amount" id="maxAmountLabel" placeholder="Max Amount" aria-label="Max Amount" autocomplete="off" value="<?= $service['max_amount'] ?>">
                                    </div>
                                </div>

                                <div class="row align-items-center">
                                    <div class="col-md-6">
                                        <label for="priceLabel" class="form-label">Giá 1k tương tác</label>
                                        <input type="text" class="form-control" name="price" id="priceLabel" placeholder="Price" aria-label="Price" autocomplete="off" value="<?= $service['price'] ?>">
                                    </div>
                                    <div class="col-md-3">
                                        <div class="row align-items-center mt-4">
                                            <div class="col-md-4">
                                                <label class="form-label mb-md-0">Trạng thái</label>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" type="checkbox" role="switch" name="status" <?= $service['service_status'] == 1 ? 'checked' : '' ?>>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 mb-3 mb-md-0">
                                        <div class="row align-items-center mt-4">
                                            <div class="col-md-4">
                                                <label class="form-label mb-md-0">Drip Feed</label>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" type="checkbox" role="switch" name="drip_feed" <?= $service['drip_feed'] == 1 ? 'checked' : '' ?>>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="text-start mt-5">
                                    <ul class="nav nav-pills nav-pills-sm nav-pills-bg gap-2" id="myTab3" role="tablist">
                                        <li class="nav-item" role="presentation">
                                            <button type="button" class="nav-link <?= $service['is_refill_automatic'] == 0 ? 'active' : '' ?>"
                                                id="manual-tab" href="#manual-content" data-bs-toggle="tab"
                                                aria-selected="<?= $service['is_refill_automatic'] == 0 ? 'true' : 'false' ?>" role="tab">Thủ công</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button type="button" class="nav-link <?= $service['is_refill_automatic'] == 1 ? 'active' : '' ?>"
                                                id="api-tab" href="#api-content" data-bs-toggle="tab"
                                                aria-selected="<?= $service['is_refill_automatic'] == 1 ? 'true' : 'false' ?>" role="tab">API</button>
                                        </li>
                                    </ul>
                                </div>

                                <input class="manual_api" type="hidden" name="manual_api" value="<?= $manual_api_initial ?>">

                                <div class="tab-content">
                                    <div class="tab-pane fade <?= $service['is_refill_automatic'] == 0 ? 'show active' : '' ?>" id="manual-content" role="tabpanel" aria-labelledby="manual-tab">
                                        <!-- Empty for Manual tab -->
                                    </div>
                                    <div class="tab-pane fade <?= $service['is_refill_automatic'] == 1 ? 'show active' : '' ?>" id="api-content" role="tabpanel" aria-labelledby="api-tab">
                                        <div class="row mt-3">
                                            <div class="col-md-4 mb-3">
                                                <label for="apiProviderLabel" class="form-label">Nhà cung cấp API</label>
                                                <div class="tom-select-custom">
                                                    <select class="selectpicker form-select" name="api_provider_id">
                                                        <option value="">Select API Provider</option>
                                                        <?php foreach ($db->get_list("SELECT * FROM `api_providers` WHERE `status` = 1 ORDER BY `id` DESC") as $provider): ?>
                                                            <option value="<?= $provider['id'] ?>" <?= $service['api_provider_id'] == $provider['id'] ? 'selected' : '' ?>><?= $provider['api_name'] ?></option>
                                                        <?php endforeach; ?>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-4 mb-3">
                                                <label for="apiServiceIdLabel" class="form-label">API Service ID</label>
                                                <input type="text" class="form-control" name="api_service_id" id="apiServiceIdLabel" placeholder="API Service Id" aria-label="API Service Id" autocomplete="off" value="<?= $service['api_service_id'] ?>">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Unified service_type field -->
                                <div class="mt-3">
                                    <label for="serviceTypeLabel" class="form-label">Loại dịch vụ</label>
                                    <div class="tom-select-custom">
                                        <select class="selectpicker form-select" name="service_type" id="serviceTypeLabel" autocomplete="off">
                                            <option value="Default" <?= $service['service_type'] == 'Default' ? 'selected' : '' ?>>Default</option>
                                            <option value="Custom Comments" <?= $service['service_type'] == 'Custom Comments' ? 'selected' : '' ?>>Custom Comments</option>
                                            <option value="Comment Likes" <?= $service['service_type'] == 'Comment Likes' ? 'selected' : '' ?>>Comment Likes</option>
                                            <option value="Mentions" <?= $service['service_type'] == 'Mentions' ? 'selected' : '' ?>>Mentions</option>
                                            <option value="Mentions Hashtag" <?= $service['service_type'] == 'Mentions Hashtag' ? 'selected' : '' ?>>Mentions Hashtag</option>
                                            <option value="Package" <?= $service['service_type'] == 'Package' ? 'selected' : '' ?>>Package</option>
                                            <option value="Special" <?= $service['service_type'] == 'Special' ? 'selected' : '' ?>>Special</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="mt-3">
                                    <label for="refillLabel" class="form-label">Select Refill</label>
                                    <select class="selectpicker form-select" name="refill" id="refill" autocomplete="off">
                                        <option disabled value="" selected>Select Refill</option>
                                        <option value="1" <?= $service['refill'] == 1 ? 'selected' : '' ?>>Manual</option>
                                        <option value="0" <?= $service['refill'] == 0 ? 'selected' : '' ?>>Off</option>
                                    </select>
                                </div>

                                <div class="mt-3">
                                    <label class="form-label" for="description">Mô tả dịch vụ</label>
                                    <textarea id="description" class="form-control" name="description" placeholder="Mô tả dịch vụ" rows="3"><?= $service['description'] ?></textarea>
                                </div>

                                <div class="mt-5">
                                    <button type="submit" class="btn btn-primary">Lưu Ngay</button>
                                    <a href="/admin/service" type="button" class="btn btn-danger">Quay Lại</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const manualTab = document.querySelector('#manual-tab');
        const apiTab = document.querySelector('#api-tab');
        const manualApiInput = document.querySelector('.manual_api');

        manualTab.addEventListener('shown.bs.tab', function() {
            manualApiInput.value = '0';
            console.log('Manual tab active, manual_api set to 0');
        });

        apiTab.addEventListener('shown.bs.tab', function() {
            manualApiInput.value = '1';
            console.log('API tab active, manual_api set to 1');
        });

        document.querySelector('form').addEventListener('submit', function() {
            const activeTab = document.querySelector('.nav-link.active');
            manualApiInput.value = activeTab.id === 'manual-tab' ? '0' : '1';
            console.log('Form submitted, manual_api: ' + manualApiInput.value);
        });
    });
</script>

<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php'); ?>