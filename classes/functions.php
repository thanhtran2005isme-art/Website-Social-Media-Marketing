<?php
class Redirect
{
    public function __construct($url = null)
    {
        if ($url) {
            echo '<script>location.href="' . $url . '";</script>';
        }
    }
}
function check_string($data)
{
    return  trim(htmlspecialchars(addslashes($data)));
}
function Anti_xss($data)
{
    // Fix &entity\n;
    $data = str_replace(array('&amp;', '&lt;', '&gt;'), array('&amp;amp;', '&amp;lt;', '&amp;gt;'), $data);
    $data = preg_replace('/(&#*\w+)[\x00-\x20]+;/u', '$1;', $data);
    $data = preg_replace('/(&#x*[0-9A-F]+);*/iu', '$1;', $data);
    $data = html_entity_decode($data, ENT_COMPAT, 'UTF-8');

    // Remove any attribute starting with "on" or xmlns
    $data = preg_replace('#(<[^>]+?[\x00-\x20"\'])(?:on|xmlns)[^>]*+>#iu', '$1>', $data);

    // Remove javascript: and vbscript: protocols
    $data = preg_replace('#([a-z]*)[\x00-\x20]*=[\x00-\x20]*([`\'"]*)[\x00-\x20]*j[\x00-\x20]*a[\x00-\x20]*v[\x00-\x20]*a[\x00-\x20]*s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:#iu', '$1=$2nojavascript...', $data);
    $data = preg_replace('#([a-z]*)[\x00-\x20]*=([\'"]*)[\x00-\x20]*v[\x00-\x20]*b[\x00-\x20]*s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:#iu', '$1=$2novbscript...', $data);
    $data = preg_replace('#([a-z]*)[\x00-\x20]*=([\'"]*)[\x00-\x20]*-moz-binding[\x00-\x20]*:#u', '$1=$2nomozbinding...', $data);

    // Only works in IE: <span style="width: expression(alert('Ping!'));"></span>
    $data = preg_replace('#(<[^>]+?)style[\x00-\x20]*=[\x00-\x20]*[`\'"]*.*?expression[\x00-\x20]*\([^>]*+>#i', '$1>', $data);
    $data = preg_replace('#(<[^>]+?)style[\x00-\x20]*=[\x00-\x20]*[`\'"]*.*?behaviour[\x00-\x20]*\([^>]*+>#i', '$1>', $data);
    $data = preg_replace('#(<[^>]+?)style[\x00-\x20]*=[\x00-\x20]*[`\'"]*.*?s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:*[^>]*+>#iu', '$1>', $data);

    // Remove namespaced elements (we do not need them)
    $data = preg_replace('#</*\w+:\w[^>]*+>#i', '', $data);
    $query_string = $_SERVER['QUERY_STRING'];
    $sql_injection = array(
        "union",
        "coockie",
        "concat",
        "alter",
        "exec",
        "shell",
        "wget",
        "**/",
        "/**",
        "0x3a",
        "null",
        "DR/**/OP/",
        "drop",
        "/*",
        "*/",
        "*",
        "--",
        ";",
        "||",
        "' #",
        "or 1=1",
        "'1'='1",
        "BUN",
        "S@BUN",
        "char",
        "OR%",
        "`",
        "[",
        "]",
        "<",
        ">",
        "++",
        "script",
        "1,1",
        "substring",
        "ascii",
        "sleep(",
        "insert",
        "between",
        "values",
        "truncate",
        "benchmark",
        "sql",
        "mysql",
        "%27",
        "%22",
        "(",
        ")",
        "<?",
        "<?php",
        "?>",
        "../",
        "/localhost",
        "127.0.0.1",
        "loopback",
        ":",
        "%0A",
        "%0D",
        "%3C",
        "%3E",
        "%00",
        "%2e%2e",
        "input_file",
        "execute",
        "mosconfig",
        "environ",
        "scanner",
        "path=.",
        "mod=.",
        "eval\(",
        "javascript:",
        "base64_",
        "boot.ini",
        "etc/passwd",
        "self/environ",
        "md5",
        "echo.*kae",
        "=%27$",
        "'",
        '"'
    );
    foreach ($sql_injection as $key) {
        if (strlen($query_string) > 255 or strpos(strtolower($query_string), strtolower($key)) !== false) {
            new Redirect("/");
        }
    }
    $data = addslashes(trim($data));
    do {
        // Remove really unwanted tags
        $old_data = $data;
        $data = preg_replace('#</*(?:applet|b(?:ase|gsound|link)|embed|frame(?:set)?|i(?:frame|layer)|l(?:ayer|ink)|meta|object|s(?:cript|tyle)|title|xml)[^>]*+>#i', '', $data);
    } while ($old_data !== $data);
    // we are done...
    return $data;
}
function format_cash($price)
{
    return str_replace(",", ".", number_format($price));
}
function custom_cal_days_in_month($month, $year)
{
    if ($month < 1 || $month > 12 || $year < 0) {
        return false;
    }
    $nextMonth = $month % 12 + 1;
    $nextYear = ($month == 12) ? $year + 1 : $year;
    $lastDayOfNextMonth = mktime(0, 0, 0, $nextMonth, 0, $nextYear);
    $numberOfDays = date('d', $lastDayOfNextMonth);

    return $numberOfDays;
}
function qr_bank($type, $stk, $accountname, $amount, $comment)
{
    if ($type == 'MOMO') {
        $result = 'data:image/png;base64,' . base64_encode(file_get_contents("https://chart.googleapis.com/chart?chs=500x500&cht=qr&chl=2|99|$stk|||0|0|$amount|$comment|transfer_myqr"));
    } else {
        $result = "https://api.vietqr.io/$type/$stk/$amount/$comment/qronly2.jpg?accountName=$accountname";
    }
    return $result;
}
function pagination_client($url, $start, $total, $kmess)
{
    $out = [];
    $out[] = '<nav><ul class="inline-flex items-center -space-x-px">';
    $neighbors = 2;

    // Xác định vị trí bắt đầu hợp lệ
    if ($start >= $total) {
        $start = max(0, $total - (($total % $kmess) == 0 ? $kmess : ($total % $kmess)));
    } else {
        $start = max(0, (int)$start - ((int)$start % (int)$kmess));
    }

    $base_link = '<li><a class="size-10 inline-flex justify-center items-center mx-1 rounded-full text-slate-400 hover:text-white bg-white dark:bg-slate-900 shadow-xs dark:shadow-gray-700 hover:border-green-600 dark:hover:border-green-600 hover:bg-green-600 dark:hover:bg-green-600" href="' . strtr($url, array('%' => '%%')) . 'page=%d">%s</a></li>';

    // Nút "Trước"
    if ($start > 0) {
        $prev_page = max(0, $start - $kmess) / $kmess + 1;
        $out[] = sprintf('<li><a class="size-10 inline-flex justify-center items-center mx-1 rounded-full text-slate-400 bg-white dark:bg-slate-900 hover:text-white shadow-xs dark:shadow-gray-700 hover:border-green-600 dark:hover:border-green-600 hover:bg-green-600 dark:hover:bg-green-600" href="' . strtr($url, array('%' => '%%')) . 'page=%d"><i class="mdi mdi-chevron-left text-[20px]"></i></a></li>', $prev_page);
    }

    // Hiển thị trang đầu tiên nếu cần
    if ($start > $kmess * $neighbors) {
        $out[] = sprintf($base_link, 1, '1');
    }

    // Hiển thị dấu "..." nếu cần
    if ($start > $kmess * ($neighbors + 1)) {
        $out[] = '<a href="#" class="size-10 inline-flex justify-center items-center mx-1 rounded-full text-slate-400 hover:text-white bg-white dark:bg-slate-900 shadow-xs dark:shadow-gray-700 hover:border-green-600 dark:hover:border-green-600 hover:bg-green-600 dark:hover:bg-green-600">...</a></li>';
    }

    // Hiển thị các trang trước trang hiện tại
    for ($nCont = $neighbors; $nCont >= 1; $nCont--) {
        if ($start >= $kmess * $nCont) {
            $tmpStart = $start - $kmess * $nCont;
            $out[] = sprintf($base_link, $tmpStart / $kmess + 1, $tmpStart / $kmess + 1);
        }
    }

    // Hiển thị trang hiện tại
    $out[] = '<li><a href="#" aria-current="page" class="z-10 size-10 inline-flex justify-center items-center mx-1 rounded-full text-white bg-green-600 shadow-xs dark:shadow-gray-700">' . ($start / $kmess + 1) . '</a></li>';

    $tmpMaxPages = (int)(($total - 1) / $kmess) * $kmess;

    // Hiển thị các trang sau trang hiện tại
    for ($nCont = 1; $nCont <= $neighbors; $nCont++) {
        if ($start + $kmess * $nCont <= $tmpMaxPages) {
            $tmpStart = $start + $kmess * $nCont;
            $out[] = sprintf($base_link, $tmpStart / $kmess + 1, $tmpStart / $kmess + 1);
        }
    }

    // Hiển thị dấu "..." nếu cần
    if ($start + $kmess * ($neighbors + 1) < $tmpMaxPages) {
        $out[] = '<li><a href="#" class="size-10 inline-flex justify-center items-center mx-1 rounded-full text-slate-400 hover:text-white bg-white dark:bg-slate-900 shadow-xs dark:shadow-gray-700 hover:border-green-600 dark:hover:border-green-600 hover:bg-green-600 dark:hover:bg-green-600">...</a></li>';
    }

    // Hiển thị trang cuối cùng nếu cần
    if ($start + $kmess * $neighbors < $tmpMaxPages) {
        $out[] = sprintf($base_link, $tmpMaxPages / $kmess + 1, $tmpMaxPages / $kmess + 1);
    }

    // Nút "Tiếp"
    if ($start + $kmess < $total) {
        $next_page = min($total, $start + $kmess) / $kmess + 1;
        $out[] = sprintf('<li><a class="size-10 inline-flex justify-center items-center mx-1 rounded-full text-slate-400 bg-white dark:bg-slate-900 hover:text-white shadow-xs dark:shadow-gray-700 hover:border-green-600 dark:hover:border-green-600 hover:bg-green-600 dark:hover:bg-green-600" href="' . strtr($url, array('%' => '%%')) . 'page=%d"><i class="mdi mdi-chevron-right text-[20px]"></i></a></li>', $next_page);
    }

    $out[] = '</ul></nav>';
    return implode('', $out);
}


