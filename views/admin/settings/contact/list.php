<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php'); ?>
<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $data_user['role'] == 1) {
    if ($general_data['status_demo'] == 1) {
        alertBack("Đây là trang web demo bạn không thể thực hiện thao tác");
    }
    $result = store($_POST, $_FILES, $_POST['content'] ?? '', $_POST['language'] ?? 0);

    if ($result['status'] === 'success') {
        alertBack($result['message']);
    } else {

        if (isset($result['errors'])) {
            alertBack($result['error']);
        }
    }
}
$content = 'contact';
$theme = getBasicControl()['theme'];
$defaultLanguage = array_filter($languages, fn($lang) => $lang['default_status'])[0] ?? ['id' => 1];

if (!array_key_exists($content, config('' . $theme))) {
    header('HTTP/1.1 404 Not Found');
    exit('Content not found');
}

// Load configuration
$data = [
    'singleContent' => config('' . $theme . '.' . $content . '.single'),
    'multipleContents' => config('' . $theme . '.' . $content . '.multiple'),
    'languages' => $languages,
    'contentImage' => config('' . $theme . '.' . $content . '.image')
];

$singleContentData = [];
$singleResults = $db->get_list("
    SELECT cd.language_id, cd.description
    FROM content_details cd
    JOIN contents c ON c.id = cd.content_id
    WHERE c.name = '" . Anti_xss($content) . "'
    AND c.theme = '" . Anti_xss($theme) . "'
    AND c.type = 'single'
");
foreach ($singleResults as $row) {
    $singleContentData[$row['language_id']][] = [
        'description' => json_decode($row['description'], true)
    ];
}

// Fetch multipleContentData (default language only)
$multipleContentData = $db->get_list(
    "
    SELECT cd.id, cd.description, c.id as content_id
    FROM content_details cd
    JOIN contents c ON c.id = cd.content_id
    WHERE c.name = '" . Anti_xss($content) . "'
    AND c.theme = '" . Anti_xss($theme) . "'
    AND c.type = 'multiple'
    AND cd.language_id = " . (int)$defaultLanguage['id']
);

$singleFormData = $singleContentData[1][0]['description'] ?? [
    'heading' => '',
    'short_description' => '',
    'form_heading' => '',
    'form_short_description' => '',
    'phone' => '',
    'email' => '',
    'address' => '',
    'map_link' => ''
];
?>
<div class="content-body">
    <!-- row -->
    <div class="page-titles">
        <ol class="breadcrumb">
            <li>
                <h5 class="bc-title">Liên hệ</h5>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Home </a>
            </li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Liên hệ</a></li>
        </ol>

    </div>
    <div class="container-fluid">
        <div class="card card-collapse">
            <div class="card-body">
                <form method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="content" value="contact">
                    <input type="hidden" name="language" value="1">
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <label class="form-label" for="heading">Tiêu đề </label>
                            <input type="text" id="heading" name="heading[1]" class="form-control " value="<?= $singleFormData['heading']; ?>" autocomplete="off" placeholder="Heading">
                        </div>
                        <div class="col-md-12 mb-3">
                            <label class="form-label" for="short_description">Mô tả ngắn gọn </label>
                            <input type="text" id="short_description" name="short_description[1]" class="form-control " value="<?= $singleFormData['short_description']; ?>" autocomplete="off" placeholder="Short Description">
                        </div>
                        <div class="col-md-12 mb-3">
                            <label class="form-label" for="form_heading">Tiêu đề biểu mẫu </label>
                            <input type="text" id="form_heading" name="form_heading[1]" class="form-control " value="<?= $singleFormData['form_heading']; ?>" autocomplete="off" placeholder="Form Heading">
                        </div>
                        <div class="col-md-12 mb-3">
                            <label class="form-label" for="form_short_description">Biểu mẫu Mô tả ngắn </label>
                            <input type="text" id="form_short_description" name="form_short_description[1]" class="form-control " value="<?= $singleFormData['form_short_description']; ?>" autocomplete="off" placeholder="Form Short Description">
                        </div>
                        <div class="col-md-12 mb-3">
                            <label class="form-label" for="phone">Số điện thoại </label>
                            <input type="text" id="phone" name="phone[1]" class="form-control " value="<?= $singleFormData['phone']; ?>" autocomplete="off" placeholder="Phone">
                        </div>
                        <div class="col-md-12 mb-3">
                            <label class="form-label" for="email">Email </label>
                            <input type="text" id="email" name="email[1]" class="form-control " value="<?= $singleFormData['email']; ?>" autocomplete="off" placeholder="Email">
                        </div>
                        <div class="col-md-12 mb-3">
                            <label class="form-label" for="address">Địa chỉ </label>
                            <input type="text" id="address" name="address[1]" class="form-control " value="<?= $singleFormData['address']; ?>" autocomplete="off" placeholder="Address">
                        </div>

                        <div class="col-md-12 mb-3">
                            <label class="form-label" for="map_link">Liên kết bản đồ</label>
                            <input type="url" id="map_link" name="map_link[1]" value="<?= $singleFormData['map_link']; ?>" class="form-control " placeholder="Map Link">
                        </div>

                    </div>
                    <button type="submit" class="btn btn-primary">Lưu thông tin</button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header py-3 d-sm-flex d-block align-items-center">
                        <h4 class="card-title">Danh sách liên kết</h4>
                        <div class="clearfix">
                            <div class="d-inline-block m-1" id="employeesTableExcelBTN"></div>
                            <a href="/admin/contents/item/contact" class="btn btn-primary btn-sm m-1" role="button">+ Thêm liên kết</a>
                        </div>
                    </div>

                    <div class="card-body table-card-body px-0 pt-0 pb-2 p-3">
                        <div class="table-responsive">
                            <table id="employeesTable" class="table table-borderless table-nowrap table-align-middle card-table">
                                <thead class="table-light">
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($multipleContentData as $item): ?>
                                        <?php $description = json_decode($item['description'], true); ?>
                                        <tr data-id="<?= $item['id'] ?>">
                                            <td><?= htmlspecialchars($item['id']); ?></td>
                                            <td><?= htmlspecialchars($description['name'] ?? ''); ?></td>
                                            <td>
                                                <a href="/admin/contents/edit/contact/<?= $item['id']; ?>" class="btn btn-sm btn-primary"><i class="fas fa-pencil-alt"></i></a>
                                                <button type="button" class="btn btn-danger btn-square-2 btn-sm ms-1 delete-btn"><i class="fas fa-trash-alt"></i></button>
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
    </div>
</div>
<script>
    $(document).ready(function() {
        $('.delete-btn').on('click', function() {
            const row = $(this).closest('tr');
            const id = row.data('id');

            Notiflix.Confirm.show(
                'Xác nhận xóa',
                'Bạn có chắc chắn muốn xóa câu hỏi này?',
                'Có',
                'Không',
                function okCb() {
                    Notiflix.Loading.standard('Đang xử lý...');

                    $.ajax({
                        url: '/model/admin/delete',
                        type: 'POST',
                        data: {
                            id: id,
                            action: 'removeContact'
                        },
                        dataType: 'json',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status == "success") {
                                Notiflix.Notify.success('Xóa liên kết thành công');
                                row.fadeOut(300, function() {
                                    $(this).remove();
                                    if ($('#employeesTable tbody tr').length === 0) {
                                        $('#employeesTable tbody').html(`
                                        <tr>
                                            <td colspan="3" class="py-3 px-4 text-center text-dark">
                                                <img src="/assets/images/empty.png" width="100" />
                                                <p>Chưa có liên kết nào được tạo</p>
                                            </td>
                                        </tr>
                                    `);
                                    }
                                });
                            } else {
                                Notiflix.Notify.failure(response.msg || 'Có lỗi xảy ra khi xóa');
                            }
                        },
                        error: function() {
                            Notiflix.Loading.remove();
                            Notiflix.Notify.failure('Lỗi kết nối server');
                        }
                    });
                },
                function cancelCb() {
                    // Do nothing on cancel
                }
            );
        });
    });
</script>
<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php'); ?>