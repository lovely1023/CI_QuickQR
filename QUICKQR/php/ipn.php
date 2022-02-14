<?php
require_once("includes/lib/curl/curl.php");
require_once("includes/lib/curl/CurlResponse.php");

if(!isset($_GET['i']))
{
    error($lang['INVALID_PAYMENT_PROCESS'], __LINE__, __FILE__, 1);
    exit();
}

$_GET['i'] = str_replace('.','',$_GET['i']);
$_GET['i'] = str_replace('/','',$_GET['i']);
$_GET['i'] = strip_tags($_GET['i']);

if(preg_match('[^A-Za-z0-9_]',$_GET['i']))
{
    error($lang['INVALID_PAYMENT_PROCESS'], __LINE__, __FILE__, 1);
    exit();
}

if(trim($_GET['i']) == '')
{
    error($lang['INVALID_PAYMENT_PROCESS'], __LINE__, __FILE__, 1);
    exit();
}

if(isset($_GET['i']) && isset($_GET['access_token'])) {
    $access_token = $_GET['access_token'];
    if (isset($_SESSION['quickad'][$access_token])) {
        $folder = $_GET['i'];
        if (file_exists('includes/payments/' . $folder . '/ipn.php')) {
            require_once('includes/payments/' . $folder . '/ipn.php');
        } else {
            error($lang['PAYMENT_METHOD_DISABLED'], __LINE__, __FILE__, 1);
            exit();
        }
    }else{
        error($lang['TRANSACTIONS_NOT_SUCCESSFUL'], __LINE__, __FILE__, 1);
        exit();
    }
}