<?php
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) .'/libs/init.php');
$session->destroy();    
new Redirect('/login');
?>