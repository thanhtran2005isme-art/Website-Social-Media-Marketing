<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/libs/init.php');
if (!@$user) {
    new Redirect('/login');
    exit;
}
$title = "Tài liệu API - " . $general_data['title'];
require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/header.php'); ?>
<div class="main-content app-content new_order">
    <div class="container-fluid">
        <div class="d-flex align-items-center justify-content-between page-header-breadcrumb flex-wrap gap-2">
            <div>
                <nav>
                    <ol class="breadcrumb mb-1">
                        <li class="breadcrumb-item"><a href="javascript:void(0);">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">API</li>
                    </ol>
                </nav>
                <h1 class="page-title fw-medium fs-18 mb-0">Tài liệu API v2</h1>
            </div>
        </div>

        <div class="row g-4">
            <div class="col-12">
                <div class="card custom-card">
                    <div class="card-body">
                        <!-- Tab Navigation -->
                        <ul class="nav nav-tabs tab-style-8 scaleX rounded profile-settings-tab nav-full" id="apiTabs" role="tablist">
                            <li class="nav-item mb-2" style="flex: 1 1 auto;">
                                <a class="nav-link px-4 bg-primary-transparent active" id="general-tab" data-bs-toggle="tab" href="#general" role="tab" aria-controls="general" aria-selected="true">Thông tin chung</a>
                            </li>
                            <li class="nav-item mb-2 nav-item-custom">
                                <a class="nav-link px-4 bg-primary-transparent" id="api-key-tab" data-bs-toggle="tab" href="#api-key" role="tab" aria-controls="api-key" aria-selected="false">Quản lý API Key</a>
                            </li>
                            <li class="nav-item mb-2 nav-item-custom">
                                <a class="nav-link px-4 bg-primary-transparent" id="services-tab" data-bs-toggle="tab" href="#services" role="tab" aria-controls="services" aria-selected="false">Services</a>
                            </li>
                            <li class="nav-item mb-2 nav-item-custom">
                                <a class="nav-link px-4 bg-primary-transparent" id="add-tab" data-bs-toggle="tab" href="#add" role="tab" aria-controls="add" aria-selected="false">Add Order</a>
                            </li>
                            <li class="nav-item mb-2 nav-item-custom">
                                <a class="nav-link px-4 bg-primary-transparent" id="status-tab" data-bs-toggle="tab" href="#status" role="tab" aria-controls="status" aria-selected="false">Status</a>
                            </li>
                            <li class="nav-item mb-2 nav-item-custom">
                                <a class="nav-link px-4 bg-primary-transparent" id="balance-tab" data-bs-toggle="tab" href="#balance" role="tab" aria-controls="balance" aria-selected="false">Balance</a>
                            </li>
                            <li class="nav-item mb-2 nav-item-custom">
                                <a class="nav-link px-4 bg-primary-transparent" id="refill-tab" data-bs-toggle="tab" href="#refill" role="tab" aria-controls="refill" aria-selected="false">Refill</a>
                            </li>
                            <li class="nav-item mb-2 nav-item-custom">
                                <a class="nav-link px-4 bg-primary-transparent" id="multiple-refill-tab" data-bs-toggle="tab" href="#multiple-refill" role="tab" aria-controls="multiple-refill" aria-selected="false">Multiple Refill</a>
                            </li>
                            <li class="nav-item mb-2 nav-item-custom">
                                <a class="nav-link px-4 bg-primary-transparent" id="refill-status-tab" data-bs-toggle="tab" href="#refill-status" role="tab" aria-controls="refill-status" aria-selected="false">Refill Status</a>
                            </li>
                            <li class="nav-item mb-2 nav-item-custom">
                                <a class="nav-link px-4 bg-primary-transparent" id="multiple-refill-status-tab" data-bs-toggle="tab" href="#multiple-refill-status" role="tab" aria-controls="multiple-refill-status" aria-selected="false">Multiple Refill Status</a>
                            </li>
                            <li class="nav-item mb-2 nav-item-custom">
                                <a class="nav-link px-4 bg-primary-transparent" id="cancel-tab" data-bs-toggle="tab" href="#cancel" role="tab" aria-controls="cancel" aria-selected="false">Cancel</a>
                            </li>
                            <li class="nav-item mb-2 nav-item-custom">
                                <a class="nav-link px-4 bg-primary-transparent" id="errors-tab" data-bs-toggle="tab" href="#errors" role="tab" aria-controls="errors" aria-selected="false">Xử lý lỗi</a>
                            </li>
                            <li class="nav-item mb-2 nav-item-custom">
                                <a class="nav-link px-4 bg-primary-transparent" id="notes-tab" data-bs-toggle="tab" href="#notes" role="tab" aria-controls="notes" aria-selected="false">Ghi chú</a>
                            </li>
                        </ul>

                        <!-- Tab Content -->
                        <div class="tab-content" id="apiTabsContent">
                            <!-- Tab 1: General Information -->
                            <div class="tab-pane fade show active" id="general" role="tabpanel" aria-labelledby="general-tab">
                                <h3 class="mt-4">Thông tin chung</h3>
                                <ul>
                                    <li><strong>Base URL</strong>: <code>https://<?=$_SERVER['SERVER_NAME']?>/api/v2</code></li>
                                    <li><strong>Định dạng</strong>: x-www-form-urlencoded</li>
                                    <li><strong>Xác thực</strong>: Sử dụng <code>key</code> (API key) trong mỗi request.</li>
                                    <li><strong>Phương thức</strong>: POST (tất cả các hành động đều sử dụng POST).</li>
                                </ul>
                                <p>API v2 cung cấp một endpoint chính để thực hiện các hành động như đặt đơn hàng, kiểm tra trạng thái, lấy danh sách dịch vụ, quản lý số dư, yêu cầu refill và hủy đơn hàng. Các hành động được phân loại bởi tham số <code>action</code>.</p>
                            </div>

                            <!-- Tab 2: API Key Management -->
                            <div class="tab-pane fade" id="api-key" role="tabpanel" aria-labelledby="api-key-tab">
                                <h3 class="mt-4">Quản lý API Key</h3>
                                <div class="mb-4">
                                    <label for="apiKey" class="form-label">API Key của bạn</label>
                                    <div class="input-group">
                                        <input type="password" class="form-control" id="apiKey" value="<?php echo htmlspecialchars($data_user['api_token'] ?? 'Chưa có API Key'); ?>" readonly>
                                        <button class="btn btn-outline-secondary" type="button" id="toggleApiKey">Hiện</button>
                                    </div>
                                    <button class="btn btn-primary mt-2" id="generateApiKey">Tạo API Key mới</button>
                                    <div id="apiKeyMessage" class="mt-2"></div>
                                </div>
                            </div>

                            <!-- Tab 3: Action Services -->
                            <div class="tab-pane fade" id="services" role="tabpanel" aria-labelledby="services-tab">
                                <h3 class="mt-4">Lấy danh sách dịch vụ (<code>action=services</code>)</h3>
                                <p>Trả về danh sách tất cả các dịch vụ SMM có sẵn, bao gồm thông tin về type dịch vụ.</p>
                                <h5>Tham số</h5>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Tham số</th>
                                            <th>Kiểu</th>
                                            <th>Bắt buộc</th>
                                            <th>Mô tả</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>key</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Khóa API của bạn</td>
                                        </tr>
                                        <tr>
                                            <td>action</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Giá trị: <code>services</code></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <h5>Ví dụ Request</h5>
                                <pre><code class="language-text">