function pagination_account($url, $start, $total, $kmess)
{
    $out[] = '<ul class="pagination pagination-custom">';
    $neighbors = 2;

    if ($start >= $total) {
        $start = max(0, $total - (($total % $kmess) == 0 ? $kmess : ($total % $kmess)));
    } else {
        $start = max(0, (int)$start - ((int)$start % (int)$kmess));
    }

    $base_link = '<li class="page-item"><a class="page-link" onclick="page=%d;load_account()">%s</a></li>';

    // Nút Previous
    if ($start > 0) {
        $prev_page = $start - $kmess;
        $out[] = sprintf('<li class="page-item pre-1"><a class="page-link" onclick="page=%d;load_account()" rel="prev"></a></li>', $prev_page / $kmess + 1);
    }

    // Hiển thị trang đầu nếu xa quá
    if ($start > $kmess * $neighbors) {
        $out[] = sprintf($base_link, 1, '1');
    }

    if ($start > $kmess * ($neighbors + 1)) {
        $out[] = '<li class="page-item disabled hidden-xs"><span class="page-link">...</span></li>';
    }

    // Hiển thị các trang trước trang hiện tại
    for ($nCont = $neighbors; $nCont >= 1; $nCont--) {
        if ($start >= $kmess * $nCont) {
            $tmpStart = $start - $kmess * $nCont;
            $out[] = sprintf($base_link, (int)($tmpStart / $kmess) + 1, (int)($tmpStart / $kmess) + 1);
        }
    }

    // Trang hiện tại
    $out[] = '<li class="page-item active"><span class="page-link">' . ((int)($start / $kmess) + 1) . '</span></li>';

    $tmpMaxPages = (int)(($total - 1) / $kmess) * $kmess;

    // Hiển thị các trang sau trang hiện tại
    for ($nCont = 1; $nCont <= $neighbors; $nCont++) {
        if ($start + $kmess * $nCont <= $tmpMaxPages) {
            $tmpStart = $start + $kmess * $nCont;
            $out[] = sprintf($base_link, (int)($tmpStart / $kmess) + 1, (int)($tmpStart / $kmess) + 1);
        }
    }

    if ($start + $kmess * ($neighbors + 1) < $tmpMaxPages) {
        $out[] = '<li class="page-item disabled hidden-xs"><span class="page-link">...</span></li>';
    }

    if ($start + $kmess * $neighbors < $tmpMaxPages) {
        $out[] = sprintf($base_link, (int)($tmpMaxPages / $kmess) + 1, (int)($tmpMaxPages / $kmess) + 1);
    }

    // Nút Next
    if ($start + $kmess < $total) {
        $next_page = $start + $kmess;
        $out[] = sprintf('<li class="page-item next-1"><a class="page-link" onclick="page=%d;load_account()" rel="next"></a></li>', (int)($next_page / $kmess) + 1);
    }

    $out[] = '</ul>';
    return implode('', $out);
}


