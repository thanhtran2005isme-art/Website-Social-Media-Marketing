<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
if (!@$user) {
    new Redirect('/login');
    exit;
}
$title = "Câu hỏi thường gặp - " . $general_data['title'];
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/header.php');

$content = 'faq';
$theme = getBasicControl()['theme'];
$defaultLanguage = array_filter($languages, fn($lang) => $lang['default_status'])[0] ?? ['id' => 1];

// Validate content
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

<div class="main-content app-content">
    <div class="container-fluid">
        <div class="d-flex align-items-center justify-content-between page-header-breadcrumb flex-wrap gap-2">
            <div>
                <nav>
                    <ol class="breadcrumb mb-1">
                        <li class="breadcrumb-item"><a href="javascript:void(0);">Trang chủ</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Câu hỏi thường gặp</li>
                    </ol>
                </nav>
                <h1 class="page-title fw-medium fs-18 mb-0">Câu hỏi thường gặp</h1>
            </div>
        </div>
        <div class="row gy-4 gy-md-5 gx-sm-5 align-items-center">
            <div class="col-md-6">
                <div class="left-side">
                    <h2 class="section-title"><?= $singleFormData['title']; ?></h2>
                    <p class="cmn-para-text mx-auto mt-20"><?= $singleFormData['description']; ?></p>
                    <div class="btn-area mt-30">
                        <a href="<?= $singleFormData['button_link']; ?>" class="btn btn-primary-gradient"><?= $singleFormData['button_name']; ?></a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="faq-content">
                    <div class="accordion accordion-customicon1 accordion-primary accordions-items-seperate" id="accordionFAQ1">
                        <?php foreach ($multipleContentData as $item): ?>
                            <?php $description = json_decode($item['description'], true); ?>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="heading<?= $item['id'] ?>"> <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<?= $item['id'] ?>" aria-expanded="false" aria-controls="collapse<?= $item['id'] ?>"><?= htmlspecialchars($description['question'] ?? ''); ?> </button> </h2>
                                <div id="collapse<?= $item['id'] ?>" class="accordion-collapse collapse" aria-labelledby="heading<?= $item['id'] ?>" data-bs-parent="#accordionFAQ1" style="">
                                    <div class="accordion-body">
                                    <?= htmlspecialchars($description['answer'] ?? ''); ?>
                                    </div>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/footer.php');
?>