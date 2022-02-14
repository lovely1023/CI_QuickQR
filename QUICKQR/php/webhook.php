<?php
if(isset($match['params']['i'])){
    if (file_exists('includes/payments/' . $match['params']['i'] . '/webhook.php')) {
        require_once('includes/payments/' . $match['params']['i'] . '/webhook.php');
    }
}
die();