function pagination($url, $start, $total, $kmess)
{
    $out[] = ' <div class="paging_simple_numbers"><ul class="pagination">';
    $neighbors = 2;
    if ($start >= $total) $start = max(0, $total - (($total % $kmess) == 0 ? $kmess : ($total % $kmess)));
    else $start = max(0, (int)$start - ((int)$start % (int)$kmess));
    $base_link = '<li class="paginate_button page-item previous "><a class="page-link" href="' . strtr($url, array('%' => '%%')) . 'page=%d' . '">%s</a></li>';
    $out[] = $start == 0 ? '' : sprintf($base_link, $start / $kmess, 'Previous');
    if ($start > $kmess * $neighbors) $out[] = sprintf($base_link, 1, '1');
    if ($start > $kmess * ($neighbors + 1)) $out[] = '<li class="paginate_button page-item previous disabled"><a class="page-link">...</a></li>';
    for ($nCont = $neighbors; $nCont >= 1; $nCont--) if ($start >= $kmess * $nCont) {
        $tmpStart = $start - $kmess * $nCont;
        $out[] = sprintf($base_link, $tmpStart / $kmess + 1, $tmpStart / $kmess + 1);
    }
    $out[] = '<li class="paginate_button page-item previous active"><a class="page-link">' . ($start / $kmess + 1) . '</a></li>';
    $tmpMaxPages = (int)(($total - 1) / $kmess) * $kmess;
    for ($nCont = 1; $nCont <= $neighbors; $nCont++) if ($start + $kmess * $nCont <= $tmpMaxPages) {
        $tmpStart = $start + $kmess * $nCont;
        $out[] = sprintf($base_link, $tmpStart / $kmess + 1, $tmpStart / $kmess + 1);
    }
    if ($start + $kmess * ($neighbors + 1) < $tmpMaxPages) $out[] = '<li class="paginate_button page-item previous disabled"><a class="page-link">...</a></li>';
    if ($start + $kmess * $neighbors < $tmpMaxPages) $out[] = sprintf($base_link, $tmpMaxPages / $kmess + 1, $tmpMaxPages / $kmess + 1);
    if ($start + $kmess < $total) {
        $display_page = ($start + $kmess) > $total ? $total : ($start / $kmess + 2);
        $out[] = sprintf($base_link, $display_page, 'Next');
    }
    $out[] = '</ul></div>';
    return implode('', $out);
}
function pagination2($url, $start, $total, $kmess)
{
    $out[] = ' <div class="paging_simple_numbers"><ul class="pagination">';
    $neighbors = 2;
    if ($start >= $total) $start = max(0, $total - (($total % $kmess) == 0 ? $kmess : ($total % $kmess)));
    else $start = max(0, (int)$start - ((int)$start % (int)$kmess));
    $base_link = '<li class="paginate_button page-item previous "><a class="page-link" href="' . strtr($url, array('%' => '%%')) . '%d' . '">%s</a></li>';
    $out[] = $start == 0 ? '' : sprintf($base_link, $start / $kmess, 'Previous');
    if ($start > $kmess * $neighbors) $out[] = sprintf($base_link, 1, '1');
    if ($start > $kmess * ($neighbors + 1)) $out[] = '<li class="paginate_button page-item previous disabled"><a class="page-link">...</a></li>';
    for ($nCont = $neighbors; $nCont >= 1; $nCont--) if ($start >= $kmess * $nCont) {
        $tmpStart = $start - $kmess * $nCont;
        $out[] = sprintf($base_link, $tmpStart / $kmess + 1, $tmpStart / $kmess + 1);
    }
    $out[] = '<li class="paginate_button page-item previous active"><a class="page-link">' . ($start / $kmess + 1) . '</a></li>';
    $tmpMaxPages = (int)(($total - 1) / $kmess) * $kmess;
    for ($nCont = 1; $nCont <= $neighbors; $nCont++) if ($start + $kmess * $nCont <= $tmpMaxPages) {
        $tmpStart = $start + $kmess * $nCont;
        $out[] = sprintf($base_link, $tmpStart / $kmess + 1, $tmpStart / $kmess + 1);
    }
    if ($start + $kmess * ($neighbors + 1) < $tmpMaxPages) $out[] = '<li class="paginate_button page-item previous disabled"><a class="page-link">...</a></li>';
    if ($start + $kmess * $neighbors < $tmpMaxPages) $out[] = sprintf($base_link, $tmpMaxPages / $kmess + 1, $tmpMaxPages / $kmess + 1);
    if ($start + $kmess < $total) {
        $display_page = ($start + $kmess) > $total ? $total : ($start / $kmess + 2);
        $out[] = sprintf($base_link, $display_page, 'Next');
    }
    $out[] = '</ul></div>';
    return implode('', $out);
}
function myip()
{
    if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    } else {
        $ip = $_SERVER['REMOTE_ADDR'];
    }
    return $ip;
}
function curl_get($url)
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $data = curl_exec($ch);

    curl_close($ch);
    return $data;
}
function check_email($data)
{
    if (preg_match('/^.+@.+$/', $data, $matches)) {
        return true;
    } else {
        return false;
    }
}
function gettime()
{
    return date('Y/m/d H:i:s', time());
}
function random($string, $int)
{
    return substr(str_shuffle($string), 0, $int);
}
function JsonMsg($status, $msg)
{
    return json_encode(array("status" => $status, "msg" => $msg));
}
function sendResponse($success, $message)
{
    echo json_encode(['success' => $success, 'message' => $message]);
    exit;
}
function status_withdraw_orders($status)
{
    $statusMapping = [
        '0' => '<span class="bg-yellow-600/10 dark:bg-emerald-600/20 border border-emerald-600/10 dark:border-emerald-600/20 text-yellow-500 text-[15px] font-medium px-2.5 py-0.5 rounded h-5 ms-1">Đang xử lý</span>',
        '2' => '<span class="bg-emerald-600/10 dark:bg-emerald-600/20 border border-emerald-600/10 dark:border-emerald-600/20 text-emerald-600 text-[15px] font-medium px-2.5 py-0.5 rounded h-5 ms-1">Thành công</span>',
        '1' => '<span class="bg-red-600/10 dark:bg-red-600/20 border border-red-600/10 dark:border-red-600/20 text-red-600 text-[15px] font-medium px-2.5 py-0.5 rounded h-5 ms-1">Bị huỷ</span>'
    ];
    return $statusMapping[$status] ?? '<span class="badge bg-warning">Khác</span>';
}
function status_withdraw_orders_admin($status)
{
    $statusMapping = [
        '2' => '<span class="badge bg-success rounded-lg text-white" style="background-color: #1A5D1A">Đã thanh toán</span>',
        '1' => '<span class="badge bg-danger rounded-lg text-white" style="background-color: #FF6666">Bị hủy</span>',
        '0' => '<span class="badge bg-warning rounded-lg" style="background-color: #FFC436">Đang chờ</span>',
    ];
    return $statusMapping[$status] ?? '<span class="ant-tag css-eq3tly ant-tag-red">Khác</span>';
}
function getDurationMappingValue($duration)
{
    $durationMapping = array(
        'monthly' => '1 Tháng',
        'twomonthly' => '2 Tháng',
        'quarterly' => '3 Tháng',
        'semi_annually' => '6 Tháng',
        'annually' => '1 Năm',
        'biennially' => '2 Năm',
        'triennially' => '3 Năm'
    );

    return isset($durationMapping[$duration]) ? $durationMapping[$duration] : '';
}
function isValidPassword($password)
{
    // Kiểm tra xem mật khẩu có chứa các ký tự cụ thể (#, &, /) hay không
    if (preg_match('/[#&\/]/', $password)) {
        return false; // Mật khẩu không hợp lệ
    }
    return true; // Mật khẩu hợp lệ
}
function check_img($img)
{
    $filename = $_FILES[$img]['name'];
    $ext = explode(".", $filename);
    $ext = end($ext);
    $arr_type = ['jpg', 'jpeg', 'png', 'gif'];
    if (in_array($ext, $arr_type)) {
        return true;
    }
}
// function parse_order_id($des, $memo)
// {
//     $re = '/' . $memo . '\d+/im';
//     preg_match_all($re, $des, $matches, PREG_SET_ORDER, 0);
//     if (count($matches) == 0)
//         return null;
//     $orderCode = $matches[0][0];
//     $prefixLength = strlen($memo);
//     $orderId = intval(substr($orderCode, $prefixLength));
//     return $orderId;
// }
function parse_order_id($des, $memo)
{
    if (strpos($des, 'ZION') !== false) {
        $des = str_replace(' ', '', $des);
    }
    if (strpos($des, 'MOMO') !== false) {
        $re = '/' . preg_quote($memo, '/') . '\s*(\d+)/i';
    }
    if (strpos($des, 'MBVCB') !== false) {
        $re = '/' . preg_quote($memo, '/') . '[^\d\s]*\s*(\d+\s*\d*)/i';
    } else {
        $re = '/' . preg_quote($memo, '/') . '\s*(\d+)/i';
    }
    preg_match($re, $des, $matches);

    if (empty($matches)) {
        return null;
    }
    return intval(str_replace(' ', '', $matches[1]));
}
function timeAgo($time_ago)
{
    $time_ago   = date("Y-m-d H:i:s", $time_ago);
    $time_ago   = strtotime($time_ago);
    $cur_time   = time();
    $time_elapsed   = $cur_time - $time_ago;
    $seconds    = $time_elapsed;
    $minutes    = round($time_elapsed / 60);
    $hours      = round($time_elapsed / 3600);
    $days       = round($time_elapsed / 86400);
    $weeks      = round($time_elapsed / 604800);
    $months     = round($time_elapsed / 2600640);
    $years      = round($time_elapsed / 31207680);
    // Seconds
    if ($seconds <= 60) {
        return "$seconds giây trước";
    }
    //Minutes
    else if ($minutes <= 60) {
        return "$minutes phút trước";
    }
    //Hours
    else if ($hours <= 24) {
        return "$hours tiếng trước";
    }
    //Days
    else if ($days <= 7) {
        if ($days == 1) {
            return "Hôm qua";
        } else {
            return "$days ngày trước";
        }
    }
    //Weeks
    else if ($weeks <= 4.3) {
        return "$weeks tuần trước";
    }
    //Months
    else if ($months <= 12) {
        return "$months tháng trước";
    }
    //Years
    else {
        return "$years năm trước";
    }
}
function timeAgo2($time_ago)
{
    if (empty($time_ago) || !is_string($time_ago)) {
        return 'Không xác định';
    }

    // Convert input time to timestamp
    $time_ago = strtotime($time_ago);
    if ($time_ago === false) {
        return 'Thời gian không hợp lệ';
    }

    $cur_time   = time();
    $time_elapsed   = $cur_time - $time_ago;
    $seconds    = $time_elapsed;
    $minutes    = round($time_elapsed / 60);
    $hours      = round($time_elapsed / 3600);
    $days       = round($time_elapsed / 86400);
    $weeks      = round($time_elapsed / 604800);
    $months     = round($time_elapsed / 2600640);
    $years      = round($time_elapsed / 31207680);
    // Seconds
    if ($seconds <= 60) {
        return "$seconds giây trước";
    }
    //Minutes
    else if ($minutes <= 60) {
        return "$minutes phút trước";
    }
    //Hours
    else if ($hours <= 24) {
        return "$hours tiếng trước";
    }
    //Days
    else if ($days <= 7) {
        if ($days == 1) {
            return "Hôm qua";
        } else {
            return "$days ngày trước";
        }
    }
    //Weeks
    else if ($weeks <= 4.3) {
        return "$weeks tuần trước";
    }
    //Months
    else if ($months <= 12) {
        return "$months tháng trước";
    }
    //Years
    else {
        return "$years năm trước";
    }
}
function create_slug($string)
{
    $search = array(
        '#(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)#',
        '#(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)#',
        '#(ì|í|ị|ỉ|ĩ)#',
        '#(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)#',
        '#(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)#',
        '#(ỳ|ý|ỵ|ỷ|ỹ)#',
        '#(đ)#',
        '#(À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ)#',
        '#(È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ)#',
        '#(Ì|Í|Ị|Ỉ|Ĩ)#',
        '#(Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ)#',
        '#(Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ)#',
        '#(Ỳ|Ý|Ỵ|Ỷ|Ỹ)#',
        '#(Đ)#',
        "/[^a-zA-Z0-9\-\_]/",
    );
    $replace = array(
        'a',
        'e',
        'i',
        'o',
        'u',
        'y',
        'd',
        'A',
        'E',
        'I',
        'O',
        'U',
        'Y',
        'D',
        '-',
    );
    $string = preg_replace($search, $replace, $string);
    $string = preg_replace('/(-)+/', '-', $string);
    $string = strtolower($string);
    return $string;
}
function toslug($str)
{
    $str = trim(mb_strtolower($str));
    $str = preg_replace('/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/', 'a', $str);
    $str = preg_replace('/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/', 'e', $str);
    $str = preg_replace('/(ì|í|ị|ỉ|ĩ)/', 'i', $str);
    $str = preg_replace('/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/', 'o', $str);
    $str = preg_replace('/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/', 'u', $str);
    $str = preg_replace('/(ỳ|ý|ỵ|ỷ|ỹ)/', 'y', $str);
    $str = preg_replace('/(đ)/', 'd', $str);
    $str = preg_replace('/[^a-z0-9-\s]/', '', $str);
    $str = preg_replace('/([\s]+)/', '', $str);
    return $str;
}
function upload_multiple_file($name, $folder, $i = 0)
{
    $rand = rand(0, 99999999999999);
    $arr_type = ['jpg', 'jpeg', 'png', 'gif'];
    $destination_path = realpath($_SERVER["DOCUMENT_ROOT"]);
    $path = $destination_path . '/upload/' . $folder . '/'; // patch lưu file
    if ($_FILES[$name]["error"][$i] == 0) {
        $arr = explode(".", $_FILES[$name]["name"][$i]);
        if (in_array(strtolower(end($arr)), $arr_type)) {
            @move_uploaded_file($_FILES[$name]["tmp_name"][$i], $path . md5($_FILES[$name]["name"][$i] . $rand) . "." . end($arr));
        }
        $image = "upload/$folder/" . md5($_FILES[$name]["name"][$i] . $rand) . "." . end($arr);
    }
    return $image;
}
function upload_file($name, $folder)
{ // upload file lên hệ thống
    $rand = rand(0, 99999999999999);
    $arr_type = ['jpg', 'jpeg', 'png', 'gif'];
    $destination_path = realpath($_SERVER["DOCUMENT_ROOT"]);
    $path = $destination_path . '/upload/' . $folder . '/'; // patch lưu file
    if ($_FILES[$name]["error"] == 0) {
        $arr = explode(".", $_FILES[$name]["name"]);
        if (in_array(strtolower(end($arr)), $arr_type)) {
            @move_uploaded_file($_FILES[$name]["tmp_name"], $path . md5($_FILES[$name]["name"] . $rand) . "." . end($arr));
        }
        $image = "/upload/$folder/" . md5($_FILES[$name]["name"] . $rand) . "." . end($arr);
    }
    return $image;
}
function update_file($name, $old_link, $folder)
{ // cập nhật lại link web
    $rand = rand(0, 99999999999999);
    $arr_type = ['jpg', 'jpeg', 'png', 'gif'];
    $destination_path = realpath($_SERVER["DOCUMENT_ROOT"]);
    $path = $destination_path . '/upload/' . $folder . '/'; // patch lưu file
    if ($_FILES[$name]["error"] == 0) {
        $arr = explode(".", $_FILES[$name]["name"]);
        if (in_array(strtolower(end($arr)), $arr_type)) {
            @move_uploaded_file($_FILES[$name]["tmp_name"], $path . md5($_FILES[$name]["name"] . $rand) . "." . end($arr));
        }
        $image = "/upload/$folder/" . md5($_FILES[$name]["name"] . $rand) . "." . end($arr);
    } else {
        $image = $old_link;
    }
    return $image;
}
function to_slug($str)
{
    $str = trim(mb_strtolower($str));
    $str = preg_replace('/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/', 'a', $str);
    $str = preg_replace('/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/', 'e', $str);
    $str = preg_replace('/(ì|í|ị|ỉ|ĩ)/', 'i', $str);
    $str = preg_replace('/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/', 'o', $str);
    $str = preg_replace('/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/', 'u', $str);
    $str = preg_replace('/(ỳ|ý|ỵ|ỷ|ỹ)/', 'y', $str);
    $str = preg_replace('/(đ)/', 'd', $str);
    $str = preg_replace('/[^a-z0-9-\s]/', '', $str);
    $str = preg_replace('/([\s]+)/', '-', $str);
    return $str;
}
function generate_csrf_token()
{
    if (!isset($_SESSION['csrf_token']) || empty($_SESSION['csrf_token'])) {
        $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
    }
    return $_SESSION['csrf_token'];
}
function verifyCsrfToken($token)
{

    if (!isset($_SESSION['csrf_token'])) {
        return false;
    }

    if (hash_equals($_SESSION['csrf_token'], $token)) {
        return true;
    }

    return false;
}