POST https://<?=$_SERVER['SERVER_NAME']?>/api/v2
Content-Type: application/x-www-form-urlencoded

key=your_api_key&action=services
                                </code></pre>
                                <h5>Ví dụ Response</h5>
                                <pre><code class="language-json">
[
    {
        "service": 1475,
        "name": "Live Stream Viewers | 15 Minutes",
        "category": "Bigo | Live Stream",
        "platform": "Bigo",
        "rate": 0.376035,
        "min": 10,
        "max": 20000,
        "type": "default",
        "refill": false,
        "cancel": false
    },
    {
        "service": 1477,
        "name": "Instagram Likes",
        "category": "Instagram | Likes",
        "platform": "Instagram",
        "rate": 2.500000,
        "min": 100,
        "max": 5000,
        "type": "default",
        "refill": true,
        "cancel": true
    }
]
                                </code></pre>
                            </div>

                            <!-- Tab 4: Action Add Order -->
                            <div class="tab-pane fade" id="add" role="tabpanel" aria-labelledby="add-tab">
                                <h3 class="mt-4">Đặt đơn hàng (<code>action=add</code>)</h3>
                                <p>Đặt một đơn hàng mới cho dịch vụ SMM. Hỗ trợ nhiều type dịch vụ với các tham số tùy thuộc vào type.</p>
                                <h5>Tham số chung</h5>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Tham số</th>
                                            <th>Kiểu</th>
                                            <th>Bắt buộc</th>
                                            <th>Mô tả</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>key</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Khóa API của bạn</td>
                                        </tr>
                                        <tr>
                                            <td>action</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Giá trị: <code>add</code></td>
                                        </tr>
                                        <tr>
                                            <td>service</td>
                                            <td>Integer</td>
                                            <td>Có</td>
                                            <td>ID của dịch vụ (lấy từ action services)</td>
                                        </tr>
                                        <tr>
                                            <td>link</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Link bài viết hoặc trang cần tăng</td>
                                        </tr>
                                        <tr>
                                            <td>quantity</td>
                                            <td>Integer</td>
                                            <td>Tùy type</td>
                                            <td>Số lượng (bắt buộc cho các type như default, mentions, không cần cho package)</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <h5>Tham số theo Type</h5>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Type</th>
                                            <th>Tham số bổ sung</th>
                                            <th>Kiểu</th>
                                            <th>Bắt buộc</th>
                                            <th>Mô tả</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>default</td>
                                            <td>quantity</td>
                                            <td>Integer</td>
                                            <td>Có</td>
                                            <td>Số lượng (ví dụ: 1000 likes)</td>
                                        </tr>
                                        <tr>
                                            <td>custom_comments</td>
                                            <td>comments</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Danh sách bình luận tùy chỉnh, phân tách bởi ký tự xuống dòng (\n)</td>
                                        </tr>
                                        <tr>
                                            <td>mentions</td>
                                            <td>usernames</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Danh sách tên người dùng, phân tách bởi dấu phẩy</td>
                                        </tr>
                                        <tr>
                                            <td>mentions_hashtag</td>
                                            <td>hashtags</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Danh sách hashtag, phân tách bởi dấu phẩy</td>
                                        </tr>
                                        <tr>
                                            <td>comment_likes</td>
                                            <td>comment_id</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>ID của bình luận cần tăng like</td>
                                        </tr>
                                        <tr>
                                            <td>package</td>
                                            <td>-</td>
                                            <td>-</td>
                                            <td>-</td>
                                            <td>Không yêu cầu quantity hoặc tham số bổ sung</td>
                                        </tr>
                                        <tr>
                                            <td>special</td>
                                            <td>keywords</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Danh sách từ khóa, phân tách bởi dấu phẩy</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <h5>Ví dụ Request theo Type</h5>
                                <h6>default (Likes)</h6>
                                <pre><code class="language-text">
