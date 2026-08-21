<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
if (!@$user) {
    new Redirect('/login');
    exit;
}
$title = "Thông tin liên hệ - " . $general_data['title'];
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/header.php');
$content = 'contact';
$theme = getBasicControl()['theme'];
$defaultLanguage = array_filter($languages, fn($lang) => $lang['default_status'])[0] ?? ['id' => 1];

if (!array_key_exists($content, config('' . $theme))) {
    header('HTTP/1.1 404 Not Found');
    exit('Content not found');
}

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

$multipleContentData = $db->get_list(
    "
    SELECT cd.id, c.media, c.id as content_id
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

<div class="main-content app-content">
    <div class="container-fluid">
        <div class="d-flex align-items-center justify-content-between page-header-breadcrumb flex-wrap gap-2">
            <div>
                <nav>
                    <ol class="breadcrumb mb-1">
                        <li class="breadcrumb-item"><a href="javascript:void(0);">Trang chủ</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Liên hệ</li>
                    </ol>
                </nav>
                <h1 class="page-title fw-medium fs-18 mb-0">Liên hệ</h1>
            </div>
        </div>
        <div class="row gy-4 gy-md-5 gx-sm-5 align-items-center contact-section">
            <div class="col-md-12">
                <div class="contact-area">
                    <div class="section-header mb-0">
                        <h3><?= $singleFormData['heading']; ?></h3>
                    </div>
                    <p class="para_text"><?= $singleFormData['short_description']; ?></p>
                    <div class="contact-item-list">
                        <div class="item">
                            <div class="icon-area">
                                <i class="bi bi-phone"></i>
                            </div>
                            <div class="content-area">
                                <h6 class="mb-0">Số điện thoại:</h6>
                                <p class="mb-0"><?= $singleFormData['phone']; ?></p>
                            </div>
                        </div>
                        <div class="item">
                            <div class="icon-area">
                                <i class="bi bi-envelope"></i>
                            </div>
                            <div class="content-area">
                                <h6 class="mb-0">Email:</h6>
                                <p class="mb-0"><?= $singleFormData['email']; ?></p>
                            </div>
                        </div>
                        <div class="item">
                            <div class="icon-area">
                                <i class="bi bi-geo-alt"></i>
                            </div>
                            <div class="content-area">
                                <h6 class="mb-0">Địa chỉ:</h6>
                                <p class="mb-0"><?= $singleFormData['address']; ?></p>
                            </div>
                        </div>
                    </div>
                    <div class="social-area">
                        <h5>Liên kết</h5>
                        <ul class="d-flex mt-20">
                            <?php foreach ($multipleContentData as $item): ?>
                                <?php $description = json_decode($item['media'], true); ?>
                                <li><a href=" <?= htmlspecialchars($description['link'] ?? ''); ?>"> <?= ($description['icon'] ?? ''); ?></a>
                                </li>
                            <?php endforeach; ?>

                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<?php
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/footer.php');
?>