function regenerateCsrfToken()
{
    unset($_SESSION['csrf_token'], $_SESSION['csrf_token_time']);
    generate_csrf_token();
}
function isRateLimited($userId)
{
    $key = "rate_limit_{$userId}";
    $limit = 5; // 5 requests per minute
    $ttl = 30; // 1 minute
    if (!isset($_SESSION[$key])) {
        $_SESSION[$key] = ['count' => 0, 'start' => time()];
    }
    if (time() - $_SESSION[$key]['start'] > $ttl) {
        $_SESSION[$key] = ['count' => 0, 'start' => time()];
    }
    $_SESSION[$key]['count']++;
    return $_SESSION[$key]['count'] > $limit;
}
function checkFormatCard($type, $seri, $pin)
{
    $seri = strlen($seri);
    $pin = strlen($pin);
    $data = [];
    if ($type == "Viettel" || $type == "viettel" || $type == "VT" || $type == "VIETTEL") {
        if ($seri != 11 && $seri != 14) {
            $data = ["status" => false, "msg" => "Độ dài seri không phù hợp"];
            return $data;
        }
        if ($pin != 13 && $pin != 15) {
            $data = ["status" => false, "msg" => "Độ dài mã thẻ không phù hợp"];
            return $data;
        }
    }
    if ($type == "Mobifone" || $type == "mobifone" || $type == "Mobi" || $type == "MOBIFONE") {
        if ($seri != 15) {
            $data = ["status" => false, "msg" => "Độ dài seri không phù hợp"];
            return $data;
        }
        if ($pin != 12) {
            $data = ["status" => false, "msg" => "Độ dài mã thẻ không phù hợp"];
            return $data;
        }
    }
    if ($type == "VNMB" || $type == "Vnmb" || $type == "VNM" || $type == "VNMOBI") {
        if ($seri != 16) {
            $data = ["status" => false, "msg" => "Độ dài seri không phù hợp"];
            return $data;
        }
        if ($pin != 12) {
            $data = ["status" => false, "msg" => "Độ dài mã thẻ không phù hợp"];
            return $data;
        }
    }
    if ($type == "Vinaphone" || $type == "vinaphone" || $type == "Vina" || $type == "VINAPHONE") {
        if ($seri != 14) {
            $data = ["status" => false, "msg" => "Độ dài seri không phù hợp"];
            return $data;
        }
        if ($pin != 14) {
            $data = ["status" => false, "msg" => "Độ dài mã thẻ không phù hợp"];
            return $data;
        }
    }
    if ($type == "Garena" || $type == "garena") {
        if ($seri != 9) {
            $data = ["status" => false, "msg" => "Độ dài seri không phù hợp"];
            return $data;
        }
        if ($pin != 16) {
            $data = ["status" => false, "msg" => "Độ dài mã thẻ không phù hợp"];
            return $data;
        }
    }
    if ($type == "Zing" || $type == "zing" || $type == "ZING") {
        if ($seri != 12) {
            $data = ["status" => false, "msg" => "Độ dài seri không phù hợp"];
            return $data;
        }
        if ($pin != 9) {
            $data = ["status" => false, "msg" => "Độ dài mã thẻ không phù hợp"];
            return $data;
        }
    }
    if ($type == "Vcoin" || $type == "VTC") {
        if ($seri != 12) {
            $data = ["status" => false, "msg" => "Độ dài seri không phù hợp"];
            return $data;
        }
        if ($pin != 12) {
            $data = ["status" => false, "msg" => "Độ dài mã thẻ không phù hợp"];
            return $data;
        }
    }
    $data = ["status" => true, "msg" => "Success"];
    return $data;
}
function display_service($status)
{
    $statusMapping = [
        'pending' => '<span class="bg-yellow-600/10 dark:bg-emerald-600/20 border border-emerald-600/10 dark:border-emerald-600/20 text-yellow-500 text-[15px] font-medium px-2.5 py-0.5 rounded h-5 ms-1">Đang chờ</span>',
        'completed' => '<span class="bg-emerald-600/10 dark:bg-emerald-600/20 border border-emerald-600/10 dark:border-emerald-600/20 text-emerald-600 text-[15px] font-medium px-2.5 py-0.5 rounded h-5 ms-1">Hoàn thành</span>',
        'cancelled' => '<span class="bg-red-600/10 dark:bg-red-600/20 border border-red-600/10 dark:border-red-600/20 text-red-600 text-[15px] font-medium px-2.5 py-0.5 rounded h-5 ms-1">Đã hủy</span>',
        'cancelled_refund' => '<span class="bg-red-600/10 dark:bg-red-600/20 border border-red-600/10 dark:border-red-600/20 text-red-600 text-[15px] font-medium px-2.5 py-0.5 rounded h-5 ms-1">Hủy đơn hoàn tiền</span>',
        'error_refund' => '<span class="bg-red-600/10 dark:bg-red-600/20 border border-red-600/10 dark:border-red-600/20 text-red-600 text-[15px] font-medium px-2.5 py-0.5 rounded h-5 ms-1">Lỗi đơn hoàn tiền</span>',
        'progress' => '<span class="bg-red-600/10 dark:bg-red-600/20 border border-red-600/10 dark:border-red-600/20 text-red-600 text-[15px] font-medium px-2.5 py-0.5 rounded h-5 ms-1">Đang chạy</span>',
        'in progress' => '<span class="bg-red-600/10 dark:bg-red-600/20 border border-red-600/10 dark:border-red-600/20 text-red-600 text-[15px] font-medium px-2.5 py-0.5 rounded h-5 ms-1">Đang chạy</span>',
        'partial' => '<span class="bg-red-600/10 dark:bg-red-600/20 border border-red-600/10 dark:border-red-600/20 text-red-600 text-[15px] font-medium px-2.5 py-0.5 rounded h-5 ms-1">Chạy thiếu (Đã hoàn tiền)</span>',
        'processing' => '<span class="bg-yellow-600/10 dark:bg-emerald-600/20 border border-emerald-600/10 dark:border-emerald-600/20 text-yellow-500 text-[15px] font-medium px-2.5 py-0.5 rounded h-5 ms-1">Đang xử lý</span>',
    ];

    return $statusMapping[$status] ?? '<span class="bg-yellow-600/10 dark:bg-emerald-600/20 border border-emerald-600/10 dark:border-emerald-600/20 text-yellow-500 text-[15px] font-medium px-2.5 py-0.5 rounded h-5 ms-1">Khác</span>';
}
function display_service_admin($status)
{
    $statusMapping = [
        'pending' => '<span class="badge bg-warning">Đang chờ</span>',
        'completed' => '<span class="badge bg-success">Hoàn thành</span>',
        'cancelled' => '<span class="badge bg-danger">Đã hủy</span>',
        'cancelled_refund' => '<span class="badge bg-danger">Hủy đơn hoàn tiền</span>',
        'error_refund' => '<span class="badge bg-danger">Lỗi đơn hoàn tiền</span>',
        'cancelled' => '<span class="badge bg-danger">Đã hủy</span>',
        'progress' => '<span class="badge bg-warning">Đang chạy</span>',
        'in progress' => '<span class="badge bg-warning">Đang chạy</span>',
        'partial' => '<span class="badge bg-danger">Chạy thiếu (Đã hoàn tiền)</span>',
        'processing' => '<span class="badge bg-warning">Đang xử lý</span>',
        'error' => '<span class="badge bg-danger">Lỗi</span>',
        'success' => '<span class="badge bg-success">Thành công</span>',
    ];
    return $statusMapping[$status] ?? '<span class="badge bg-warning">Khác</span>';
}
function display_card($status)
{
    $statusMapping = [
        'pending' => '<span class="bg-yellow-600/10 dark:bg-emerald-600/20 border border-emerald-600/10 dark:border-emerald-600/20 text-yellow-500 text-[15px] font-medium px-2.5 py-0.5 rounded h-5 ms-1">Đang xử lý</span>',
        'completed' => '<span class="bg-emerald-600/10 dark:bg-emerald-600/20 border border-emerald-600/10 dark:border-emerald-600/20 text-emerald-600 text-[15px] font-medium px-2.5 py-0.5 rounded h-5 ms-1">Thành công</span>',
        'error' => '<span class="bg-red-600/10 dark:bg-red-600/20 border border-red-600/10 dark:border-red-600/20 text-red-600 text-[15px] font-medium px-2.5 py-0.5 rounded h-5 ms-1">Thất bại</span>'
    ];
    return $statusMapping[$status] ?? '<span class="badge bg-warning">Khác</span>';
}

function rank_recharge($top)
{
    $statusMapping = [
        '1' => '/assets/svg/1.svg',
        '2' => '/assets/svg/2.svg',
        '3' => '/assets/svg/3.svg',
        '4' => '/assets/svg/4.svg',
        '5' => '/assets/svg/5.svg',
        '6' => '/assets/images/6.png',
    ];
    return $statusMapping[$top] ?? '<span class="badge bg-warning">Khác</span>';
}
function status_withdraw($data)
{
    $statuses = array(
        '0' => '<span class="badge bg-info">Đang xử lý</span>',
        '2' => '<span class="badge bg-success">Đã thanh toán</span>',
        '1' => '<span class="badge bg-danger">Hủy</span>'
    );
    return isset($statuses[$data]) ? $statuses[$data] : '';
}
function convertBankImage($bank)
{
    $statusMapping = [
        'mbbank' => '/assets/bank/mbbank.png',
        'acb' => '/assets/bank/acb.png',
        'vietcombank' => '/assets/bank/vcb.png',
        'bidv' => '/assets/bank/bidv.png',
        'techcombank' => '/assets/bank/techcombank.png',
        'vietinbank' => '/assets/bank/vietinbank.png',
    ];
    return $statusMapping[strtolower(str_replace(" ", "", $bank))] ?? '';
}
function getHourAndMinute($dateTimeString)
{
    // Tạo đối tượng DateTime
    $dateTime = new DateTime($dateTimeString);

    // Lấy giờ và phút
    $hour = $dateTime->format('H');
    $minute = $dateTime->format('i');

    // Trả về giờ và phút dưới dạng mảng
    return sprintf("%02d:%02d", $hour, $minute);
}
function getFlashSaleStatus($startDateTimeString, $endDateTimeString)
{
    // Lấy thời gian hiện tại
    $currentTime = time();

    // Chuyển đổi chuỗi ngày giờ thành dạng timestamp
    $startTime = strtotime($startDateTimeString);
    $endTime = strtotime($endDateTimeString);

    // So sánh thời gian hiện tại với thời gian bắt đầu và kết thúc của flash sale
    if ($currentTime < $startTime) {
        return array('status' => 1, 'msg' => "Sắp diễn ra");
    } elseif ($currentTime > $endTime) {
        return array('status' => 0, 'msg' => "Đã kết thúc");
    } else {
        return array('status' => 2, 'msg' => "Đang diễn ra");
    }
}
function calculateDiscountPercentage($oldPrice, $newPrice)
{
    if ($oldPrice <= 0 || $newPrice < 0 || $newPrice >= $oldPrice) {
        return 0; // Không có khuyến mãi hoặc giá trị không hợp lệ
    }
    return round((($oldPrice - $newPrice) / $oldPrice) * 100, 2);
}
function calculateDiscountFromAmount($currentPrice, $discountAmount)
{
    if ($currentPrice <= 0 || $discountAmount < 0 || $discountAmount >= $currentPrice) {
        return 0; // Không hợp lệ
    }
    return round(($discountAmount / ($currentPrice + $discountAmount)) * 100, 2);
}
function convertToDateOnly($datetime_string)
{
    $datetime = new DateTime($datetime_string);
    return $datetime->format('Y-m-d H:i:s');
}
function obfuscateUsername($username)
{
    // Lấy ba ký tự cuối
    $lastThree = mb_substr($username, -3);
    // Lấy ba ký tự đầu
    $firstThree = mb_substr($username, 0, 3);

    // Tạo chuỗi ẩn với định dạng ***acbc**
    return '***' . $firstThree . $lastThree . '**';
}