POST https://<?=$_SERVER['SERVER_NAME']?>/api/v2
Content-Type: application/x-www-form-urlencoded

key=your_api_key&action=add&service=1477&link=https://instagram.com/p/abc123&quantity=1000
                                </code></pre>
                                <h6>custom_comments</h6>
                                <pre><code class="language-text">
POST https://<?=$_SERVER['SERVER_NAME']?>/api/v2
Content-Type: application/x-www-form-urlencoded

key=your_api_key&action=add&service=1478&link=https://instagram.com/p/abc123&quantity=3&comments=Great post!\nLove this content!\nKeep it up!
                                </code></pre>
                                <h5>Ví dụ Response</h5>
                                <pre><code class="language-json">
{
    "status": "success",
    "order": 12345
}
                                </code></pre>
                            </div>

                            <!-- Tab 5: Action Status -->
                            <div class="tab-pane fade" id="status" role="tabpanel" aria-labelledby="status-tab">
                                <h3 class="mt-4">Kiểm tra trạng thái đơn hàng (<code>action=status</code>)</h3>
                                <p>Trả về thông tin trạng thái của một hoặc nhiều đơn hàng.</p>
                                <h5>Tham số</h5>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Tham số</th>
                                            <th>Kiểu</th>
                                            <th>Bắt buộc</th>
                                            <th>Mô tả</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>key</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Khóa API của bạn</td>
                                        </tr>
                                        <tr>
                                            <td>action</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Giá trị: <code>status</code></td>
                                        </tr>
                                        <tr>
                                            <td>order</td>
                                            <td>Integer</td>
                                            <td>Có (hoặc orders)</td>
                                            <td>ID của đơn hàng cần kiểm tra</td>
                                        </tr>
                                        <tr>
                                            <td>orders</td>
                                            <td>String</td>
                                            <td>Có (hoặc order)</td>
                                            <td>Danh sách ID đơn hàng, phân tách bởi dấu phẩy</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <h5>Ví dụ Request (Kiểm tra một đơn hàng)</h5>
                                <pre><code class="language-text">
