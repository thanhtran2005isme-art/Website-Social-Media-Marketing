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
$content = 'faq';
$theme = getBasicControl()['theme'];
$defaultLanguage = array_filter($languages, fn($lang) => $lang['default_status'])[0] ?? ['id' => 1];

// Validate content
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

// Database connection
$db = new DB();

// Fetch singleContentData
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
    'title' => '',
    'heading' => '',
    'button_name' => '',
    'button_link' => '',
    'description' => ''
];
?>
<div class="content-body">
    <!-- row -->
    <div class="page-titles">
        <ol class="breadcrumb">
            <li>
                <h5 class="bc-title">Nền tảng</h5>
            </li>
            <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Home </a>
            </li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">Nền tảng</a></li>
        </ol>

    </div>
    <div class="container-fluid">
        <div class="card card-collapse">
            <div class="card-body">
                <form method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="content" value="faq">
                    <input type="hidden" name="language" value="1">
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <label class="form-label" for="title">Title</label>
                            <input type="text" id="title" name="title[1]" class="form-control" autocomplete="off" placeholder="Title" value="<?php echo htmlspecialchars($_POST['title'][1] ?? $singleFormData['title']); ?>">
                        </div>
                        <div class="col-md-12 mb-3">
                            <label class="form-label" for="heading">Heading</label>
                            <input type="text" id="heading" name="heading[1]" class="form-control" autocomplete="off" placeholder="Heading" value="<?php echo htmlspecialchars($_POST['heading'][1] ?? $singleFormData['heading']); ?>">
                        </div>
                        <div class="col-md-12 mb-3">
                            <label class="form-label" for="button_name">Tên button</label>
                            <input type="text" id="button_name" name="button_name[1]" class="form-control" autocomplete="off" placeholder="Button Name" value="<?php echo htmlspecialchars($_POST['button_name'][1] ?? $singleFormData['button_name']); ?>">
                        </div>
                        <div class="col-md-12 mb-3">
                            <label class="form-label" for="button_link">Liên kết button</label>
                            <input type="url" id="button_link" name="button_link[1]" class="form-control" placeholder="Button Link" value="<?php echo htmlspecialchars($_POST['button_link'][1] ?? $singleFormData['button_link']); ?>">
                        </div>
                        <div class="col-md-12 mb-4">
                            <label class="form-label">Nội dung</label>
                            <textarea class="form-control" name="description[1]"><?php echo htmlspecialchars($_POST['description'][1] ?? $singleFormData['description']); ?></textarea>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Save Content</button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header py-3 d-sm-flex d-block align-items-center">
                        <h4 class="card-title">Danh sách</h4>
                        <div class="clearfix">
                            <div class="d-inline-block m-1" id="employeesTableExcelBTN"></div>
                            <a href="/admin/contents/item/faq" class="btn btn-primary btn-sm m-1" role="button">+ Thêm mới</a>
                        </div>
                    </div>

                    <div class="card-body table-card-body px-0 pt-0 pb-2 p-3">
                        <div class="table-responsive">
                            <table id="employeesTable" class="table table-borderless table-nowrap table-align-middle card-table">
                                <thead class="table-light">
                                    <tr>
                                        <th>ID</th>
                                        <th>Câu hỏi</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($multipleContentData as $item): ?>
                                        <?php $description = json_decode($item['description'], true); ?>
                                        <tr data-id="<?= $item['id'] ?>">
                                            <td><?= htmlspecialchars($item['id']); ?></td>
                                            <td><?= htmlspecialchars($description['question'] ?? ''); ?></td>
                                            <td>
                                                <a href="/admin/contents/edit/faq/<?= $item['id']; ?>" class="btn btn-sm btn-primary"><i class="fas fa-pencil-alt"></i></a>
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
                            action: 'removeFaq'
                        },
                        dataType: 'json',
                        success: function(response) {
                            Notiflix.Loading.remove();
                            if (response.status == "success") {
                                Notiflix.Notify.success('Xóa câu hỏi thành công');
                                row.fadeOut(300, function() {
                                    $(this).remove();
                                    if ($('#employeesTable tbody tr').length === 0) {
                                        $('#employeesTable tbody').html(`
                                        <tr>
                                            <td colspan="3" class="py-3 px-4 text-center text-dark">
                                                <img src="/assets/images/empty.png" width="100" />
                                                <p>Chưa có câu hỏi nào được tạo</p>
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