function isValidPhoneNumber($phone)
{
    $phone = preg_replace('/\s+|\+/', '', $phone);
    return preg_match('/^(0[2-9]{1}[0-9]{8,9})$/', $phone);
}
function tinhKetQua($so_tien, $he_so)
{
    return round(($so_tien / 1000) * $he_so);
}
function checkLicense($purchase_code, $domain, $type = 'SMMPANEL')
{
    $curl = curl_init();
    curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://license.sieuthicode.net/api/verify-purchase-code',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_POST => true,
        CURLOPT_POSTFIELDS => [
            'purchase_code' => $purchase_code,
            'domain' => $domain,
            'type' => $type
        ]
    ));

    $response = curl_exec($curl);
    curl_close($curl);
    $data = json_decode($response, true);

    if ($data && $data['status'] === 'success' && $data['status_code'] === 200) {
        return true;
    }
    return false;
}
function checkAccessAttempts($max_attempts = 5)
{
    global $db;
    $ip_address = myip();
    $attempt = $db->get_row("SELECT * FROM `failed_attempts` WHERE `ip_address` = '$ip_address' AND `type` = 'Spam Request' ");
    // Kiểm tra xem IP đã vượt quá số lần thử và trong khoảng thời gian lockout chưa
    if ($attempt && $attempt['attempts'] >= $max_attempts) {
        // Khóa IP vào bảng banned_ips
        $db->insert('banned_ips', [
            'ip'                => $ip_address,
            'attempts'          => $attempt['attempts'],
            'create_gettime'    => gettime(),
            'banned'            => 1,
            'reason'            => 'Spam Request'
        ]);
        // Xóa IP ra khỏi bảng failed_attempts sau khi đã block
        $db->remove('failed_attempts', " `ip_address` = '$ip_address' ");
        return true;
    }
    // Nếu chưa đến mức lockout, tăng số lần thử
    if ($attempt) {
        // Cập nhật số lần thất bại
        $db->cong('failed_attempts', 'attempts', 1, " `ip_address` = '$ip_address' ");
    } else {
        // Thêm bản ghi mới cho IP này
        $db->insert("failed_attempts", [
            'ip_address'    => $ip_address,
            'attempts'      => 1,
            'type'          => 'Spam Request',
            'create_gettime' => gettime()
        ]);
    }
    return true;
}
function calculateExpiryTimestamp($days)
{
    // Lấy timestamp hiện tại
    $currentTimestamp = time();

    // Cộng thêm số ngày (1 ngày = 86400 giây)
    $expiryTimestamp = $currentTimestamp + ($days * 86400);

    return $expiryTimestamp;
}
function display_flag($data)
{
    return '<img src="https://flagcdn.com/40x30/' . $data . '.png" >';
}
function display_checklive($data)
{
    if ($data == 1) {
        $show = '<span class="badge bg-success">Có</span>';
    } elseif ($data == 0) {
        $show = '<span class="badge bg-danger">Không</span>';
    }
    return $show;
}
function display_status_product($data)
{
    if ($data == 1) {
        $show = '<span class="badge bg-success">Hiển thị</span>';
    } elseif ($data == 0) {
        $show = '<span class="badge bg-danger">Ẩn</span>';
    }
    return $show;
}
function display_status_approved($data)
{
    if ($data == 1) {
        $show = '<span class="badge bg-success">Hiển thị</span>';
    } elseif ($data == 0) {
        $show = '<span class="badge bg-danger">Chưa duyệt</span>';
    }
    return $show;
}
function getFlag($flag)
{

    if (empty($flag)) {
        return '';
    }
    return '<img width="30px;" src="https://flagicons.lipis.dev/flags/4x3/' . $flag . '.svg">';
}
function buy_API_SHOPCLONE7($domain, $username, $password, $id_api, $amount)
{
    $curl = curl_init();
    curl_setopt_array($curl, array(
        CURLOPT_URL => $domain . 'ajaxs/client/product.php',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS => array('action' => 'buyProduct', 'id' => $id_api, 'amount' => $amount, 'coupon' => $username, 'api_key' => $password),
        CURLOPT_HTTPHEADER => array(),
    ));
    $response = curl_exec($curl);
    curl_close($curl);
    return $response;
}
function remove_html_tags($string)
{
    $string = preg_replace("/<ul[^>]*>/", "", $string);
    $string = preg_replace("/<\\/ul>/", "", $string);
    $string = preg_replace("/<li[^>]*>/", "", $string);
    $string = preg_replace("/<\\/li>/", "", $string);
    $string = preg_replace("/<b[^>]*>/", "", $string);
    $string = preg_replace("/<\\/b>/", "", $string);
    $string = preg_replace("/<i[^>]*>/", "", $string);
    $string = preg_replace("/<\\/i>/", "", $string);
    return $string;
}
function alertBack($text)
{
    // Thoát các ký tự đặc biệt để tránh lỗi JavaScript và XSS
    $text = htmlspecialchars($text, ENT_QUOTES, 'UTF-8');
    // Xuất đoạn mã JavaScript và thoát script
    exit("<script type='text/javascript'>if(!alert(\"$text\")){window.history.back();location.reload();}</script>");
}
function lang($text)
{
    return $text;
}

function currencyPosition($price)
{
    return $price;
}

function strLimit($text, $limit)
{
    return (strlen($text) > $limit) ? substr($text, 0, $limit) . '...' : $text;
}

// Giả lập dữ liệu cấu hình cơ bản (thay cho basicControl())
$basicConfig = [
    'is_currency_position' => 'left', // 'left' hoặc 'right'
    'has_space_between_currency_and_amount' => true, // true hoặc false
    'base_currency' => 'USD', // Mã tiền tệ mặc định
    'fraction_number' => 2 // Số chữ số thập phân
];

// Hàm lấy dữ liệu tiền tệ từ cơ sở dữ liệu
function getCurrencyData($currencyCode)
{
    global $db;
    $currencyCode = Anti_xss($currencyCode);
    $query = "SELECT currency_code, currency_symbol, new_currecry_rate FROM currencies WHERE currency_code = '$currencyCode' AND status = 1 LIMIT 1";
    $result = $db->get_row($query);

    if ($result) {
        return $result;
    }
    // Nếu không tìm thấy, trả về giá trị mặc định
    return ['code' => 'USD', 'symbol' => '$', 'conversion_rate' => 1];
}

// Hàm định dạng vị trí tiền tệ
function currencyPositionBySelectedCurrency($amount, $currency)
{

    $currencySelect = getCurrencyData($currency);

    // Quy đổi số tiền dựa trên conversion_rate (giả định amount ban đầu là USD)
    $convertedAmount = $amount * $currencySelect['new_currecry_rate'];

    // Định dạng số tiền và trả về mà không có ký hiệu hoặc mã
    return fractionNumber($convertedAmount);
}

// Hàm định dạng số với phần thập phân
function fractionNumber($amount, $afterComma = true)
{
    global $basicConfig;

    if (!$afterComma) {
        return number_format($amount + 0); // Không hiển thị thập phân
    }

    // Định dạng số với số chữ số thập phân từ cấu hình
    $fractionDigits = $basicConfig['fraction_number'] ?? 2;
    $formattedAmount = number_format($amount, $fractionDigits);

    // Loại bỏ số 0 dư thừa và dấu chấm nếu không cần thiết
    $trimmed = rtrim(rtrim($formattedAmount, '0'), '.');
    return $trimmed;
}
// function cur_user_setting($key = null, $default = null)
// {
//     global $db, $user, $data_user;

//     $defaultConfig = [
//         'currency_code'               => 'VND',
//         'currency_symbol'             => '₫',
//         'currency_thousand_separator' => 'comma',
//         'currency_decimal_separator'  => 'dot',
//         'currency_decimal'            => 2,
//         'currency_position'           => 'right',
//         'new_currecry_rate'           => 25000,
//     ];

//     $user_currency = isset($user)
//         ? $db->get_row("SELECT currency_code FROM users WHERE `username` = '" . Anti_xss($data_user['username']) . "'")['currency_code']
//         : null;

//     $config = ($user_currency)
//         ? $db->get_row("SELECT currency_code, currency_symbol, currency_decimal, new_currecry_rate, currency_thousand_separator, currency_decimal_separator, currency_position FROM currencies WHERE currency_code = '" . Anti_xss($user_currency) . "' AND status = 1")
//         ?: $defaultConfig
//         : $defaultConfig;

//     // Ép kiểu chính xác
//     $config['currency_decimal'] = isset($config['currency_decimal']) ? (int)$config['currency_decimal'] : 2;
//     $config['new_currecry_rate'] = isset($config['new_currecry_rate']) ? (float)$config['new_currecry_rate'] : 1;

//     return $key !== null ? ($config[$key] ?? $default) : $config;
// }

