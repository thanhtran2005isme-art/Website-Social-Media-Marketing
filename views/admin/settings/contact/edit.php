<?php
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/header.php');
$theme = getBasicControl()['theme'];
$content = 'contact';
$contact_id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

if ($contact_id <= 0) {
    new Redirect('/admin/contents/contact');
}

$result = $db->get_list("
    SELECT cd.id, cd.content_id
    FROM content_details cd
    JOIN contents c ON c.id = cd.content_id
    WHERE cd.id = " . (int)$contact_id . "
    AND c.name = 'contact'
    AND c.type = 'multiple'
    LIMIT 1
");

if (empty($result)) {
    new Redirect('/admin/contents/contact');
}

$content_id = $result[0]['content_id'];

// Fetch data for editing
$languages_sql = "SELECT * FROM languages ORDER BY default_status DESC";
$languages = $db->get_list($languages_sql);

$multipleContent = config('' . $theme . '.' . $content . '.multiple');

$content_details_sql = "
    SELECT cd.*, c.name, c.theme, c.type, c.media
    FROM content_details cd
    INNER JOIN contents c ON cd.content_id = c.id
    WHERE cd.content_id = " . (int)$content_id . "
    AND c.name = '" . Anti_xss($content) . "'
    AND c.theme = '" . Anti_xss($theme) . "'
    AND c.type = 'multiple'
";
$content_details = $db->get_list($content_details_sql);

// Group content details by language_id
$multipleContentData = [];
foreach ($content_details as $detail) {
    $language_id = $detail['language_id'];
    if (!isset($multipleContentData[$language_id])) {
        $multipleContentData[$language_id] = [];
    }
    $detail['description'] = json_decode($detail['description'], true) ?? [];
    $detail['content'] = ['media' => json_decode($detail['media'], true) ?? []];
    $multipleContentData[$language_id][] = $detail;
}

// Handle POST request
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $data_user['role'] == 1) {
    if ($general_data['status_demo'] == 1) {
        alertBack("Đây là trang web demo bạn không thể thực hiện thao tác");
    }
    $content = isset($_GET['content']) ? $_GET['content'] : 'contact';
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    updateMultipleContent('contact', $id);
}
?>
<div class="content-body">
    <div class="page-titles">
        <ol class="breadcrumb">
            <li>
                <h5 class="bc-title">Chỉnh sửa liên hệ</h5>
            </li>
            <li class="breadcrumb-item"><a href="/admin">
                    <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                        <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Home </a>
            </li>
            <li class="breadcrumb-item active"><a href="/admin/contents/faq">Chỉnh sửa liên hệ</a></li>
        </ol>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-12">
                <div class="card card-collapse">
                    <div class="card-header">
                        <h3 class="card-title">Chỉnh sửa liên hệ</h3>
                        <a class="collapse-indicator" data-bs-toggle="collapse" href="#collapseFilter" role="button" aria-expanded="true" aria-controls="collapseFilter">
                            <i class="fa fa-angle-down"></i>
                        </a>
                    </div>
                    <div class="collapsed collapse show" id="collapseFilter">
                        <div class="card-body">
                            <form method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="_token" value="<?php echo htmlspecialchars(bin2hex(random_bytes(16))); ?>">
                                <input type="hidden" name="language_id" value="1">
                                <div class="row">
                                    <?php foreach ($multipleContent['field_name'] as $name => $type): ?>
                                        <?php
                                        $old_value = isset($old_input[$name][1]) ? $old_input[$name][1] : (isset($multipleContentData[1][0]['description'][$name]) ? $multipleContentData[1][0]['description'][$name] : (isset($multipleContentData[1][0]['content']['media'][$name]) ? $multipleContentData[1][0]['content']['media'][$name] : ''));
                                        ?>
                                        <?php if ($type == 'text'): ?>
                                            <div class="col-md-12 mb-3">
                                                <label class="form-label" for="<?php echo htmlspecialchars($name); ?>">
                                                    <?php echo (stringToTitle($name)); ?>
                                                </label>
                                                <input type="text"
                                                    id="<?php echo htmlspecialchars($name); ?>"
                                                    name="<?php echo htmlspecialchars($name); ?>[1]"
                                                    class="form-control "
                                                    value="<?php echo htmlspecialchars($old_value); ?>"
                                                    placeholder="<?php echo (stringToTitle($name)); ?>">
                                                
                                            </div>
                                        <?php endif; ?>
                                        <?php if ($type == 'textarea'): ?>
                                            <div class="col-md-12 mb-4">
                                                <label class="form-label">
                                                    <?php echo (stringToTitle($name)); ?>
                                                </label>
                                                <textarea class="form-control summernote "
                                                    name="<?php echo htmlspecialchars($name); ?>[<?php echo (int)1; ?>]"
                                                    rows="5"><?php echo htmlspecialchars($old_value); ?></textarea>
                                                
                                            </div>
                                        <?php endif; ?>
                                        <?php if ($type == 'icon'): ?>
                                            <div class="col-md-12 mb-3">
                                                <label class="form-label" for="<?php echo htmlspecialchars($name); ?>">
                                                    <?php echo (stringToTitle($name)); ?>
                                                </label>
                                                <div class="input-group">
                                                    <input type="text"
                                                        id="<?php echo htmlspecialchars($name); ?>"
                                                        name="<?php echo htmlspecialchars($name); ?>[<?php echo (int)1; ?>]"
                                                        class="form-control iconPicker icon "
                                                        value="<?php echo htmlspecialchars($old_value); ?>"
                                                        placeholder="<?php echo (stringToTitle($name)); ?>"
                                                        autocomplete="off">
                                                    <span class="input-group-text input-group-addon"
                                                        data-icon="las la-home"
                                                        role="iconpicker"></span>
                                                </div>
                                                
                                            </div>
                                        <?php endif; ?>
                                        <?php if ($type == 'url'): ?>
                                            <div class="col-md-12 mb-3">
                                                <label class="form-label" for="<?php echo htmlspecialchars($name); ?>">
                                                    <?php echo (stringToTitle($name)); ?>
                                                </label>
                                                <input type="url"
                                                    id="<?php echo htmlspecialchars($name); ?>"
                                                    name="<?php echo htmlspecialchars($name); ?>[<?php echo (int)1; ?>]"
                                                    class="form-control "
                                                    value="<?php echo htmlspecialchars($old_value); ?>"
                                                    placeholder="<?php echo (stringToTitle($name)); ?>">
                                                
                                            </div>
                                        <?php endif; ?>
                                        <?php if ($type == 'file'): ?>
                                            <div class="col-md-3 mb-2">
                                                <label class="form-label" for="<?php echo htmlspecialchars($name); ?>">
                                                    <?php echo (stringToTitle($name)); ?>
                                                </label>
                                                <label class="form-check form-check-dashed"
                                                    for="logoUploader<?php echo htmlspecialchars($name); ?>"
                                                    id="content_img">
                                                    <?php
                                                    $file_path = isset($multipleContentData[1][0]['content']['media'][$name]['path']) ?
                                                        '/uploads/contents/' . $multipleContentData[1][0]['content']['media'][$name]['path'] : '';
                                                    ?>
                                                    <img id="contentImg<?php echo htmlspecialchars($name); ?>"
                                                        class="avatar avatar-xl avatar-4x3 avatar-centered h-100 mb-2"
                                                        src="<?php echo htmlspecialchars($file_path); ?>"
                                                        alt="Image Description"
                                                        data-hs-theme-appearance="default">
                                                    <span class="d-block"><?php echo ('Browse your file here'); ?></span>
                                                    <input type="file"
                                                        name="<?php echo htmlspecialchars($name); ?>"
                                                        class="js-file-attach form-check-input"
                                                        id="logoUploader<?php echo htmlspecialchars($name); ?>"
                                                        data-hs-file-attach-options='{
                                                                               "textTarget": "#contentImg<?php echo htmlspecialchars($name); ?>",
                                                                               "mode": "image",
                                                                               "targetAttr": "src",
                                                                               "allowTypes": [".png", ".jpeg", ".jpg"]
                                                                           }'>
                                                </label>
                                                
                                            </div>
                                        <?php endif; ?>
                                        <?php if ($type == 'date'): ?>
                                            <div class="col-md-12 mb-3">
                                                <label class="form-label" for="<?php echo htmlspecialchars($name); ?>">
                                                    <?php echo (stringToTitle($name)); ?>
                                                </label>
                                                <input type="text"
                                                    class="js-flatpickr form-control flatpickr-custom "
                                                    name="<?php echo htmlspecialchars($name); ?>[<?php echo (int)1; ?>]"
                                                    value="<?php echo htmlspecialchars($old_value); ?>"
                                                    placeholder="Select dates"
                                                    data-hs-flatpickr-options='{
                                                                           "dateFormat": "d/m/Y",
                                                                           "enableTime": false
                                                                       }'>
                                                
                                            </div>
                                        <?php endif; ?>
                                        <?php if ($type == 'number'): ?>
                                            <div class="col-md-12 mb-3">
                                                <label class="form-label" for="<?php echo htmlspecialchars($name); ?>">
                                                    <?php echo (stringToTitle($name)); ?>
                                                </label>
                                                <input type="number"
                                                    id="<?php echo htmlspecialchars($name); ?>"
                                                    name="<?php echo htmlspecialchars($name); ?>[<?php echo (int)1; ?>]"
                                                    class="form-control "
                                                    value="<?php echo htmlspecialchars($old_value); ?>"
                                                    placeholder="<?php echo (stringToTitle($name)); ?>">
                                                
                                            </div>
                                        <?php endif; ?>
                                    <?php endforeach; ?>
                                </div>
                                <button type="submit" class="btn btn-primary">Cập nhật</button>
                                <a href="/admin/contents/contact" class="btn btn-secondary">Quay lại</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<?php
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/admin/footer.php');
$db->dis_connect();
?>