<?php

class SmmPanel {
    private $apiUrl;
    private $apiKey;

    /**
     * Khởi tạo class với URL và API key của SMM Panel
     * @param string $apiUrl URL của API SMM Panel
     * @param string $apiKey API key của nhà cung cấp
     */
    public function __construct($apiUrl, $apiKey) {
        $this->apiUrl = $apiUrl;
        $this->apiKey = $apiKey;
    }

    /**
     * Gửi yêu cầu POST tới API
     * @param array $data Dữ liệu gửi đi
     * @return array Trả về ['status' => mã HTTP, 'body' => nội dung JSON]
     * @throws Exception Nếu có lỗi trong quá trình gửi yêu cầu
     */
    private function sendRequest($data) {
        $ch = curl_init($this->apiUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        
        if ($response === false) {
            $error = curl_error($ch);
            curl_close($ch);
            throw new Exception("Lỗi cURL: " . $error);
        }
        
        curl_close($ch);
        
        return [
            'status' => $httpCode,
            'body' => json_decode($response, true)
        ];
    }

    /**
     * Lấy danh sách dịch vụ từ SMM Panel
     * @return array Danh sách dịch vụ hoặc thông báo lỗi
     * @throws Exception Nếu API trả về lỗi
     */
    public function getServices() {
        $data = [
            'key' => $this->apiKey,
            'action' => 'services'
        ];

        $response = $this->sendRequest($data);

        if ($response['status'] !== 200) {
            throw new Exception('Không thể kết nối tới API. Mã lỗi: ' . $response['status']);
        }

        if (isset($response['body']['error'])) {
            throw new Exception($response['body']['error']);
        }

        return $response['body']; // Trả về mảng dịch vụ
    }

    /**
     * Đặt hàng mới
     * @param string $serviceId ID dịch vụ
     * @param string $link Link cần tăng (VD: URL Instagram)
     * @param int $quantity Số lượng
     * @return array Thông tin đơn hàng hoặc lỗi
     * @throws Exception Nếu API trả về lỗi
     */
    public function placeOrder($serviceId, $link,$extraData = []) {
        $data = [
            'key' => $this->apiKey,
            'action' => 'add',
            'service' => $serviceId,
            'link' => $link
        ];
        $data = array_merge($data, $extraData);
       
        $response = $this->sendRequest($data);

        if ($response['status'] !== 200) {
            throw new Exception('Không thể đặt hàng. Mã lỗi: ' . $response['status']);
        }

        if (isset($response['body']['error'])) {
            throw new Exception($response['body']['error']);
        }

        return $response['body']; // Trả về thông tin đơn hàng (VD: order ID)
    }

    /**
     * Kiểm tra trạng thái đơn hàng
     * @param string $orderId ID đơn hàng
     * @return array Trạng thái đơn hàng hoặc lỗi
     * @throws Exception Nếu API trả về lỗi
     */
    public function checkOrderStatus($orderId) {
        $data = [
            'key' => $this->apiKey,
            'action' => 'status',
            'order' => $orderId
        ];

        $response = $this->sendRequest($data);

        if ($response['status'] !== 200) {
            throw new Exception('Không thể kiểm tra trạng thái. Mã lỗi: ' . $response['status']);
        }

        if (isset($response['body']['error'])) {
            throw new Exception($response['body']['error']);
        }

        return $response['body']; // Trả về trạng thái (VD: Pending, Completed)
    }
     /**
     * Kiểm tra trạng thái nhiều đơn hàng
     * @param array $orderIds Mảng chứa các ID đơn hàng
     * @return array Trạng thái của các đơn hàng hoặc lỗi
     * @throws Exception Nếu API trả về lỗi
     */
    public function checkMultipleOrdersStatus($orderIds) {
        $data = [
            'key' => $this->apiKey,
            'action' => 'status',
            'orders' => implode(',', $orderIds)
        ];

        $response = $this->sendRequest($data);

        if ($response['status'] !== 200) {
            throw new Exception('Không thể kiểm tra trạng thái các đơn hàng. Mã lỗi: ' . $response['status']);
        }

        if (isset($response['body']['error'])) {
            throw new Exception($response['body']['error']);
        }

        return $response['body']; // Trả về trạng thái của các đơn hàng (VD: mảng với key là order ID)
    }

    /**
     * Lấy số dư tài khoản
     * @return array Số dư hoặc lỗi
     * @throws Exception Nếu API trả về lỗi
     */
    public function getBalance() {
        $data = [
            'key' => $this->apiKey,
            'action' => 'balance'
        ];

        $response = $this->sendRequest($data);

        if ($response['status'] !== 200) {
            throw new Exception('Không thể lấy số dư. Mã lỗi: ' . $response['status']);
        }

        if (isset($response['body']['error'])) {
            throw new Exception($response['body']['error']);
        }

        return $response['body']; // Trả về số dư (VD: {"balance": "100.50", "currency": "USD"})
    }

     /**
     * Tạo yêu cầu refill cho một đơn hàng
     * @param string $orderId ID đơn hàng
     * @return array Thông tin yêu cầu refill hoặc lỗi
     * @throws Exception Nếu API trả về lỗi
     */
    public function createRefill($orderId) {
        $data = [
            'key' => $this->apiKey,
            'action' => 'refill',
            'order' => $orderId
        ];

        $response = $this->sendRequest($data);

        if ($response['status'] !== 200) {
            throw new Exception('Không thể tạo yêu cầu refill. Mã lỗi: ' . $response['status']);
        }

        if (isset($response['body']['error'])) {
            throw new Exception($response['body']['error']);
        }

        return $response['body']; // Trả về thông tin yêu cầu refill (VD: {"order": <refill_id>})
    }

    /**
     * Tạo yêu cầu refill cho nhiều đơn hàng
     * @param array $orderIds Mảng chứa các ID đơn hàng
     * @return array Danh sách yêu cầu refill hoặc lỗi
     * @throws Exception Nếu API trả về lỗi
     */
    public function createMultipleRefill($orderIds) {
        $data = [
            'key' => $this->apiKey,
            'action' => 'multiple_refill',
            'orders' => implode(',', $orderIds)
        ];

        $response = $this->sendRequest($data);

        if ($response['status'] !== 200) {
            throw new Exception('Không thể tạo yêu cầu refill cho nhiều đơn hàng. Mã lỗi: ' . $response['status']);
        }

        if (isset($response['body']['error'])) {
            throw new Exception($response['body']['error']);
        }

        return $response['body']; // Trả về danh sách yêu cầu refill (VD: {"orders": [{"order": <refill_id>}, ...]})
    }

    /**
     * Lấy trạng thái của một yêu cầu refill
     * @param string $refillId ID yêu cầu refill
     * @return array Trạng thái yêu cầu refill hoặc lỗi
     * @throws Exception Nếu API trả về lỗi
     */
    public function getRefillStatus($refillId) {
        $data = [
            'key' => $this->apiKey,
            'action' => 'refill_status',
            'refill' => $refillId
        ];

        $response = $this->sendRequest($data);

        if ($response['status'] !== 200) {
            throw new Exception('Không thể lấy trạng thái yêu cầu refill. Mã lỗi: ' . $response['status']);
        }

        if (isset($response['body']['error'])) {
            throw new Exception($response['body']['error']);
        }

        return $response['body']; // Trả về trạng thái (VD: {"status": "Pending|Completed|Rejected"})
    }

    /**
     * Lấy trạng thái của nhiều yêu cầu refill
     * @param array $refillIds Mảng chứa các ID yêu cầu refill
     * @return array Trạng thái của các yêu cầu refill hoặc lỗi
     * @throws Exception Nếu API trả về lỗi
     */
    public function getMultipleRefillStatus($refillIds) {
        $data = [
            'key' => $this->apiKey,
            'action' => 'multiple_refill_status',
            'refills' => implode(',', $refillIds)
        ];

        $response = $this->sendRequest($data);

        if ($response['status'] !== 200) {
            throw new Exception('Không thể lấy trạng thái các yêu cầu refill. Mã lỗi: ' . $response['status']);
        }

        if (isset($response['body']['error'])) {
            throw new Exception($response['body']['error']);
        }

        return $response['body']; // Trả về trạng thái (VD: { <refill_id>: {"status": "Pending|Completed|Rejected"}, ... })
    }

    /**
     * Hủy một đơn hàng
     * @param string $orderId ID đơn hàng
     * @return array Kết quả hủy hoặc lỗi
     * @throws Exception Nếu API trả về lỗi
     */
    public function cancelOrder($orderId) {
        $data = [
            'key' => $this->apiKey,
            'action' => 'cancel',
            'order' => $orderId
        ];

        $response = $this->sendRequest($data);

        if ($response['status'] !== 200) {
            throw new Exception('Không thể hủy đơn hàng. Mã lỗi: ' . $response['status']);
        }

        if (isset($response['body']['error'])) {
            throw new Exception($response['body']['error']);
        }

        return $response['body']; // Trả về kết quả hủy (VD: {"status": "success"})
    }
}
?>