function cur_user_setting($key = null, $default = null)
{
    global $db, $user, $data_user;

    $defaultConfig = [
        'currency_code'               => 'VND',
        'currency_symbol'             => '₫',
        'currency_thousand_separator' => 'comma',
        'currency_decimal_separator'  => 'dot',
        'currency_decimal'            => 2,
        'currency_position'           => 'left',
        'new_currecry_rate'           => 1,
    ];

    // Kiểm tra nếu bảng currencies chưa có dữ liệu
    $count = $db->num_rows("SELECT * FROM currencies");
    if ($count == 0) {
        $db->insert("currencies", $defaultConfig);
        $config = $defaultConfig;
    } elseif (isset($user) && isset($data_user['currency_code']) && $data_user['currency_code'] !== cur_setting('currency_code')) {
        // Nếu user có chọn loại tiền khác với cấu hình mặc định
        $safe_currency_code = Anti_xss($data_user['currency_code']);
        $user_currency = $db->get_row("SELECT currency_code, currency_symbol, currency_decimal, new_currecry_rate, currency_thousand_separator, currency_decimal_separator, currency_position FROM currencies WHERE currency_code = '{$safe_currency_code}' AND status = 1");

        if ($user_currency) {
            $config = $user_currency;
        } else {
            $config = cur_setting();
        }
    } else {
        $config = cur_setting();
    }

    // Nếu không phải admin thì ẩn field nâng giá
    if (!$user || $data_user['role'] != 1) {
        unset($config['default_price_percentage_increase']);
    }

    return $key !== null ? ($config[$key] ?? $default) : $config;
}


function formatCurrencyF($number, $config = null, $show_currency_symbol = true, $number_decimal = "", $decimalpoint = "", $separator = "")
{
    if ($config === null) {
        $config = cur_user_setting();
    }


    $prefix  = '';
    $decimal = 2;
    if ($config['currency_code'] !== 'VND') {
        $number = $number / $config['new_currecry_rate'];
    } else {
        $number = $number / 1;
        $prefix = '';
    }


    $decimal = $number_decimal !== "" ? (int)$number_decimal : ($config['currency_decimal'] ?? 2);

    switch ($decimalpoint ?: $config['currency_decimal_separator']) {
        case 'dot':
            $decimalpoint = '.';
            break;
        case 'comma':
            $decimalpoint = ',';
            break;
        default:
            $decimalpoint = '.';
    }

    switch ($separator ?: $config['currency_thousand_separator']) {
        case 'dot':
            $separator = '.';
            break;
        case 'comma':
            $separator = ',';
            break;
        case 'space':
            $separator = ' ';
            break;
        default:
            $separator = ',';
    }

    $number = number_format($number, $decimal, $decimalpoint, $separator);

    if ($show_currency_symbol) {
        $symbol = $config['currency_symbol'] ?? '';
        $position = $config['currency_position'] ?? 'left';
        return $position === 'left' ? $symbol . $number : $number . ' ' . $symbol;
    }

    return $number;
}
function formatCurrency($number, $show_currency_symbol = true, $number_decimal = "", $decimalpoint = "", $separator = "")
{

    if (cur_user_setting('currency_code') !== 'VND') {
        return formatCurrencyF($number, null, $show_currency_symbol, $number_decimal, $decimalpoint, $separator);
    }

    $config = cur_setting();
   
    $decimal = 2;

    $prefix = '';

    if ($number_decimal == "") {
        $decimal = $config['currency_decimal'] ?? 2;
    }

    if ($decimalpoint == "") {
        $decimalpoint = $config['currency_decimal_separator'] ?? 'comma';
    }

    if ($separator == "") {
        $separator = $config['currency_thousand_separator'] ?? 'space';
    }

    switch ($decimalpoint) {
        case 'dot':
            $decimalpoint = '.';
            break;
        case 'comma':
            $decimalpoint = ',';
            break;
        default:
            $decimalpoint = ".";
            break;
    }

    switch ($separator) {
        case 'dot':
            $separator = '.';
            break;
        case 'comma':
            $separator = ',';
            break;
        case 'space':
            $separator = ' ';
            break;
        default:
            $separator = ',';
            break;
    }

    $number = number_format($number, $decimal, $decimalpoint, $separator);

    if ($show_currency_symbol) {
        $symbol            = $config['currency_symbol'] ?? '';
        $currency_position = $config['currency_position'] ?? 'left';

        if ($currency_position === 'left') {
            return $prefix . $symbol . '' . $number;
        } else {
            return $prefix . $number . ' ' . $symbol;
        }
    }

    return $number;
}
function cur_setting($key = null, $default = null)
{
    global $db, $user, $data_user;

    $configRaw = $db->site('currency_settings');
    $config = json_decode($configRaw, true);

    if (!is_array($config)) {
        $config = [
            'currency_code'               => 'VND',
            'currency_symbol'             => '₫',
            'currency_decimal'            => 2,
            'currency_thousand_separator' => 'comma',
            'currency_decimal_separator'  => 'dot',
            'currency_position'           => 'left',
            'new_currecry_rate'           => 1,
        ];
    }
    
    if (!isset($user) || $data_user['role'] != 1) {
        unset($config['default_price_percentage_increase']);
    }

    return $key !== null ? ($config[$key] ?? $default) : $config;
}


function buildPaginationUrl($page, $name, $social_id, $category_id) {
    $params = ['page' => $page];
    if (!empty($name)) {
        $params['name'] = $name;
    }
    if (!empty($social_id)) {
        $params['social'] = $social_id;
    }
    if (!empty($category_id)) {
        $params['categories'] = $category_id;
    }
    return '/services?' . http_build_query($params);
}
function convert_currency($price, $rate, $code, $new_code)
{
    return $price * $rate;
}
function strRandomNum($length)
{
    $characters = '0123456789';
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $randomString;
}
function getStatusClass($status)
{
    $statusClasses = [
        'awaiting' => '<span class="badge bg-warning-gradient">Đang chờ</span>',
        'pending' => '<span class="badge bg-warning-gradient">Đang xử lý</span>',
        'processing' => '<span class="badge bg-warning-gradient">Đang chờ</span>',
        'progress' => '<span class="badge bg-info-gradient">Đang chạy</span>',
        'completed' => '<span class="badge bg-success-gradient">Hoàn thành</span>',
        'partial' => '<span class="badge bg-danger-gradient">Chạy thiếu (Đã hoàn tiền)</span>',
        'canceled' => '<span class="badge bg-danger-gradient">Đã bị hủy</span>',
        'cancelled' => '<span class="badge bg-danger-gradient">Đã bị hủy</span>',
        'refunded' => '<span class="badge bg-danger-gradient">Hoàn tiền</span>',
        'fail' => '<span class="badge bg-danger-gradient">Đơn lỗi</span>',
        'error' => '<span class="badge bg-danger-gradient">Không hợp lệ</span>',
        'inactive' => '<span class="badge bg-danger-gradient">Đã khoá</span>',
        'expired' => '<span class="badge bg-danger-gradient">Đã hết hạn</span>',
        'success' => '<span class="badge bg-success-gradient">Thành công</span>',
        'refund' => '<span class="badge bg-danger-gradient">Đã hoàn tiền</span>',
    ];
    return $statusClasses[$status] ?? '<span class="badge bg-danger-gradient">Khác</span>';
}
function sanitizeInput($input)
{
    foreach ($input as $key => &$value) {
        if (is_string($value)) {
            $value = Anti_xss($value);
        }
    }
    return $input;
}
function getCountryFlag($code)
{
    if (strtolower($code) == 'uk') {
        $code = 'gb';
    }
    if (strtolower($code) == 'vnd') {
        $code = 'vn';
    }
    if (strtolower($code) == 'usd') {
        $code = 'us';
    }

    return 'https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.4.3/flags/4x3/' . strtolower($code) . '.svg';
}
function generateRandomFilename($extension)
{
    return bin2hex(random_bytes(16)) . '.' . $extension; // Tạo tên tệp 32 ký tự + phần mở rộng
}
// Hàm xử lý tải lên tệp
// function uploadFile($fileInput, $uploadDir, $allowedTypes, $maxSize, &$general_data, $fieldName, $rootDir = '')
// {
//     if (empty($fileInput['name']) || $fileInput['error'] !== UPLOAD_ERR_OK) {
//         if ($fileInput['error'] !== UPLOAD_ERR_NO_FILE) {
//             alertBack("Lỗi tải lên tệp: " . $fileInput['error']);
//         }
//         return false; // Không có tệp hoặc lỗi
//     }

//     // Tạo thư mục nếu chưa tồn tại
//     if (!is_dir($uploadDir)) {
//         mkdir($uploadDir, 0755, true);
//     }

//     // Lấy phần mở rộng và tạo tên tệp ngẫu nhiên
//     $extension = strtolower(pathinfo($fileInput['name'], PATHINFO_EXTENSION));
//     $fileName = generateRandomFilename($extension);
//     $filePath = $uploadDir . $fileName;

//     // Kiểm tra MIME type
//     $finfo = finfo_open(FILEINFO_MIME_TYPE);
//     $mime = finfo_file($finfo, $fileInput['tmp_name']);
//     finfo_close($finfo);

//     if (!in_array($mime, $allowedTypes) || $fileInput['size'] > $maxSize) {
//         alertBack("Tệp không hợp lệ (chỉ cho phép " . implode(', ', $allowedTypes) . ", tối đa " . ($maxSize / 1024 / 1024) . "MB)!");
//         return false;
//     }

//     // Di chuyển tệp
//     if (!move_uploaded_file($fileInput['tmp_name'], $filePath)) {
//         alertBack("Tải lên tệp thất bại! Kiểm tra quyền thư mục uploads.");
//         return false;
//     }

//     // Xóa tệp cũ nếu có
//     $rootDir = $rootDir ?: $_SERVER['DOCUMENT_ROOT'];
//     if (!empty($general_data[$fieldName]) && file_exists($rootDir . $general_data[$fieldName])) {
//         unlink($rootDir . $general_data[$fieldName]);
//     }