POST https://<?=$_SERVER['SERVER_NAME']?>/api/v2
Content-Type: application/x-www-form-urlencoded

key=your_api_key&action=status&order=12345
                                </code></pre>
                                <h5>Ví dụ Response (Một đơn hàng)</h5>
                                <pre><code class="language-json">
{
    "status": "Completed",
    "charge": 2.50,
    "start_count": 0,
    "remains": 0
}
                                </code></pre>
                                <h5>Ví dụ Request (Kiểm tra nhiều đơn hàng)</h5>
                                <pre><code class="language-text">
POST https://<?=$_SERVER['SERVER_NAME']?>/api/v2
Content-Type: application/x-www-form-urlencoded

key=your_api_key&action=status&orders=12345,12346
                                </code></pre>
                                <h5>Ví dụ Response (Nhiều đơn hàng)</h5>
                                <pre><code class="language-json">
{
    "12345": {
        "status": "Completed",
        "charge": 2.50,
        "start_count": 0,
        "remains": 0
    },
    "12346": {
        "status": "In progress",
        "charge": 5.00,
        "start_count": 100,
        "remains": 900
    }
}
                                </code></pre>
                            </div>

                            <!-- Tab 6: Action Balance -->
                            <div class="tab-pane fade" id="balance" role="tabpanel" aria-labelledby="balance-tab">
                                <h3 class="mt-4">Kiểm tra số dư tài khoản (<code>action=balance</code>)</h3>
                                <p>Trả về số dư hiện tại của tài khoản.</p>
                                <h5>Tham số</h5>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Tham số</th>
                                            <th>Kiểu</th>
                                            <th>Bắt buộc</th>
                                            <th>Mô tả</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>key</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Khóa API của bạn</td>
                                        </tr>
                                        <tr>
                                            <td>action</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Giá trị: <code>balance</code></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <h5>Ví dụ Request</h5>
                                <pre><code class="language-text">
POST https://<?=$_SERVER['SERVER_NAME']?>/api/v2
Content-Type: application/x-www-form-urlencoded

key=your_api_key&action=balance
                                </code></pre>
                                <h5>Ví dụ Response</h5>
                                <pre><code class="language-json">
{
    "status": "success",
    "balance": 150.75,
    "currency": "USD"
}
                                </code></pre>
                            </div>

                            <!-- Tab 7: Action Refill -->
                            <div class="tab-pane fade" id="refill" role="tabpanel" aria-labelledby="refill-tab">
                                <h3 class="mt-4">Tạo yêu cầu refill (<code>action=refill</code>)</h3>
                                <p>Tạo yêu cầu refill cho một đơn hàng đã hoàn thành hoặc đang tiến hành.</p>
                                <h5>Tham số</h5>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Tham số</th>
                                            <th>Kiểu</th>
                                            <th>Bắt buộc</th>
                                            <th>Mô tả</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>key</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Khóa API của bạn</td>
                                        </tr>
                                        <tr>
                                            <td>action</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Giá trị: <code>refill</code></td>
                                        </tr>
                                        <tr>
                                            <td>order</td>
                                            <td>Integer</td>
                                            <td>Có</td>
                                            <td>ID của đơn hàng cần refill</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <h5>Ví dụ Request</h5>
                                <pre><code class="language-text">
POST https://<?=$_SERVER['SERVER_NAME']?>/api/v2
Content-Type: application/x-www-form-urlencoded

key=your_api_key&action=refill&order=12345
                                </code></pre>
                                <h5>Ví dụ Response</h5>
                                <pre><code class="language-json">
{
    "status": "success",
    "refill": 1
}
                                </code></pre>
                            </div>

                            <!-- Tab 8: Action Multiple Refill -->
                            <div class="tab-pane fade" id="multiple-refill" role="tabpanel" aria-labelledby="multiple-refill-tab">
                                <h3 class="mt-4">Tạo nhiều yêu cầu refill (<code>action=multiple_refill</code>)</h3>
                                <p>Tạo yêu cầu refill cho nhiều đơn hàng.</p>
                                <h5>Tham số</h5>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Tham số</th>
                                            <th>Kiểu</th>
                                            <th>Bắt buộc</th>
                                            <th>Mô tả</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>key</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Khóa API của bạn</td>
                                        </tr>
                                        <tr>
                                            <td>action</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Giá trị: <code>multiple_refill</code></td>
                                        </tr>
                                        <tr>
                                            <td>orders</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Danh sách ID đơn hàng, phân tách bởi dấu phẩy</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <h5>Ví dụ Request</h5>
                                <pre><code class="language-text">
