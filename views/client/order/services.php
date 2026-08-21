<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
if (!$user) {
    new Redirect('/login');
    exit;
}
$title = "Danh sách dịch vụ - " . $general_data['title'];
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/header.php');

// Search and filter parameters
$name = isset($_GET['name']) ? Anti_xss($_GET['name']) : '';
$social_id = isset($_GET['social']) ? Anti_xss($_GET['social']) : '';
$category_id = isset($_GET['categories']) ? Anti_xss($_GET['categories']) : '';
$where_clause = "";
$conditions = [];

if (!empty($name)) {
    $conditions[] = "s.service_title LIKE '%$name%'";
}
if (!empty($social_id)) {
    $social_id = intval($social_id);
    $conditions[] = "c.social_media_id = $social_id";
}
if (!empty($category_id)) {
    $category_id = intval($category_id);
    $conditions[] = "c.id = $category_id";
}
if (!empty($conditions)) {
    $where_clause = "AND " . implode(" AND ", $conditions);
}

// Main query (fetch all relevant data)
$sql = "
    SELECT 
        c.*,
        s.id AS service_id,
        s.category_id,
        s.cancel,
        s.api_provider_id,
        s.service_title,
        s.price,
        s.drip_feed,
        s.service_status,
        s.min_amount,
        s.max_amount,
        s.description,
        p.id AS provider_id,
        p.api_name AS provider_name,
        (
            SELECT AVG(TIMESTAMPDIFF(SECOND, o.created_at, o.updated_at))
            FROM orders o
            WHERE o.service_id = s.id
            AND o.status = 'completed'
            AND o.created_at IS NOT NULL
            AND o.updated_at IS NOT NULL
        ) AS avg_time_seconds
    FROM categories c
    INNER JOIN services s ON c.id = s.category_id
    LEFT JOIN api_providers p ON s.api_provider_id = p.id
    WHERE EXISTS (
        SELECT 1 
        FROM services s2 
        WHERE s2.category_id = c.id
    )
    $where_clause
    ORDER BY c.id DESC