//     // Cập nhật đường dẫn trong general_data
//     $general_data[$fieldName] = '/uploads/theme/' . $fileName;
//     return true;
// }
function uploadFile($fileInput, $uploadDir, $allowedTypes, $maxSize, &$general_data, $fieldName, $rootDir = '')
{
    if (empty($fileInput['name']) || $fileInput['error'] !== UPLOAD_ERR_OK) {
        if ($fileInput['error'] !== UPLOAD_ERR_NO_FILE) {
            alertBack("Lỗi tải lên tệp: " . $fileInput['error']);
        }
        return false;
    }

    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0755, true);
    }

    $extension = strtolower(pathinfo($fileInput['name'], PATHINFO_EXTENSION));
    $fileName = generateRandomFilename($extension);
    $filePath = $uploadDir . $fileName;

    // Check file extension instead of MIME type
    $allowedExtensions = ['jpg', 'jpeg', 'png', 'gif']; // Adjust as needed
    if (!in_array($extension, $allowedExtensions) || $fileInput['size'] > $maxSize) {
        alertBack("Tệp không hợp lệ (chỉ cho phép " . implode(', ', $allowedExtensions) . ", tối đa " . ($maxSize / 1024 / 1024) . "MB)!");
        return false;
    }

    if (!move_uploaded_file($fileInput['tmp_name'], $filePath)) {
        alertBack("Tải lên tệp thất bại! Kiểm tra quyền thư mục uploads.");
        return false;
    }

    $rootDir = $rootDir ?: $_SERVER['DOCUMENT_ROOT'];
    if (!empty($general_data[$fieldName]) && file_exists($rootDir . $general_data[$fieldName])) {
        unlink($rootDir . $general_data[$fieldName]);
    }

    $general_data[$fieldName] = '/uploads/theme/' . $fileName;
    return true;
}
function logSecurityIssue($message, $ip)
{
    $logDir = realpath(__DIR__ . '/../logs');
    $logFile = $logDir . DIRECTORY_SEPARATOR . 'security.log';

    if (!is_dir($logDir)) {
        mkdir($logDir, 0755, true);
    }

    $logMessage = "[" . date('Y-m-d H:i:s') . "] [IP: {$ip}] {$message}\n";

    // Kiểm tra khả năng ghi file
    if (is_writable($logDir) && (file_exists($logFile) || is_writable($logDir))) {
        error_log($logMessage, 3, $logFile);
    } else {
        // Ghi log vào PHP error log nếu không thể ghi vào file
        error_log("Cannot write to security.log: {$logMessage}");
    }
}

function sendTelegramNotification($title, $data, $parseMode = 'Markdown')
{
    global $telegram_data;
    $botToken = $telegram_data['token'] ?? '';
    $chatId = $telegram_data['chat_id'] ?? '';

    if (!$botToken || !$chatId) {
        logSecurityIssue("Telegram notification failed: Missing bot token or chat ID", $_SERVER['REMOTE_ADDR']);
        return false;
    }
    $message = "*{$title}*\n\n";
    foreach ($data as $key => $value) {
        if ($key === 'Link') {
            $message .= "• *{$key}*: [Link](" . $value . ")\n";
        } else {
            $value = str_replace(
                ['*', '_', '[', ']', '(', ')', '~', '`', '>', '#', '+', '-', '=', '|', '{', '}', '!'],
                ['\*', '\_', '\[', '\]', '\(', '\)', '\~', '\`', '\>', '\#', '\+', '\-', '\=', '\|', '\{', '\}', '\!'],
                $value
            );
            $message .= "• *{$key}*: {$value}\n";
        }
    }

    $url = "https://sieuthicodevn.trumdev80.workers.dev/bot{$botToken}/sendMessage";
    $postData = [
        'chat_id' => $chatId,
        'text' => $message,
        'parse_mode' => $parseMode
    ];

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($postData));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 10); // Timeout sau 10 giây
    $response = curl_exec($ch);
    $curlError = curl_error($ch);
    curl_close($ch);

    if (!$response || json_decode($response)->ok !== true || $curlError) {
        logSecurityIssue("Telegram notification failed: " . ($curlError ?: ($response ?: 'No response')), $_SERVER['REMOTE_ADDR']);
        return false;
    }

    return true;
}
function handleFileUpload($file)
{
    $uploadDir = '../uploads/content_images/';
    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0777, true);
    }

    $fileName = uniqid() . '_' . basename($file['name']);
    $targetPath = $uploadDir . $fileName;

    if (move_uploaded_file($file['tmp_name'], $targetPath)) {
        return $targetPath;
    }

    return null;
}

function fileUpload($file, $path, $oldPath = null, $size = null, $format = 'webp', $quality = 80)
{
    if (!is_dir($path)) {
        mkdir($path, 0755, true);
    }
    $filename = uniqid() . '.' . $format;
    $destination = $path . '/' . $filename;

    // Basic image processing
    if ($format === 'webp' && move_uploaded_file($file['tmp_name'], $destination)) {
        return ['path' => $destination, 'filename' => $filename];
    }
    throw new Exception('Image could not be uploaded.');
}
function getBasicControl()
{
    return ['theme' => 'light_green'];
}
function config($key = null, $default = null)
{
    static $config = null;

    // Load config only once
    if ($config === null) {
        $config = include __DIR__ . '/config.php';
    }

    // Return entire config if no key is provided
    if ($key === null) {
        return $config;
    }

    // Handle dot-notation
    $keys = explode('.', $key);
    $current = $config;

    foreach ($keys as $segment) {
        if (!is_array($current) || !array_key_exists($segment, $current)) {
            return $default;
        }
        $current = $current[$segment];
    }

    return $current;
}

