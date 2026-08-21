<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php'); ?>
<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $data_user['role'] == 1) {
    if ($general_data['status_demo'] == 1) {
        alertBack("Đây là trang web demo bạn không thể thực hiện thao tác");
    }

    $bank_code = Anti_xss($_POST['bank_code']) ?? '';
    $account_holder = Anti_xss($_POST['account_holder']) ?? '';
    $account_number = Anti_xss($_POST['account_number']) ?? '';
    $prefix_autobank = Anti_xss($_POST['prefix_autobank']) ?? '';
    $token = Anti_xss($_POST['token']) ?? '';
    
    $banks = [
        ['name' => 'Ngân hàng TMCP Công thương Việt Nam', 'code' => 'ICB'],
        ['name' => 'Ngân hàng TMCP Ngoại Thương Việt Nam', 'code' => 'VCB'],
        ['name' => 'Ngân hàng TMCP Đầu tư và Phát triển Việt Nam', 'code' => 'BIDV'],
        ['name' => 'Ngân hàng Nông nghiệp và Phát triển Nông thôn Việt Nam', 'code' => 'VBA'],
        ['name' => 'Ngân hàng TMCP Phương Đông', 'code' => 'OCB'],
        ['name' => 'Ngân hàng TMCP Quân đội', 'code' => 'MB'],
        ['name' => 'Ngân hàng TMCP Kỹ thương Việt Nam', 'code' => 'TCB'],
        ['name' => 'Ngân hàng TMCP Á Châu', 'code' => 'ACB'],
        ['name' => 'Ngân hàng TMCP Việt Nam Thịnh Vượng', 'code' => 'VPB'],
        ['name' => 'Ngân hàng TMCP Tiên Phong', 'code' => 'TPB'],
        ['name' => 'Ngân hàng TMCP Sài Gòn Thương Tín', 'code' => 'STB'],
        ['name' => 'Ngân hàng TMCP Phát triển Thành phố Hồ Chí Minh', 'code' => 'HDB'],
        ['name' => 'Ngân hàng TMCP Bản Việt', 'code' => 'VCCB'],
        ['name' => 'Ngân hàng TMCP Sài Gòn', 'code' => 'SCB'],
        ['name' => 'Ngân hàng TMCP Quốc tế Việt Nam', 'code' => 'VIB'],
        ['name' => 'Ngân hàng TMCP Sài Gòn - Hà Nội', 'code' => 'SHB'],
        ['name' => 'Ngân hàng TMCP Xuất Nhập khẩu Việt Nam', 'code' => 'EIB'],
        ['name' => 'Ngân hàng TMCP Hàng Hải', 'code' => 'MSB'],
        ['name' => 'TMCP Việt Nam Thịnh Vượng - Ngân hàng số CAKE by VPBank', 'code' => 'CAKE'],
        ['name' => 'TMCP Việt Nam Thịnh Vượng - Ngân hàng số Ubank by VPBank', 'code' => 'Ubank'],
        ['name' => 'Ngân hàng số Timo by Ban Viet Bank (Timo by Ban Viet Bank)', 'code' => 'TIMO'],
        ['name' => 'Tổng Công ty Dịch vụ số Viettel - Chi nhánh tập đoàn công nghiệp viễn thông Quân Đội', 'code' => 'VTLMONEY'],
        ['name' => 'VNPT Money', 'code' => 'VNPTMONEY'],
        ['name' => 'Ngân hàng TMCP Sài Gòn Công Thương', 'code' => 'SGICB'],
        ['name' => 'Ngân hàng TMCP Bắc Á', 'code' => 'BAB'],
        ['name' => 'Ngân hàng TMCP Đại Chúng Việt Nam', 'code' => 'PVCB'],
        ['name' => 'Ngân hàng Thương mại TNHH MTV Đại Dương', 'code' => 'Oceanbank'],
        ['name' => 'Ngân hàng TMCP Quốc Dân', 'code' => 'NCB'],
        ['name' => 'Ngân hàng TNHH MTV Shinhan Việt Nam', 'code' => 'SHBVN'],
        ['name' => 'Ngân hàng TMCP An Bình', 'code' => 'ABB'],
        ['name' => 'Ngân hàng TMCP Việt Á', 'code' => 'VAB'],
        ['name' => 'Ngân hàng TMCP Nam Á', 'code' => 'NAB'],
        ['name' => 'Ngân hàng TMCP Xăng dầu Petrolimex', 'code' => 'PGB'],
        ['name' => 'Ngân hàng TMCP Việt Nam Thương Tín', 'code' => 'VIETBANK'],
        ['name' => 'Ngân hàng TMCP Bảo Việt', 'code' => 'BVB'],
        ['name' => 'Ngân hàng TMCP Đông Nam Á', 'code' => 'SEAB'],
        ['name' => 'Ngân hàng Hợp tác xã Việt Nam', 'code' => 'COOPBANK'],
        ['name' => 'Ngân hàng TMCP Lộc Phát Việt Nam', 'code' => 'LPB'],
        ['name' => 'Ngân hàng TMCP Kiên Long', 'code' => 'KLB'],
        ['name' => 'Ngân hàng Đại chúng TNHH Kasikornbank', 'code' => 'KBank'],
        ['name' => 'Ngân hàng Kookmin - Chi nhánh Hà Nội', 'code' => 'KBHN'],
        ['name' => 'Ngân hàng KEB Hana – Chi nhánh Thành phố Hồ Chí Minh', 'code' => 'KEBHANAHCM'],
        ['name' => 'Ngân hàng KEB Hana – Chi nhánh Hà Nội', 'code' => 'KEBHANAHN'],
        ['name' => 'Công ty Tài chính TNHH MTV Mirae Asset (Việt Nam)', 'code' => 'MAFC'],
        ['name' => 'Ngân hàng Citibank, N.A. - Chi nhánh Hà Nội', 'code' => 'CITIBANK'],
        ['name' => 'Ngân hàng Kookmin - Chi nhánh Thành phố Hồ Chí Minh', 'code' => 'KBHCM'],
        ['name' => 'Ngân hàng Chính sách Xã hội', 'code' => 'VBSP'],
        ['name' => 'Ngân hàng TNHH MTV Woori Việt Nam', 'code' => 'WVN'],
        ['name' => 'Ngân hàng Liên doanh Việt - Nga', 'code' => 'VRB'],
        ['name' => 'Ngân hàng United Overseas - Chi nhánh TP. Hồ Chí Minh', 'code' => 'UOB'],
        ['name' => 'Ngân hàng TNHH MTV Standard Chartered Bank Việt Nam', 'code' => 'SCVN'],
        ['name' => 'Ngân hàng TNHH MTV Public Việt Nam', 'code' => 'PBVN'],
        ['name' => 'Ngân hàng Nonghyup - Chi nhánh Hà Nội', 'code' => 'NHB HN'],
        ['name' => 'Ngân hàng TNHH Indovina', 'code' => 'IVB'],
        ['name' => 'Ngân hàng Công nghiệp Hàn Quốc - Chi nhánh TP. Hồ Chí Minh', 'code' => 'IBK - HCM'],
        ['name' => 'Ngân hàng Công nghiệp Hàn Quốc - Chi nhánh Hà Nội', 'code' => 'IBK - HN'],
        ['name' => 'Ngân hàng TNHH MTV HSBC (Việt Nam)', 'code' => 'HSBC'],
        ['name' => 'Ngân hàng TNHH MTV Hong Leong Việt Nam', 'code' => 'HLBVN'],
        ['name' => 'Ngân hàng Thương mại TNHH MTV Dầu Khí Toàn Cầu', 'code' => 'GPB'],
        ['name' => 'Ngân hàng TMCP Đông Á', 'code' => 'DOB'],
        ['name' => 'DBS Bank Ltd - Chi nhánh Thành phố Hồ Chí Minh', 'code' => 'DBS'],
        ['name' => 'Ngân hàng TNHH MTV CIMB Việt Nam', 'code' => 'CIMB'],
        ['name' => 'Ngân hàng Thương mại TNHH MTV Xây dựng Việt Nam', 'code' => 'CBB'],
    ];
    $bank_name = '';
    foreach ($banks as $bank) {
        if ($bank['code'] === $bank_code) {
            $bank_name = $bank['name'];
            break;
        }
    }
    $data = [
        'name' => $bank_name,
        'code' => $bank_code,
        'account_holder' => $account_holder,
        'account_number' => $account_number,
        'prefix_autobank' => $prefix_autobank,
        'token' => $token,
        'created_at' => gettime()
    ];

    // Thêm vào database
    if ($db->insert('banks', $data)) {
        alertBack("Thêm ngân hàng thành công");
    } else {
        alertBack("Lỗi khi thêm ngân hàng");
    }
    $db->dis_connect();
}

