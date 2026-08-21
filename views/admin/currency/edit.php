<?php
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php');
if (isset($_GET['id']) && is_numeric($_GET['id']) && $data_user['role'] == 1) {
    $currency = $db->get_row(" SELECT * FROM `currencies` WHERE `id` = '" . Anti_xss($_GET['id']) . "'  ");
    if (!$currency) {
        new Redirect('/admin/currency');
    }
} else {
    new Redirect('/admin/currency');
}

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
    $new_currency_rate = (int)$_POST['new_currecry_rate'];
    $status = isset($_POST['status']) ? 1 : 0;

    // Tạo tên tiền tệ dựa trên currency_code
    $currency_name = $currency_code; // Có thể ánh xạ với tên đầy đủ

    // Dữ liệu để cập nhật
    $data = [
        'name' => $currency_name,
        'currency_code' => $currency_code,
        'currency_symbol' => $currency_symbol,
        'currency_thousand_separator' => $currency_thousand_separator,
        'currency_decimal_separator' => $currency_decimal_separator,
        'currency_decimal' => $currency_decimal,
        'currency_position' => $currency_position,
        'new_currecry_rate' => $new_currency_rate,
        'status' => $status,
        'updated_at' => gettime()
    ];

    // Cập nhật vào cơ sở dữ liệu
    if ($db->update('currencies', $data, "id = '" . $currency['id'] . "'")) {
        alertBack("Cập nhật tiền tệ thành công");
    } else {
        alertBack("Lỗi khi cập nhật tiền tệ");
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
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Chỉnh sửa</a></li>
        </ol>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-12">
                <div class="card card-collapse">
                    <div class="card-header">
                        <h3 class="card-title">Chỉnh sửa tiền tệ</h3>
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
                                        <select name="currency_code" id="currency_code" class="form-control" required>
                                            <option value="VND" <?php echo $currency['currency_code'] == 'VND' ? 'selected' : ''; ?>>VND - Việt Nam Đồng</option>
                                            <option value="AUD" <?php echo $currency['currency_code'] == 'AUD' ? 'selected' : ''; ?>>AUD - Australian dollar</option>
                                            <option value="BRL" <?php echo $currency['currency_code'] == 'BRL' ? 'selected' : ''; ?>>BRL - Brazilian dollar</option>
                                            <option value="CAD" <?php echo $currency['currency_code'] == 'CAD' ? 'selected' : ''; ?>>CAD - Canadian dollar</option>
                                            <option value="CZK" <?php echo $currency['currency_code'] == 'CZK' ? 'selected' : ''; ?>>CZK - Czech koruna</option>
                                            <option value="DKK" <?php echo $currency['currency_code'] == 'DKK' ? 'selected' : ''; ?>>DKK - Danish krone</option>
                                            <option value="EUR" <?php echo $currency['currency_code'] == 'EUR' ? 'selected' : ''; ?>>EUR - Euro</option>
                                            <option value="HKD" <?php echo $currency['currency_code'] == 'HKD' ? 'selected' : ''; ?>>HKD - Hong Kong dollar</option>
                                            <option value="HUF" <?php echo $currency['currency_code'] == 'HUF' ? 'selected' : ''; ?>>HUF - Hungarian forint</option>
                                            <option value="INR" <?php echo $currency['currency_code'] == 'INR' ? 'selected' : ''; ?>>INR - Indian rupee</option>
                                            <option value="ILS" <?php echo $currency['currency_code'] == 'ILS' ? 'selected' : ''; ?>>ILS - Israeli</option>
                                            <option value="JPY" <?php echo $currency['currency_code'] == 'JPY' ? 'selected' : ''; ?>>JPY - Japanese yen</option>
                                            <option value="MYR" <?php echo $currency['currency_code'] == 'MYR' ? 'selected' : ''; ?>>MYR - Malaysian ringgit</option>
                                            <option value="MXN" <?php echo $currency['currency_code'] == 'MXN' ? 'selected' : ''; ?>>MXN - Mexican peso</option>
                                            <option value="TWD" <?php echo $currency['currency_code'] == 'TWD' ? 'selected' : ''; ?>>TWD - New Taiwan dollar</option>
                                            <option value="NZD" <?php echo $currency['currency_code'] == 'NZD' ? 'selected' : ''; ?>>NZD - New Zealand dollar</option>
                                            <option value="NOK" <?php echo $currency['currency_code'] == 'NOK' ? 'selected' : ''; ?>>NOK - Norwegian krone</option>
                                            <option value="PHP" <?php echo $currency['currency_code'] == 'PHP' ? 'selected' : ''; ?>>PHP - Philippine peso</option>
                                            <option value="PLN" <?php echo $currency['currency_code'] == 'PLN' ? 'selected' : ''; ?>>PLN - Polish złoty</option>
                                            <option value="GBP" <?php echo $currency['currency_code'] == 'GBP' ? 'selected' : ''; ?>>GBP - Pound sterling</option>
                                            <option value="RUB" <?php echo $currency['currency_code'] == 'RUB' ? 'selected' : ''; ?>>RUB - Russian ruble</option>
                                            <option value="SGD" <?php echo $currency['currency_code'] == 'SGD' ? 'selected' : ''; ?>>SGD - Singapore dollar</option>
                                            <option value="SEK" <?php echo $currency['currency_code'] == 'SEK' ? 'selected' : ''; ?>>SEK - Swedish krona</option>
                                            <option value="CHF" <?php echo $currency['currency_code'] == 'CHF' ? 'selected' : ''; ?>>CHF - Swiss franc</option>
                                            <option value="THB" <?php echo $currency['currency_code'] == 'THB' ? 'selected' : ''; ?>>THB - Thai baht</option>
                                            <option value="USD" <?php echo $currency['currency_code'] == 'USD' ? 'selected' : ''; ?>>USD - United States dollar</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="form-label" for="currency_symbol">Ký hiệu tiền tệ</label>
                                            <input class="form-control" name="currency_symbol" id="currency_symbol" value="<?php echo htmlspecialchars($currency['currency_symbol']); ?>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="form-label" for="currency_position">Vị trí của ký hiệu tiền tệ</label>
                                            <select name="currency_position" id="currency_position" class="form-control square" required>
                                                <option value="left" <?php echo $currency['currency_position'] == 'left' ? 'selected' : ''; ?>> Trái</option>
                                                <option value="right" <?php echo $currency['currency_position'] == 'right' ? 'selected' : ''; ?>> Phải</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="form-label" for="currency_thousand_separator">Tách đơn vị ngàn</label>
                                            <select id="currency_thousand_separator" name="currency_thousand_separator" class="form-control square" required>
                                                <option value="dot" <?php echo $currency['currency_thousand_separator'] == 'dot' ? 'selected' : ''; ?>> Dot</option>
                                                <option value="comma" <?php echo $currency['currency_thousand_separator'] == 'comma' ? 'selected' : ''; ?>> Comma</option>
                                                <option value="space" <?php echo $currency['currency_thousand_separator'] == 'space' ? 'selected' : ''; ?>> Space</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="currency_decimal_separator" class="form-label">Phân số thập phân</label>
                                            <select name="currency_decimal_separator" id="currency_decimal_separator" class="form-control square" required>
                                                <option value="dot" <?php echo $currency['currency_decimal_separator'] == 'dot' ? 'selected' : ''; ?>> Dot</option>
                                                <option value="comma" <?php echo $currency['currency_decimal_separator'] == 'comma' ? 'selected' : ''; ?>> Comma</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="form-label" for="currency_decimal">Số thập phân của tiền tệ</label>
                                            <select name="currency_decimal" id="currency_decimal" class="form-control square" required>
                                                <option value="0" <?php echo $currency['currency_decimal'] == '0' ? 'selected' : ''; ?>> 0</option>
                                                <option value="1" <?php echo $currency['currency_decimal'] == '1' ? 'selected' : ''; ?>> 0.0</option>
                                                <option value="2" <?php echo $currency['currency_decimal'] == '2' ? 'selected' : ''; ?>> 0.00</option>
                                                <option value="3" <?php echo $currency['currency_decimal'] == '3' ? 'selected' : ''; ?>> 0.000</option>
                                                <option value="4" <?php echo $currency['currency_decimal'] == '4' ? 'selected' : ''; ?>> 0.0000</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="new_currecry_rate">Tỷ giá tiền tệ</label>
                                    <input type="number" class="form-control" name="new_currecry_rate" id="new_currecry_rate" value="<?php echo $currency['new_currecry_rate']; ?>" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Trạng thái</label>
                                    <div class="form-check custom-checkbox mb-3">
                                        <input class="form-check-input" type="checkbox" name="status" id="checkboxDeactivation" value="1" <?= $currency['status'] == 1 ? 'checked' : '' ?>>
                                        <label class="form-check-label" for="checkboxDeactivation">Hiển thị</label>
                                    </div>
                                </div>
                                <button class="btn btn-primary" type="submit">Cập nhật</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php'); ?>