function store($postData, $files, $content, $language)
{

    $theme = getBasicControl()['theme'];

    // Check if content exists in config
    if (!array_key_exists('faq', config('' . $theme))) {
        header('HTTP/1.1 404 Not Found');
        exit('Content not found');
    }
    // Exclude _token and _method from input
    $inputData = array_diff_key($postData, ['_token' => '', '_method' => '']);

    // Validation (simplified)
    $rules = config('contents.' . $theme . '.' . $content . '.single.validation', []);
    $errors = [];
    foreach ($rules as $field => $rule) {
        if (strpos($rule, 'required') !== false && empty($inputData[$field][$language])) {
            $errors[$field] = 'The ' . $field . ' field is required.';
        }
        // Add more validation rules as needed
    }

    if (!empty($errors)) {
        $errors['errActive'] = $language;
        return ['status' => 'error', 'errors' => $errors, 'input' => $inputData];
    }

    // Database connection
    $db = new DB();

    // Sanitize inputs for queries
    $content = Anti_xss($content);
    $theme = Anti_xss($theme);
    $language = (int)$language; // Ensure language is an integer

    // Update or create content
    $singleContent = $db->get_row("SELECT id, media FROM contents WHERE name = '$content' AND theme = '$theme'");
    $currentTime = date('Y-m-d H:i:s');
    if ($singleContent) {
        $contentId = $singleContent['id'];
        $mediaData = json_decode($singleContent['media'], true) ?? [];
        // Update updated_at
        $db->update('contents', ['updated_at' => $currentTime], "id = $contentId");
    } else {
        $data = [
            'name' => $content,
            'theme' => $theme,
            'type' => 'single',
            'created_at' => $currentTime,
            'updated_at' => $currentTime
        ];
        $db->insert('contents', $data);
        $contentId = $db->get_id_insert();
        $mediaData = [];
    }

    // Handle media uploads
    $contentMedia = config('content_media', []);
    foreach ($contentMedia as $key => $media) {
        $oldData = $mediaData[$key] ?? null;
        if (isset($files[$key]) && $files[$key]['error'] === UPLOAD_ERR_OK) {
            try {
                $size = config('' . $theme . '.' . $content . '.single.size.image', null);
                $image = fileUpload($files[$key], config('filelocation.contents.path'), null, $size, 'webp', 80);
                $mediaData[$key] = $image;
            } catch (Exception $e) {
                $db->dis_connect();
                return ['status' => 'error', 'message' => 'Image could not be uploaded.'];
            }
        } elseif (isset($inputData[$key])) {
            $mediaData[$key] = $inputData[$key][$language];
        } elseif ($oldData) {
            $mediaData[$key] = $oldData;
        }
    }

    // Update media and updated_at in contents table
    if (!empty($mediaData)) {
        $db->update('contents', [
            'media' => json_encode($mediaData),
            'updated_at' => $currentTime
        ], "id = $contentId");
    }

    // Handle field descriptions
    $fieldNames = array_diff_key(
        config('' . $theme . '.' . $content . '.single.field_name', []),
        array_filter(config('content_media', []), fn($type) => in_array($type, ['file', 'icon', 'number']))
    );

    $description = [];
    foreach ($fieldNames as $name => $type) {
        $description[$name] = $inputData[$name][$language] ?? '';
    }


    // Update or create content details
    if ($language != 0) {
        $contentDetails = $db->get_row("SELECT id FROM content_details WHERE content_id = $contentId AND language_id = $language");
        if ($contentDetails) {
            $db->update('content_details', [
                'description' => json_encode($description),
                'updated_at' => $currentTime
            ], "content_id = $contentId AND language_id = $language");
        } else {
            $data = [
                'content_id' => $contentId,
                'language_id' => $language,
                'description' => json_encode($description),
                'created_at' => $currentTime,
                'updated_at' => $currentTime
            ];
            $db->insert('content_details', $data);
        }
    } else {
        $db->dis_connect();
        return ['status' => 'error', 'message' => 'Something went wrong, please try again.'];
    }

    $db->dis_connect();
    return ['status' => 'success', 'message' => 'Content created successfully.'];
}
function store_multiple($postData, $files, $content, $language)
{
    // Validate inputs
    if (empty($content) || !is_string($content)) {
        return ['status' => 'error', 'message' => 'Invalid content identifier.'];
    }
    $language = (int)$language;
    if ($language <= 0) {
        return ['status' => 'error', 'message' => 'Invalid language ID.'];
    }

    $theme = getBasicControl()['theme'];
    $contentConfig = config('' . $theme);

    if (!is_array($contentConfig) || !array_key_exists($content, $contentConfig)) {
        return ['status' => 'error', 'message' => 'Content not found for theme: ' . htmlspecialchars($theme)];
    }

    // Exclude _token and _method
    $inputData = array_diff_key($postData, ['_token' => '', '_method' => '']);

    // Validation
    $rules = config('' . $theme . '.' . $content . '.multiple.validation', []);
    $messages = config('message', []);
    // $errors = [];
    // foreach ($rules as $field => $rule) {
    //     $ruleParts = explode('|', $rule);
    //     foreach ($ruleParts as $rulePart) {
    //         $ruleName = strtok($rulePart, ':');
    //         switch ($ruleName) {
    //             case 'required':
    //                 if (empty($inputData[$field][$language])) {
    //                     $errors[$field] = str_replace(':attribute', $field, $messages['required'] ?? 'The ' . $field . ' field is required.');
    //                 }
    //                 break;
    //             case 'string':
    //                 if (!empty($inputData[$field][$language]) && !is_string($inputData[$field][$language])) {
    //                     $errors[$field] = str_replace(':attribute', $field, $messages['string'] ?? 'The ' . $field . ' must be a string.');
    //                 }
    //                 break;
    //             case 'max':
    //                 $max = strtok('');
    //                 if (!empty($inputData[$field][$language]) && strlen($inputData[$field][$language]) > $max) {
    //                     $errors[$field] = str_replace(':attribute', $field, $messages['max'] ?? 'The ' . $field . ' may not be greater than ' . $max . ' characters.');
    //                 }
    //                 break;
    //         }
    //     }
    // }

    // if (!empty($errors)) {
    //     $errors['errActive'] = $language;
    //     return ['status' => 'error', 'errors' => $errors, 'input' => $inputData];
    // }

    // Database connection
    $db = new DB();
    $contentEscaped = Anti_xss($content);
    $themeEscaped = Anti_xss($theme);


    $currentTime = date('Y-m-d H:i:s');
    $data = [
        'name' => $content,
        'theme' => $theme,
        'type' => 'multiple',
        'created_at' => $currentTime,
        'updated_at' => $currentTime
    ];
    $db->insert('contents', $data);
    $contentId = $db->get_id_insert();
    $mediaData = [];

    $contentMedia = config('content_media', []);
    foreach ($contentMedia as $key => $media) {
        // if (in_array($media, ['file', 'icon', 'number'])) {
        //     if (isset($files[$key]) && $files[$key]['error'] === UPLOAD_ERR_OK) {
        //         try {
        //             $size = config('' . $theme . '.' . $content . '.multiple.size.' . $key, null);
        //             $image = fileUpload($files[$key], config('filelocation.contents.path'), null, $size, 'webp', 60);
        //             $mediaData[$key] = $image;
        //         } catch (Exception $e) {
        //             $db->dis_connect();
        //             return ['status' => 'error', 'message' => 'Image could not be uploaded: ' . $e->getMessage()];
        //         }
        //     } elseif (isset($inputData[$key])) {
        //         $mediaData[$key] = $inputData[$key][$language];
        //     }
        // }
        if (in_array($media, ['file', 'icon', 'number']) && isset($files[$key]) && $files[$key]['error'] === UPLOAD_ERR_OK) {
            // File upload logic would go here if needed
            $mediaData[$key] = $inputData[$key][$language] ?? '';
        } elseif (isset($inputData[$key][$language])) {
            $mediaData[$key] = $inputData[$key][$language];
        }
    }

    if (!empty($mediaData)) {
        $db->update('contents', [
            'media' => json_encode($mediaData),
            'updated_at' => $currentTime
        ], "id = $contentId");
    }

    // $fieldNames = array_diff_key(
    //     config('' . $theme . '.' . $content . '.multiple.field_name', []),
    //     array_filter(config('content_media', []), fn($type) => in_array($type, ['file', 'icon', 'number']))
    // );


    $description = [];
    // foreach ($fieldNames as $name => $type) {
    //     $description[$name] = $inputData[$name][$language] ?? '';
    // }

    $field_name = array_diff_key(config('' . $theme . '.' . $content . '.multiple.field_name'), config("content_media"));
    foreach ($field_name as $name => $type) {
        $description[$name] = $inputData[$name][$language];
    }


    if ($language != 0) {
        $data = [
            'content_id' => $contentId,
            'language_id' => $language,
            'description' => json_encode($description),
            'created_at' => $currentTime,
            'updated_at' => $currentTime
        ];
        $db->insert('content_details', $data);
        $contentDetailsId = $db->get_id_insert();
        if (!$contentDetailsId) {
            $db->dis_connect();
            return ['status' => 'error', 'message' => 'Có lỗi xảy ra, vui lòng thử lại.'];
        }
    } else {
        $db->dis_connect();
        return ['status' => 'error', 'message' => 'ID ngôn ngữ không hợp lệ.'];
    }

    $db->dis_connect();
    return ['status' => 'success', 'message' => 'Đã tạo thành công mục FAQ.'];
}
function stringToTitle($string)
{
    return ucwords(str_replace('_', ' ', $string));
}
function updateMultipleContent($content, $id)
{
    global $db;

    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        return;
    }
    $theme = getBasicControl()['theme'];
    $inputData = array_diff_key($_POST, ['_token' => '', 'language_id' => '']);
    $files = $_FILES;
    $language_id = (int)($_POST['language_id'] ?? 0);

    // Validate input
    if ($id <= 0) {
        alertBack('Invalid ID or content type', 'error', $language_id);
    }

    // Fetch item to verify existence
    $result = $db->get_list("
        SELECT cd.id, cd.content_id
        FROM content_details cd
        JOIN contents c ON c.id = cd.content_id
        WHERE cd.id = " . (int)$id . "
        AND c.name = '" . Anti_xss($content) . "'
        AND c.type = 'multiple'
        LIMIT 1
    ");

    if (empty($result)) {
        alertBack('Content item not found', 'error', $language_id);
    }

    $content_id = $result[0]['content_id'];
    $multipleContent = config('' . $theme . '.' . $content . '.multiple');

    // Fetch existing data for media
    $content_details_sql = "
        SELECT cd.*, c.media
        FROM content_details cd
        INNER JOIN contents c ON cd.content_id = c.id
        WHERE cd.content_id = " . (int)$content_id . "
        AND cd.language_id = " . (int)$language_id . "
    ";
    $content_details = $db->get_list($content_details_sql);
    $multipleContentData = [];
    foreach ($content_details as $detail) {
        $multipleContentData[$detail['language_id']][] = [
            'description' => json_decode($detail['description'], true) ?? [],
            'content' => ['media' => json_decode($detail['media'], true) ?? []]
        ];
    }

    // Validation
    $errors = [];
    $rules = config('' . $theme . '.' . $content . '.multiple.validation', []);
    foreach ($rules as $field => $rule) {
        $fieldName = str_replace('.*', '', $field);
        $ruleParts = explode('|', $rule);
        foreach ($ruleParts as $rulePart) {
            $ruleName = strtok($rulePart, ':');
            $ruleValue = strtok('');
            switch ($ruleName) {
                case 'required':
                    if (!isset($inputData[$fieldName][$language_id]) || empty($inputData[$fieldName][$language_id])) {
                        $errors[$fieldName . '.' . $language_id] = "The $fieldName field is required.";
                    }
                    break;
                case 'string':
                    if (isset($inputData[$fieldName][$language_id]) && !is_string($inputData[$fieldName][$language_id])) {
                        $errors[$fieldName . '.' . $language_id] = "The $fieldName must be a string.";
                    }
                    break;
                case 'max':
                    $max = (int)$ruleValue;
                    if (isset($inputData[$fieldName][$language_id]) && strlen($inputData[$fieldName][$language_id]) > $max) {
                        $errors[$fieldName . '.' . $language_id] = "The $fieldName may not be greater than $max characters.";
                    }
                    break;
                case 'url':
                    if (isset($inputData[$fieldName][$language_id]) && !filter_var($inputData[$fieldName][$language_id], FILTER_VALIDATE_URL)) {
                        $errors[$fieldName . '.' . $language_id] = "The $fieldName must be a valid URL.";
                    }
                    break;
                case 'numeric':
                    if (isset($inputData[$fieldName][$language_id]) && !is_numeric($inputData[$fieldName][$language_id])) {
                        $errors[$fieldName . '.' . $language_id] = "The $fieldName must be a number.";
                    }
                    break;
                case 'date':
                    if (isset($inputData[$fieldName][$language_id]) && !strtotime($inputData[$fieldName][$language_id])) {
                        $errors[$fieldName . '.' . $language_id] = "The $fieldName must be a valid date.";
                    }
                    break;
                case 'file':
                    if (isset($files[$fieldName]) && $files[$fieldName]['error'] === UPLOAD_ERR_OK) {
                        $mimes = explode(',', str_replace('mimes:', '', $ruleValue));
                        $file_type = mime_content_type($files[$fieldName]['tmp_name']);
                        $allowed_types = array_map(function ($mime) {
                            return 'image/' . $mime;
                        }, $mimes);
                        if (!in_array($file_type, $allowed_types)) {
                            $errors[$fieldName . '.' . $language_id] = "The $fieldName must be a file of type: " . implode(', ', $mimes) . ".";
                        }
                    }
                    break;
            }
        }
    }

    if (!empty($errors)) {
        $errorMessage = implode('; ', array_values($errors));
        alertBack($errorMessage, 'error', $language_id);
    }

    // Update data
    $db->begin_transaction();
    try {
        $description = [];
        $mediaData = [];
        foreach ($multipleContent['field_name'] as $name => $type) {
            if ($type === 'file' && isset($files[$name]) && $files[$name]['error'] === UPLOAD_ERR_OK) {
                $size = $contents_config[$theme][$content]['multiple']['size'][$name] ?? null;
                $image = fileUpload($files[$name], __DIR__ . '/uploads/contents', null, $size, 'webp', 60);
                $mediaData[$name] = $image;
            } elseif (in_array($type, ['icon', 'url', 'date', 'number']) && isset($inputData[$name][$language_id])) {
                $mediaData[$name] = $inputData[$name][$language_id];
            } elseif (isset($inputData[$name][$language_id])) {
                $description[$name] = $inputData[$name][$language_id];
            }
        }

        // Update content_details
        $updated_description = json_encode($description);
        $update_details = $db->query(
            "
            UPDATE content_details
            SET description = '" . Anti_xss($updated_description) . "'
            WHERE content_id = " . (int)$content_id . "
            AND language_id = " . (int)$language_id
        );

        // Update contents media
        if (!empty($mediaData)) {
            $existing_media = $multipleContentData[$language_id][0]['content']['media'] ?? [];
            $updated_media = array_merge($existing_media, $mediaData);
            $db->query(
                "
                UPDATE contents
                SET media = '" . Anti_xss(json_encode($updated_media)) . "'
                WHERE id = " . (int)$content_id
            );
        }

        if (!$update_details) {
            throw new Exception('Failed to update content.');
        }

        $db->commit();
        alertBack('Cập nhật thành công', 'success');
    } catch (Exception $e) {
        $db->rollback();
        alertBack('Failed to update content: ' . $e->getMessage(), 'error', $language_id);
    }
}