$banks = [
    ['name' => 'Ngân hàng TMCP Công thương Việt Nam', 'code' => 'ICB'],
    ['name' => 'Ngân hàng TMCP Ngoại Thương Việt Nam', 'code' => 'VCB'],
    ['name' => 'Ngân hàng TMCP Đầu tư và Phát triển Việt Nam', 'code' => 'BIDV'],
    ['name' => 'Ngân hàng Nông nghiệp và Phát triển Nông thôn Việt Nam', 'code' => 'VBA'],
    ['name' => 'Ngân hàng TMCP Phương Đông', 'code' => 'OCB'],
    ['name' => 'Ngân hàng TMCP Quân đội', 'code' => 'MB'],
    ['name' => 'Ngân hàng TMCP Kỹ thương Việt Nam', 'code' => 'TCB'],
    ['name' => 'Ngân hàng TMCP Á Châu', 'code' => 'ACB'],
    ['name' => 'Ngân hàng TMCP Việt Nam Thịnh Vượng', 'code' => 'VPB'],
    ['name' => 'Ngân hàng TMCP Tiên Phong', 'code' => 'TPB'],
    ['name' => 'Ngân hàng TMCP Sài Gòn Thương Tín', 'code' => 'STB'],
    ['name' => 'Ngân hàng TMCP Phát triển Thành phố Hồ Chí Minh', 'code' => 'HDB'],
    ['name' => 'Ngân hàng TMCP Bản Việt', 'code' => 'VCCB'],
    ['name' => 'Ngân hàng TMCP Sài Gòn', 'code' => 'SCB'],
    ['name' => 'Ngân hàng TMCP Quốc tế Việt Nam', 'code' => 'VIB'],
    ['name' => 'Ngân hàng TMCP Sài Gòn - Hà Nội', 'code' => 'SHB'],
    ['name' => 'Ngân hàng TMCP Xuất Nhập khẩu Việt Nam', 'code' => 'EIB'],
    ['name' => 'Ngân hàng TMCP Hàng Hải', 'code' => 'MSB'],
    ['name' => 'TMCP Việt Nam Thịnh Vượng - Ngân hàng số CAKE by VPBank', 'code' => 'CAKE'],
    ['name' => 'TMCP Việt Nam Thịnh Vượng - Ngân hàng số Ubank by VPBank', 'code' => 'Ubank'],
    ['name' => 'Ngân hàng số Timo by Ban Viet Bank (Timo by Ban Viet Bank)', 'code' => 'TIMO'],
    ['name' => 'Tổng Công ty Dịch vụ số Viettel - Chi nhánh tập đoàn công nghiệp viễn thông Quân Đội', 'code' => 'VTLMONEY'],
    ['name' => 'VNPT Money', 'code' => 'VNPTMONEY'],
    ['name' => 'Ngân hàng TMCP Sài Gòn Công Thương', 'code' => 'SGICB'],
    ['name' => 'Ngân hàng TMCP Bắc Á', 'code' => 'BAB'],
    ['name' => 'Ngân hàng TMCP Đại Chúng Việt Nam', 'code' => 'PVCB'],
    ['name' => 'Ngân hàng Thương mại TNHH MTV Đại Dương', 'code' => 'Oceanbank'],
    ['name' => 'Ngân hàng TMCP Quốc Dân', 'code' => 'NCB'],
    ['name' => 'Ngân hàng TNHH MTV Shinhan Việt Nam', 'code' => 'SHBVN'],
    ['name' => 'Ngân hàng TMCP An Bình', 'code' => 'ABB'],
    ['name' => 'Ngân hàng TMCP Việt Á', 'code' => 'VAB'],
    ['name' => 'Ngân hàng TMCP Nam Á', 'code' => 'NAB'],
    ['name' => 'Ngân hàng TMCP Xăng dầu Petrolimex', 'code' => 'PGB'],
    ['name' => 'Ngân hàng TMCP Việt Nam Thương Tín', 'code' => 'VIETBANK'],
    ['name' => 'Ngân hàng TMCP Bảo Việt', 'code' => 'BVB'],
    ['name' => 'Ngân hàng TMCP Đông Nam Á', 'code' => 'SEAB'],
    ['name' => 'Ngân hàng Hợp tác xã Việt Nam', 'code' => 'COOPBANK'],
    ['name' => 'Ngân hàng TMCP Lộc Phát Việt Nam', 'code' => 'LPB'],
    ['name' => 'Ngân hàng TMCP Kiên Long', 'code' => 'KLB'],
    ['name' => 'Ngân hàng Đại chúng TNHH Kasikornbank', 'code' => 'KBank'],
    ['name' => 'Ngân hàng Kookmin - Chi nhánh Hà Nội', 'code' => 'KBHN'],
    ['name' => 'Ngân hàng KEB Hana – Chi nhánh Thành phố Hồ Chí Minh', 'code' => 'KEBHANAHCM'],
    ['name' => 'Ngân hàng KEB Hana – Chi nhánh Hà Nội', 'code' => 'KEBHANAHN'],
    ['name' => 'Công ty Tài chính TNHH MTV Mirae Asset (Việt Nam)', 'code' => 'MAFC'],
    ['name' => 'Ngân hàng Citibank, N.A. - Chi nhánh Hà Nội', 'code' => 'CITIBANK'],
    ['name' => 'Ngân hàng Kookmin - Chi nhánh Thành phố Hồ Chí Minh', 'code' => 'KBHCM'],
    ['name' => 'Ngân hàng Chính sách Xã hội', 'code' => 'VBSP'],
    ['name' => 'Ngân hàng TNHH MTV Woori Việt Nam', 'code' => 'WVN'],
    ['name' => 'Ngân hàng Liên doanh Việt - Nga', 'code' => 'VRB'],
    ['name' => 'Ngân hàng United Overseas - Chi nhánh TP. Hồ Chí Minh', 'code' => 'UOB'],
    ['name' => 'Ngân hàng TNHH MTV Standard Chartered Bank Việt Nam', 'code' => 'SCVN'],
    ['name' => 'Ngân hàng TNHH MTV Public Việt Nam', 'code' => 'PBVN'],
    ['name' => 'Ngân hàng Nonghyup - Chi nhánh Hà Nội', 'code' => 'NHB HN'],
    ['name' => 'Ngân hàng TNHH Indovina', 'code' => 'IVB'],
    ['name' => 'Ngân hàng Công nghiệp Hàn Quốc - Chi nhánh TP. Hồ Chí Minh', 'code' => 'IBK - HCM'],
    ['name' => 'Ngân hàng Công nghiệp Hàn Quốc - Chi nhánh Hà Nội', 'code' => 'IBK - HN'],
    ['name' => 'Ngân hàng TNHH MTV HSBC (Việt Nam)', 'code' => 'HSBC'],
    ['name' => 'Ngân hàng TNHH MTV Hong Leong Việt Nam', 'code' => 'HLBVN'],
    ['name' => 'Ngân hàng Thương mại TNHH MTV Dầu Khí Toàn Cầu', 'code' => 'GPB'],
    ['name' => 'Ngân hàng TMCP Đông Á', 'code' => 'DOB'],
    ['name' => 'DBS Bank Ltd - Chi nhánh Thành phố Hồ Chí Minh', 'code' => 'DBS'],
    ['name' => 'Ngân hàng TNHH MTV CIMB Việt Nam', 'code' => 'CIMB'],
    ['name' => 'Ngân hàng Thương mại TNHH MTV Xây dựng Việt Nam', 'code' => 'CBB'],
];
?>
<div class="content-body">
    <div class="page-titles">
        <ol class="breadcrumb">
            <li>
                <h5 class="bc-title">Thêm ngân hàng</h5>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Home </a>
            </li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Thêm ngân hàng</a></li>
        </ol>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-12">
                <div class="card card-collapse">
                    <div class="card-header">
                        <h3 class="card-title">Thêm ngân hàng</h3>
                        <a class="collapse-indicator" data-bs-toggle="collapse" href="#collapseFilter" role="button" aria-expanded="true" aria-controls="collapseFilter">
                            <i class="fa fa-angle-down"></i>
                        </a>
                    </div>
                    <div class="collapsed collapse show" id="collapseFilter">
                        <div class="card-body">
                            <form action="" method="POST" enctype="multipart/form-data">
                                <div class="row">

                                    <div class="col-xl-6">
                                        <div class="mb-3">
                                            <label class="form-label">Ngân hàng</label>
                                            <select name="bank_code" class="form-control select2" required>
                                                <option value="">Chọn ngân hàng</option>
                                                <?php foreach ($banks as $bank): ?>
                                                    <option value="<?= htmlspecialchars($bank['code']) ?>"><?= htmlspecialchars($bank['name']) ?> - <?= htmlspecialchars($bank['code']) ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="mb-3">
                                            <label class="form-label">Chủ tài khoản</label>
                                            <input type="text" name="account_holder" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="mb-3">
                                            <label class="form-label">Số tài khoản</label>
                                            <input type="text" name="account_number" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="mb-3">
                                            <label class="form-label">Nội dung nạp</label>
                                            <input type="text" name="prefix_autobank" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="mb-3">
                                            <label class="form-label">Token API (API.VPNFAST.VN)</label>
                                            <input type="text" name="token" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-xl-12">

                                        <div class="text-start">
                                            <button type="submit" class="btn btn-primary">Thêm Ngay</button>
                                        </div>
                                    </div>
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
    $(document).ready(function() {
        // Initialize Select2 with Bootstrap 5 theme
        $('.select2').select2({
            placeholder: "Chọn một tùy chọn",
            allowClear: true,
            width: '100%'
        });
    })
</script>
<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php'); ?>