POST https://<?=$_SERVER['SERVER_NAME']?>/api/v2
Content-Type: application/x-www-form-urlencoded

key=your_api_key&action=multiple_refill&orders=12345,12346
                                </code></pre>
                                <h5>Ví dụ Response</h5>
                                <pre><code class="language-json">
{
    "status": "success",
    "refills": [1, 2]
}
                                </code></pre>
                            </div>

                            <!-- Tab 9: Action Refill Status -->
                            <div class="tab-pane fade" id="refill-status" role="tabpanel" aria-labelledby="refill-status-tab">
                                <h3 class="mt-4">Kiểm tra trạng thái yêu cầu refill (<code>action=refill_status</code>)</h3>
                                <p>Trả về trạng thái của một yêu cầu refill.</p>
                                <h5>Tham số</h5>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Tham số</th>
                                            <th>Kiểu</th>
                                            <th>Bắt buộc</th>
                                            <th>Mô tả</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>key</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Khóa API của bạn</td>
                                        </tr>
                                        <tr>
                                            <td>action</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Giá trị: <code>refill_status</code></td>
                                        </tr>
                                        <tr>
                                            <td>refill</td>
                                            <td>Integer</td>
                                            <td>Có</td>
                                            <td>ID của yêu cầu refill</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <h5>Ví dụ Request</h5>
                                <pre><code class="language-text">
POST https://<?=$_SERVER['SERVER_NAME']?>/api/v2
Content-Type: application/x-www-form-urlencoded

key=your_api_key&action=refill_status&refill=1
                                </code></pre>
                                <h5>Ví dụ Response</h5>
                                <pre><code class="language-json">
{
    "status": "success",
    "refill": 1,
    "order": 12345,
    "status": "Pending"
}
                                </code></pre>
                            </div>

                            <!-- Tab 10: Action Multiple Refill Status -->
                            <div class="tab-pane fade" id="multiple-refill-status" role="tabpanel" aria-labelledby="multiple-refill-status-tab">
                                <h3 class="mt-4">Kiểm tra trạng thái nhiều yêu cầu refill (<code>action=multiple_refill_status</code>)</h3>
                                <p>Trả về trạng thái của nhiều yêu cầu refill.</p>
                                <h5>Tham số</h5>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Tham số</th>
                                            <th>Kiểu</th>
                                            <th>Bắt buộc</th>
                                           th>Mô tả</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>key</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Khóa API của bạn</td>
                                        </tr>
                                        <tr>
                                            <td>action</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Giá trị: <code>multiple_refill_status</code></td>
                                        </tr>
                                        <tr>
                                            <td>refills</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Danh sách ID yêu cầu refill, phân tách bởi dấu phẩy</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <h5>Ví dụ Request</h5>
                                <pre><code class="language-text">
POST https://<?=$_SERVER['SERVER_NAME']?>/api/v2
Content-Type: application/x-www-form-urlencoded

key=your_api_key&action=multiple_refill_status&refills=1,2
                                </code></pre>
                                <h5>Ví dụ Response</h5>
                                <pre><code class="language-json">
{
    "status": "success",
    "refills": {
        "1": {
            "order": 12345,
            "status": "Pending"
        },
        "2": {
            "order": 12346,
            "status": "Completed"
        }
    }
}
                                </code></pre>
                            </div>

                            <!-- Tab 11: Action Cancel -->
                            <div class="tab-pane fade" id="cancel" role="tabpanel" aria-labelledby="cancel-tab">
                                <h3 class="mt-4">Hủy đơn hàng (<code>action=cancel</code>)</h3>
                                <p>Hủy một đơn hàng đang chờ hoặc đang tiến hành.</p>
                                <h5>Tham số</h5>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Tham số</th>
                                            <th>Kiểu</th>
                                            <th>Bắt buộc</th>
                                            <th>Mô tả</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>key</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Khóa API của bạn</td>
                                        </tr>
                                        <tr>
                                            <td>action</td>
                                            <td>String</td>
                                            <td>Có</td>
                                            <td>Giá trị: <code>cancel</code></td>
                                        </tr>
                                        <tr>
                                            <td>order</td>
                                            <td>Integer</td>
                                            <td>Có</td>
                                            <td>ID của đơn hàng cần hủy</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <h5>Ví dụ Request</h5>
                                <pre><code class="language-text">
