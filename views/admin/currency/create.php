<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php'); ?>
<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $data_user['role'] == 1) {
    if ($general_data['status_demo'] == 1) {
        alertBack("Đây là trang web demo bạn không thể thực hiện thao tác");
    }
    // Lấy dữ liệu từ form
    $currency_code = Anti_xss($_POST['currency_code']);
    $currency_symbol = Anti_xss($_POST['currency_symbol']);
    $currency_position = Anti_xss($_POST['currency_position']);
    $currency_thousand_separator = Anti_xss($_POST['currency_thousand_separator']);
    $currency_decimal_separator = Anti_xss($_POST['currency_decimal_separator']);
    $currency_decimal = Anti_xss($_POST['currency_decimal']);
    $new_currency_rate = (int)$_POST['new_currecry_rate']; // Ép kiểu sang int
    $status = isset($_POST['status']) ? 1 : 0;

    // Tạo tên tiền tệ dựa trên currency_code (có thể tùy chỉnh)
    $currency_name = $currency_code; // Có thể lấy từ danh sách tên tiền tệ đầy đủ

    // Dữ liệu để chèn vào bảng currencies
    $data = [
        'name' => $currency_name,
        'currency_code' => $currency_code,
        'currency_symbol' => $currency_symbol,
        'currency_thousand_separator' => $currency_thousand_separator,
        'currency_decimal_separator' => $currency_decimal_separator,
        'currency_decimal' => $currency_decimal,
        'default_price_percentage_increase' => '0', // Giá trị mặc định
        'auto_rounding_x_decimal_places' => '2',   // Giá trị mặc định
        'is_auto_currency_convert' => '0',         // Giá trị mặc định
        'currency_position' => $currency_position,
        'new_currecry_rate' => $new_currency_rate,
        'status' => $status,
        'created_at' => gettime(),
        'updated_at' => gettime()
    ];

    // Kết nối cơ sở dữ liệu (giả định $db là đối tượng kết nối)
    if ($db->insert('currencies', $data)) {
        alertBack("Thêm tiền tệ thành công");
    } else {
        alertBack("Lỗi khi thêm tiền tệ");
    }
    $db->dis_connect();
}
?>
<div class="content-body">
    <div class="page-titles">
        <ol class="breadcrumb">
            <li>
                <h5 class="bc-title">Tiền tệ</h5>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Quản lý tiền tệ </a>
            </li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Thêm mới</a></li>
        </ol>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-12">
                <div class="card card-collapse">
                    <div class="card-header">
                        <h3 class="card-title">Thêm tiền tệ</h3>
                        <a class="collapse-indicator" data-bs-toggle="collapse" href="#collapseFilter" role="button" aria-expanded="true" aria-controls="collapseFilter">
                            <i class="fa fa-angle-down"></i>
                        </a>
                    </div>
                    <div class="collapsed collapse show" id="collapseFilter">
                        <div class="card-body">
                            <form action="" method="POST" enctype="multipart/form-data">
                                <div class="row mb-3">
                                    <div class="col-md-4">
                                        <label for="currency_code" class="form-label">Mã tiền tệ</label>
                                        <select name="currency_code" id="currency_code" class="form-control" fdprocessedid="84xpq">
                                            <option value="VND">VND - Việt Nam Đồng</option>
                                            <option value="AUD">AUD - Australian dollar</option>
                                            <option value="BRL">BRL - Brazilian dollar</option>
                                            <option value="CAD">CAD - Canadian dollar</option>
                                            <option value="CZK">CZK - Czech koruna</option>
                                            <option value="DKK">DKK - Danish krone</option>
                                            <option value="EUR">EUR - Euro</option>
                                            <option value="HKD">HKD - Hong Kong dollar</option>
                                            <option value="HUF">HUF - Hungarian forint</option>
                                            <option value="INR">INR - Indian rupee</option>
                                            <option value="ILS">ILS - Israeli</option>
                                            <option value="JPY">JPY - Japanese yen</option>
                                            <option value="MYR">MYR - Malaysian ringgit</option>
                                            <option value="MXN">MXN - Mexican peso</option>
                                            <option value="TWD">TWD - New Taiwan dollar</option>
                                            <option value="NZD">NZD - New Zealand dollar</option>
                                            <option value="NOK">NOK - Norwegian krone</option>
                                            <option value="PHP">PHP - Philippine peso</option>
                                            <option value="PLN">PLN - Polish złoty</option>
                                            <option value="GBP">GBP - Pound sterling</option>
                                            <option value="RUB">RUB - Russian ruble</option>
                                            <option value="SGD">SGD - Singapore dollar</option>
                                            <option value="SEK">SEK - Swedish krona</option>
                                            <option value="CHF">CHF - Swiss franc</option>
                                            <option value="THB">THB - Thai baht</option>
                                            <option value="USD">USD - United States dollar</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="form-label" for="currency_symbol">Ký hiệu tiền tệ</label>
                                            <input class="form-control" name="currency_symbol" id="currency_symbol" value="₫" fdprocessedid="u8q4yl">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="form-label" for="currency_position">Vị trí của ký hiệu tiền tệ</label>
                                            <select name="currency_position" id="currency_position" class="form-control square" fdprocessedid="4x9unq">
                                                <option value="left"> Trái</option>
                                                <option value="right"> Phải</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-3">

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="form-label" for="currency_thousand_separator">Tách đơn vị ngàn</label>
                                            <select name="currency_thousand_separator" id="currency_thousand_separator" class="form-control square" fdprocessedid="yneo1w">
                                                <option value="dot"> Dot</option>
                                                <option value="comma"> Comma</option>
                                                <option value="space"> Space</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="currency_decimal_separator" class="form-label">Phân số thập phân</label>
                                            <select name="currency_decimal_separator" id="currency_decimal_separator" class="form-control square" fdprocessedid="a77xb">
                                                <option value="dot"> Dot</option>
                                                <option value="comma"> Comma</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="form-label" for="currency_decimal">Số thập phân của tiền tệ</label>
                                            <select name="currency_decimal" id="currency_decimal" class="form-control square" fdprocessedid="btvwtn">
                                                <option value="0"> 0</option>
                                                <option value="1"> 0.0</option>
                                                <option value="2"> 0.00</option>
                                                <option value="3"> 0.000</option>
                                                <option value="4"> 0.0000</option>
                                            </select>
                                        </div>
                                    </div>

                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="new_currecry_rate">Tỷ giá tiền tệ</label>
                                    <input type="number" class="form-control" name="new_currecry_rate" id="new_currecry_rate" value="1" required="" fdprocessedid="x2weob">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Trạng thái</label>
                                    <div class="form-check custom-checkbox mb-3">
                                        <input class="form-check-input" type="checkbox" name="status" id="checkboxDeactivation" value="1" checked>
                                        <label class="form-check-label" for="checkboxDeactivation">Hiển thị</label>
                                    </div>
                                </div>
                                <button class="btn btn-primary" type="submit">Thêm Ngay</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php'); ?>