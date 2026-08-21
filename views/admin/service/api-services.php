<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php'); ?>
<?php
if (!isset($_SESSION['api_services']) || !isset($_SESSION['api_provider'])) {
    new Redirect('/admin/service');
}

$services = $_SESSION['api_services'];
$apiProvider = $_SESSION['api_provider'];
$providerId = $_SESSION['provider_id'];
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
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Thêm dịch vụ</a></li>
        </ol>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header py-3 d-sm-flex d-block align-items-center">
                        <h4 class="card-title">Danh mục</h4>
                        <div class="clearfix">
                            <button type="button" class="btn btn-primary import-multiple" data-bs-toggle="modal" data-bs-target="#addBulkServiceModal">
                                + Thêm dịch vụ hàng loạt</button>
                        </div>
                    </div>
                    <div class="card-body table-card-body px-0 pt-0 pb-2">
                        <div class="table-responsive p-4">
                            <table id="servicesTable" class="table table-borderless table-nowrap table-align-middle card-table">
                                <thead>
                                    <tr>
                                        <th>ID Dịch vụ</th>
                                        <th>Tên dịch vụ</th>
                                        <th>Giá</th>
                                        <th>Danh mục</th>
                                        <th>Số lượng tối thiểu</th>
                                        <th>Số lượng tối đa</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($services as $service): ?>
                                        <tr>
                                            <td><?php echo htmlspecialchars($service['service'] ?? 'N/A'); ?></td>
                                            <td><?php echo htmlspecialchars($service['name'] ?? 'N/A'); ?></td>
                                            <td><?= formatCurrencyF($service['rate']); ?></td>
                                            <td><?php echo htmlspecialchars($service['category'] ?? 'N/A'); ?></td>
                                            <td><?php echo htmlspecialchars($service['min'] ?? 'N/A'); ?></td>
                                            <td><?php echo htmlspecialchars($service['max'] ?? 'N/A'); ?></td>
                                            <td>
                                                <button type="button" class="btn btn-sm btn-success import-single"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#addServiceModal"
                                                    data-service-id="<?php echo htmlspecialchars($service['service'] ?? 'N/A'); ?>"
                                                    data-name="<?php echo htmlspecialchars($service['name'] ?? 'N/A'); ?>"
                                                    data-category="<?php echo htmlspecialchars($service['category'] ?? 'N/A'); ?>"
                                                    data-rate="<?php echo htmlspecialchars($service['rate'] ?? 'N/A'); ?>"
                                                    data-min="<?php echo htmlspecialchars($service['min'] ?? 'N/A'); ?>"
                                                    data-max="<?php echo htmlspecialchars($service['max'] ?? 'N/A'); ?>"
                                                    data-dripfeed="1"
                                                    data-provider="<?php echo htmlspecialchars($providerId); ?>">
                                                    <i class="fa fa-plus me-1"></i> Add Service
                                                </button>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                            <a href="/admin/api-services" class="btn btn-secondary mt-3">Quay lại</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Service Modal -->
<div class="modal fade" id="addServiceModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="addServiceModalLabel">Xác nhận thêm dịch vụ</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="post" id="importForm">
                <div class="modal-body">
                    <label for="increasePercentageLabel" class="form-label">Chọn phần trăm tăng</label>
                    <select class="selectpicker form-select" name="price_percentage_increase" autocomplete="off">
                        <?php for ($i = 0; $i <= 1000; $i++): ?>
                            <option value="<?= $i ?>"><?= $i ?> %</option>
                        <?php endfor; ?>
                    </select>
                    <!-- Các input ẩn để chứa dữ liệu -->
                    <input type="hidden" name="service_id" id="service_id">
                    <input type="hidden" name="name" id="service_name">
                    <input type="hidden" name="category" id="service_category">
                    <input type="hidden" name="rate" id="service_rate">
                    <input type="hidden" name="min" id="service_min">
                    <input type="hidden" name="max" id="service_max">
                    <input type="hidden" name="dripfeed" id="service_dripfeed">
                    <input type="hidden" name="provider" id="service_provider">
                    <p>Bạn có thực sự muốn thêm dịch vụ này không?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-white" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-sm btn-primary">Confirm</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Add Service Modal -->