POST https://<?=$_SERVER['SERVER_NAME']?>/api/v2
Content-Type: application/x-www-form-urlencoded

key=your_api_key&action=cancel&order=12345
                                </code></pre>
                                <h5>Ví dụ Response</h5>
                                <pre><code class="language-json">
{
    "status": "success",
    "order": 12345
}
                                </code></pre>
                            </div>

                            <!-- Tab 12: Error Handling -->
                            <div class="tab-pane fade" id="errors" role="tabpanel" aria-labelledby="errors-tab">
                                <h3 class="mt-4">Xử lý lỗi</h3>
                                <p>Nếu có lỗi, API sẽ trả về một response với định dạng sau:</p>
                                <pre><code class="language-json">
{
    "status": "error",
    "error": "Invalid API key"
}
                                </code></pre>
                                <p>Các lỗi phổ biến:</p>
                                <ul>
                                    <li><code>Invalid API key</code>: Khóa API không hợp lệ.</li>
                                    <li><code>Invalid action</code>: Giá trị action không được hỗ trợ.</li>
                                    <li><code>Missing parameters</code>: Thiếu tham số bắt buộc.</li>
                                    <li><code>Incorrect order ID</code>: ID đơn hàng không hợp lệ.</li>
                                    <li><code>Incorrect refill ID</code>: ID yêu cầu refill không hợp lệ.</li>
                                    <li><code>Order is not eligible for refill</code>: Đơn hàng không đủ điều kiện để refill.</li>
                                    <li><code>Order is not eligible for cancellation</code>: Đơn hàng không đủ điều kiện để hủy.</li>
                                </ul>
                            </div>

                            <!-- Tab 13: Notes -->
                            <div class="tab-pane fade" id="notes" role="tabpanel" aria-labelledby="notes-tab">
                                <h3 class="mt-4">Ghi chú</h3>
                                <ul>
                                    <li>Đảm bảo kiểm tra type dịch vụ và tham số yêu cầu trước khi gửi request.</li>
                                    <li>Giới hạn request: 100 request/phút.</li>
                                    <li>Sử dụng mã hash duy nhất (nếu cần) để tránh đặt trùng đơn hàng.</li>
                                    <li>Liên hệ hỗ trợ tại <a href="mailto:support@smmexample.com">support@smmexample.com</a>.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
// Khởi tạo Notiflix
Notiflix.Notify.init({ position: 'right-top', timeout: 5000 });
Notiflix.Loading.init({ svgColor: '#007bff' });

// Xử lý hiện/ẩn API Key
document.getElementById('toggleApiKey').addEventListener('click', function() {
    var apiKeyInput = document.getElementById('apiKey');
    if (apiKeyInput.type === 'password') {
        apiKeyInput.type = 'text';
        this.textContent = 'Ẩn';
    } else {
        apiKeyInput.type = 'password';
        this.textContent = 'Hiện';
    }
});

// Xử lý tạo API Key mới với Notiflix Confirm
document.getElementById('generateApiKey').addEventListener('click', function() {
    Notiflix.Confirm.show(
        'Xác nhận tạo API Key mới',
        'Bạn có chắc muốn tạo API Key mới? API Key cũ sẽ không còn hiệu lực.',
        'Tạo mới',
        'Hủy',
        function() {
            // Hiển thị loading
            Notiflix.Loading.standard('Đang tạo API Key mới...');
            $.ajax({
                url: '/model/generate_api_key',
                type: 'POST',
                dataType: 'json',
                success: function(response) {
                    Notiflix.Loading.remove();
                    if (response.status === 'success') {
                        var apiKeyInput = document.getElementById('apiKey');
                        apiKeyInput.value = response.api_key;
                        apiKeyInput.type = 'text'; // Hiển thị API Key mới
                        document.getElementById('toggleApiKey').textContent = 'Ẩn';
                        Notiflix.Notify.success('Tạo API Key mới thành công!');
                    } else {
                        Notiflix.Notify.failure('Lỗi: ' + response.error);
                    }
                },
                error: function() {
                    Notiflix.Loading.remove();
                    Notiflix.Notify.failure('Lỗi kết nối server!');
                }
            });
        },
        function() {
            // Hủy, không làm gì
        },
        {
            titleColor: '#dc3545',
            messageColor: '#333',
            okButtonBackground: '#007bff',
            cancelButtonBackground: '#6c757d'
        }
    );
});
</script>

<style>

</style>

<?php require_once realpath($_SERVER['DOCUMENT_ROOT'] . '/views/client/footer.php'); ?>