";
$categories = $db->get_list($sql);
$groupedCategories = [];
foreach ($categories as $row) {
    $catId = $row['id'];
    if (!isset($groupedCategories[$catId])) {
        $groupedCategories[$catId] = [
            'id' => $row['id'],
            'category_title' => $row['category_title'],
            'service' => []
        ];
    }
    $avg_time = 'No data';
    if (!is_null($row['avg_time_seconds']) && $row['avg_time_seconds'] > 0) {
        $seconds = round($row['avg_time_seconds']);
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
    $groupedCategories[$catId]['service'][] = [
        'id' => $row['service_id'],
        'service_title' => $row['service_title'],
        'price' => $row['price'],
        'drip_feed' => $row['drip_feed'],
        'service_status' => $row['service_status'],
        'min_amount' => $row['min_amount'],
        'max_amount' => $row['max_amount'],
        'description' => $row['description'],
        'cancel' => $row['cancel'],
        'avg_time' => $avg_time
    ];
}

// Pagination parameters
$items_per_page = 10; // Number of categories per page
$current_page = isset($_GET['page']) ? max(1, intval($_GET['page'])) : 1;
$total_categories = count($groupedCategories);
$total_pages = ceil($total_categories / $items_per_page);
$offset = ($current_page - 1) * $items_per_page;

// Slice the groupedCategories array for the current page
$paginatedCategories = array_slice($groupedCategories, $offset, $items_per_page, true);
?>
<style>
    .pagination .page-link {
    color: #6e71ff;
    border-radius: 5px;
    margin: 0 3px;
    transition: all 0.3s ease;
}
.pagination .page-item.active .page-link {
    background-color: #6e71ff;
    border-color: #6e71ff;
    color: #fff;
}
.pagination .page-item.disabled .page-link {
    color: #6c757d;
    cursor: not-allowed;
}
.pagination .page-link:hover {
    background-color: #e9ecef;
    border-color: #dee2e6;
}
</style>
<div class="main-content app-content">
    <div class="container-fluid">
        <!-- Page Header -->
        <div class="d-flex align-items-center justify-content-between page-header-breadcrumb flex-wrap gap-2">
            <div>
                <nav>
                    <ol class="breadcrumb mb-1">
                        <li class="breadcrumb-item"><a href="javascript:void(0);">Trang chủ</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Danh sách dịch vụ</li>
                    </ol>
                </nav>
                <h1 class="page-title fw-medium fs-18 mb-0">Danh sách dịch vụ</h1>
            </div>
        </div>
        <div class="card custom-card">
            <div class="card-body">
                <form class="row g-3" id="order-filter-form" method="GET" action="">
                    <div class="col-md-3">
                        <input class="form-control" name="name" value="<?= htmlspecialchars($name) ?>" placeholder="Tên dịch vụ" />
                    </div>
                    <div class="col-md-3">
                        <select class="js-example-placeholder-single月

System: form-control form-control-lg" name="social" id="social-select">
                            <option value="" <?= empty($social_id) ? 'selected' : '' ?>>Nền tảng</option>
                            <?php foreach ($db->get_list("SELECT * FROM `social_media` WHERE `status` ORDER BY `id` DESC") as $social): ?>
                                <option value="<?= htmlspecialchars($social['id']) ?>"
                                    data-icon="<?= empty($social['icon']) ? '/assets/images/default.png' : htmlspecialchars($social['icon']) ?>"
                                    <?= $social_id == $social['id'] ? 'selected' : '' ?>>
                                    <?= htmlspecialchars($social['name']) ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <select class="js-example-placeholder-single form-control form-control-lg" name="categories" id="category-select">
                            <option value="" <?= empty($category_id) ? 'selected' : '' ?>>Chọn danh mục</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <button class="btn btn-primary-gradient"><i class="bi bi-search me-1"></i>Tìm kiếm</button>
                        <a href="/services" class="btn btn-danger-gradient"><i class="bi bi-x-circle me-1"></i>Bỏ lọc</a>
                    </div>
                </form>
            </div>
        </div>
        <div class="row row-cols row-cols-xl-5 mb-3">
            <div class="col-xl-12">
                <?php if (!empty($paginatedCategories)): ?>
                    <?php foreach ($paginatedCategories as $key => $category): ?>
                        <div class="accordion accordion-customicon1 accordion-primary accordions-items-seperate" id="accordionService">
                            <div class="accordion-item shadow-md mb-4">
                                <div class="accordion-header" id="heading<?php echo $key; ?>">
                                    <button class="accordion-button text-secondary" role="button"
                                        data-bs-toggle="collapse"
                                        data-bs-target="#collapse<?php echo $key; ?>" aria-expanded="<?php echo $key == array_key_first($paginatedCategories) ? 'true' : 'false'; ?>"
                                        aria-controls="collapse<?php echo $key; ?>">
                                        <?php echo lang($category['category_title']); ?>
                                    </button>
                                </div>
                                <div id="collapse<?php echo $key; ?>" class="accordion-collapse collapse <?php echo $key == array_key_first($paginatedCategories) ? 'show' : ''; ?>"
                                    aria-labelledby="heading<?php echo $key; ?>"
                                    data-bs-parent="#accordionService">
                                    <div class="accordion-body">
                                        <div class="table-responsive datatable-custom mt-3">
                                            <table id="datatable-<?php echo $key; ?>"
                                                class="js-datatable table table-borderless table-nowrap table-align-middle">
                                                <thead class="thead-light">
                                                    <tr>
                                                        <th><?php echo lang('ID'); ?></th>
                                                        <th><?php echo lang('Name'); ?></th>
                                                        <th><?php echo lang('Rate Per 1K'); ?></th>
                                                        <th><?php echo lang('Min'); ?></th>
                                                        <th><?php echo lang('Max'); ?></th>
                                                        <th><?php echo lang('Refund'); ?></th>
                                                        <th><?php echo lang('Average Time'); ?></th>
                                                        <th><?php echo lang('Description'); ?></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php foreach ($category['service'] as $service): ?>
                                                        <tr>
                                                            <td><?php echo $service['id']; ?></td>
                                                            <td><?php echo lang(strLimit($service['service_title'], 100)); ?></td>
                                                            <td><?= formatCurrencyF($service['price']); ?></td>
                                                            <td><?= format_cash($service['min_amount']); ?></td>
                                                            <td><?= format_cash($service['max_amount']); ?></td>
                                                            <td><?= $service['cancel'] == 1 ? '<span class="badge bg-success-gradient">Có</span>' : '<span class="badge bg-danger-gradient">Không</span>' ?></td>
                                                            <td><?= $service['avg_time']; ?></td>
                                                            <td>
                                                                <button class="btn btn-sm btn-primary-light view-service"
                                                                    data-service-id="<?= $service['id']; ?>"
                                                                    data-category-id="<?= $category['id']; ?>"
                                                                    data-service-title="<?= htmlspecialchars($service['service_title']) ?>"
                                                                    data-service-description="<?= htmlspecialchars($service['description']) ?>">
                                                                    View
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    <?php endforeach; ?>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                <?php else: ?>
                    <div class="text-center p-4">
                        <img src="/assets/images/empty.png" width="100" />
                        <p>Chưa có dịch vụ nào được tạo</p>
                    </div>
                <?php endif; ?>
                <!-- Pagination -->
                <?php if ($total_pages > 1): ?>
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center mt-4">
                            <!-- Previous Button -->
                            <li class="page-item <?= $current_page <= 1 ? 'disabled' : '' ?>">
                                <a class="page-link" href="<?= buildPaginationUrl($current_page - 1, $name, $social_id, $category_id) ?>" aria-label="Previous">
                                    <span aria-hidden="true">«</span>
                                </a>
                            </li>
                            <!-- Page Numbers -->
                            <?php
                            $start_page = max(1, $current_page - 2);
                            $end_page = min($total_pages, $current_page + 2);
                            if ($start_page > 1) {
                                echo '<li class="page-item"><a class="page-link" href="' . buildPaginationUrl(1, $name, $social_id, $category_id) . '">1</a></li>';
                                if ($start_page > 2) {
                                    echo '<li class="page-item disabled"><span class="page-link">...</span></li>';
                                }
                            }
                            for ($i = $start_page; $i <= $end_page; $i++): ?>
                                <li class="page-item <?= $i == $current_page ? 'active' : '' ?>">
                                    <a class="page-link" href="<?= buildPaginationUrl($i, $name, $social_id, $category_id) ?>"><?= $i ?></a>
                                </li>
                            <?php endfor; ?>
                            <?php if ($end_page < $total_pages): ?>
                                <?php if ($end_page < $total_pages - 1): ?>
                                    <li class="page-item disabled"><span class="page-link">...</span></li>
                                <?php endif; ?>
                                <li class="page-item">
                                    <a class="page-link" href="<?= buildPaginationUrl($total_pages, $name, $social_id, $category_id) ?>"><?= $total_pages ?></a>
                                </li>
                            <?php endif; ?>
                            <!-- Next Button -->
                            <li class="page-item <?= $current_page >= $total_pages ? 'disabled' : '' ?>">
                                <a class="page-link" href="<?= buildPaginationUrl($current_page + 1, $name, $social_id, $category_id) ?>" aria-label="Next">
                                    <span aria-hidden="true">»</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="serviceModal" tabindex="-1" aria-labelledby="serviceModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="serviceModalLabel">Service Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p id="serviceDescription"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <a href="#" id="buyNowButton" class="btn btn-primary">Đặt đơn</a>
            </div>
        </div>
    </div>
</div>


<script>
    $('#social-select').on('change', function() {
        var socialMediaId = $(this).val();
        if (socialMediaId) {
            loadCategories(socialMediaId);
        } else {
            $('#category-select').empty().append('<option value="">Chọn danh mục</option>').trigger('change');
        }
        // Reset page to 1 on filter change
        $('input[name="page"]').val(1);
    });

    $('#category-select').on('change', function() {
        // Reset page to 1 on category change
        $('input[name="page"]').val(1);
    });

    function loadCategories(socialMediaId) {
        Notiflix.Loading.standard('Đang tải danh mục...');
        $.ajax({
            url: '/model/load/categories',
            type: 'POST',
            data: {
                social_media_id: socialMediaId
            },
            dataType: 'json',
            success: function(response) {
                Notiflix.Loading.remove();
                if (response.status === "success" && response.data.length > 0) {
                    let categorySelect = $('select[name="categories"]');
                    categorySelect.empty();
                    categorySelect.append('<option value="">Chọn danh mục</option>');
                    $.each(response.data, function(index, category) {
                        categorySelect.append(`<option value="${category.id}">${category.name}</option>`);
                    });
                    <?php if (!empty($category_id)): ?>
                        categorySelect.val('<?php echo $category_id; ?>').trigger('change');
                    <?php endif; ?>
                } else {
                    Notiflix.Notify.failure('Không có danh mục nào!');
                    $('select[name="categories"]').empty().append('<option value="">Chọn danh mục</option>');
                    $('select[name="service"]').empty().append('<option value="">Chọn dịch vụ</option>');
                    clearServiceDetails();
                }
            },
            error: function() {
                Notiflix.Loading.remove();
                Notiflix.Notify.failure('Có lỗi xảy ra khi tải danh mục!');
            }
        });
    }

    $('.view-service').on('click', function() {
        var serviceId = $(this).data('service-id');
        var categoryId = $(this).data('category-id');
        var serviceTitle = $(this).data('service-title');
        var serviceDescription = $(this).data('service-description') || 'Không có mô tả';

        $('#serviceModalLabel').text(serviceTitle);
        $('#serviceDescription').text(serviceDescription);
        $('#buyNowButton').attr('href', '/user/order/create?category_id=' + categoryId + '&service_id=' + serviceId);

        $('#serviceModal').modal('show');
    });

    <?php if (!empty($social_id)): ?>
        loadCategories('<?php echo $social_id; ?>');
    <?php endif; ?>
</script>

<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/footer.php'); ?>