<div class="modal fade" id="addBulkServiceModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="addServiceModalLabel">Nhập dịch vụ</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="importMultipleForm">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="selectedValue" class="form-label">Giới hạn thêm hàng loạt</label>
                        <div class="tom-select-custom">
                            <select class="selectpicker form-select" name="import_quantity" id="selectedValue" autocomplete="off">
                                <option value="selectItem" class="selectedServices">Thêm 0 Dịch vụ đã chọn</option>
                                <option value="25">25</option>
                                <option value="50">50</option>
                                <option value="75">75</option>
                                <option value="100">100</option>
                                <option value="125">125</option>
                                <option value="150">150</option>
                                <option value="175">175</option>
                                <option value="200">200</option>
                                <option value="225">225</option>
                                <option value="250">250</option>
                                <option value="275">275</option>
                                <option value="300">300</option>
                                <option value="325">325</option>
                                <option value="350">350</option>
                                <option value="375">375</option>
                                <option value="400">400</option>
                                <option value="425">425</option>
                                <option value="450">450</option>
                                <option value="475">475</option>
                                <option value="500">500</option>
                                <option value="525">525</option>
                                <option value="550">550</option>
                                <option value="575">575</option>
                                <option value="600">600</option>
                                <option value="625">625</option>
                                <option value="650">650</option>
                                <option value="675">675</option>
                                <option value="700">700</option>
                                <option value="725">725</option>
                                <option value="750">750</option>
                                <option value="775">775</option>
                                <option value="800">800</option>
                                <option value="825">825</option>
                                <option value="850">850</option>
                                <option value="875">875</option>
                                <option value="900">900</option>
                                <option value="925">925</option>
                                <option value="950">950</option>
                                <option value="975">975</option>
                                <option value="1000">1000</option>
                                <option value="all">All</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="increasePercentageLabel" class="form-label">Chọn phần trăm tăng</label>
                        <div class="tom-select-custom">
                            <select class="selectpicker form-select" name="price_percentage_increase" autocomplete="off">
                                <?php for ($i = 0; $i <= 1000; $i++): ?>
                                    <option value="<?= $i ?>"><?= $i ?> %</option>
                                <?php endfor; ?>
                            </select>
                        </div>
                    </div>
                    <input type="hidden" name="provider" value="<?php echo htmlspecialchars($providerId); ?>">
                    <p>Bạn có thực sự muốn nhập tất cả dịch vụ không?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Xác Nhận</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function() {
        $('#servicesTable').DataTable({
            "paging": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "pageLength": 10,
            "pagingType": "numbers",
            "language": {
                "url": "https://cdn.datatables.net/plug-ins/1.13.6/i18n/vi.json"
            }
        });
        $('.import-single').on('click', function() {
            // Lấy dữ liệu từ các thuộc tính data-*
            var serviceId = $(this).data('service-id');
            var name = $(this).data('name');
            var category = $(this).data('category');
            var rate = $(this).data('rate');
            var min = $(this).data('min');
            var max = $(this).data('max');
            var dripfeed = $(this).data('dripfeed');
            var provider = $(this).data('provider');

            // Điền dữ liệu vào các input trong modal
            $('#service_id').val(serviceId);
            $('#service_name').val(name);
            $('#service_category').val(category);
            $('#service_rate').val(rate);
            $('#service_min').val(min);
            $('#service_max').val(max);
            $('#service_dripfeed').val(dripfeed);
            $('#service_provider').val(provider);
        });

        $('#importForm').on('submit', function(e) {
            e.preventDefault();
            var form = this;

            Notiflix.Confirm.show(
                'Xác nhận thêm dịch vụ',
                'Bạn có chắc chắn muốn thêm dịch vụ này không?',
                'Có',
                'Không',
                function okCb() {
                    console.log('Người dùng nhấn Có');
                    Notiflix.Loading.standard('Đang xử lý...');
                    $.ajax({
                        url: '/model/admin/service/import-single', // URL endpoint xử lý ở backend
                        type: 'POST',
                        data: $(form).serialize(), // Gửi toàn bộ dữ liệu form
                        contentType: 'application/x-www-form-urlencoded',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status == "success") {
                                Notiflix.Notify.success(response.msg);
                                setTimeout(() => {
                                    window.location.href = '/admin/service';
                                }, 2000);
                            } else {
                                Notiflix.Notify.failure(response.msg);
                            }
                        },
                        error: function(xhr) {
                            console.log('Error:', xhr);
                            Notiflix.Loading.remove();
                            Notiflix.Notify.failure('Đã xảy ra lỗi khi gửi yêu cầu.');
                        }
                    });
                },
                function cancelCb() {
                    console.log('Người dùng nhấn Không');
                }, {
                    titleColor: '#ff5549',
                    okButtonBackground: '#ff5549',
                    cancelButtonBackground: '#a9a9a9'
                }
            );
        });

        $('#importMultipleForm').on('submit', function(e) {
            e.preventDefault();
            var form = this;
            Notiflix.Confirm.show(
                'Xác nhận nhập dịch vụ',
                'Bạn có chắc chắn muốn nhập các dịch vụ này không?',
                'Có',
                'Không',
                function okCb() {
                    console.log('Người dùng nhấn Có');
                    Notiflix.Loading.standard('Đang xử lý...');
                    $.ajax({
                        url: '/model/admin/service/import-multiple',
                        type: 'POST',
                        data: $(form).serialize(),
                        contentType: 'application/x-www-form-urlencoded',
                        success: function(response) {

                            Notiflix.Loading.remove();
                            if (response.status == "success") {
                                Notiflix.Notify.success(response.msg);
                                setTimeout(() => {
                                    window.location.href = '/admin/service';
                                }, 2000);
                            } else {
                                Notiflix.Notify.failure(response.msg);
                            }
                        },
                        error: function(xhr) {
                            console.log('Error:', xhr);
                            Notiflix.Loading.remove();
                            Notiflix.Notify.failure('Đã xảy ra lỗi khi gửi yêu cầu.');
                        }
                    });
                },
                function cancelCb() {
                    console.log('Người dùng nhấn Không');
                }, {
                    titleColor: '#ff5549',
                    okButtonBackground: '#ff5549',
                    cancelButtonBackground: '#a9a9a9'
                }
            );
        });
    });
</script>
<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php'); ?>