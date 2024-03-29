<?php
header("Pragma: no-cache");
header("Cache-Control: no-cache");
header("Expires: 0");
$mysqli = db_connect();
$currency = $config['currency_code'];

if (isset($_SESSION['quickad'][$access_token]['payment_type'])) {
    if(!checkloggedin()){
        header("Location: ".$link['LOGIN']);
        exit();
    }else{

        $title = $_SESSION['quickad'][$access_token]['name'];
        $amount = $_SESSION['quickad'][$access_token]['amount'];
        $base_amount = $_SESSION['quickad'][$access_token]['base_amount'];
        $folder = $_SESSION['quickad'][$access_token]['folder'];
        $payment_type = $_SESSION['quickad'][$access_token]['payment_type'];
        $user_id = $_SESSION['user']['id'];

        $billing = array(
            'type' => get_user_option($_SESSION['user']['id'],'billing_details_type'),
            'tax_id' => get_user_option($_SESSION['user']['id'],'billing_tax_id'),
            'name' => get_user_option($_SESSION['user']['id'],'billing_name'),
            'address' => get_user_option($_SESSION['user']['id'],'billing_address'),
            'city' => get_user_option($_SESSION['user']['id'],'billing_city'),
            'state' => get_user_option($_SESSION['user']['id'],'billing_state'),
            'zipcode' => get_user_option($_SESSION['user']['id'],'billing_zipcode'),
            'country' => get_user_option($_SESSION['user']['id'],'billing_country')
        );

        $taxes_ids = isset($_SESSION['quickad'][$access_token]['taxes_ids'])? $_SESSION['quickad'][$access_token]['taxes_ids'] : null;

        if($payment_type == "subscr") {
            $trans_desc = $title;
            $subcription_id = $_SESSION['quickad'][$access_token]['sub_id'];
            $plan_interval = $_SESSION['quickad'][$access_token]['plan_interval'];

            $query = "INSERT INTO " . $config['db']['pre'] . "transaction set
                product_name = '".mysqli_real_escape_string($mysqli, validate_input($title))."',
                product_id = '$subcription_id',
                seller_id = '" . $_SESSION['user']['id'] . "',
                status = 'pending',
                amount = '$amount',
                base_amount = '$base_amount',
                transaction_gatway = '".validate_input($folder)."',
                transaction_ip = '" . encode_ip($_SERVER, $_ENV) . "',
                transaction_time = '" . time() . "',
                transaction_description = '".mysqli_real_escape_string($mysqli, validate_input($trans_desc))."',
                transaction_method = 'Subscription',
                frequency = '$plan_interval',
                billing = '".json_encode($billing)."',
                taxes_ids = '$taxes_ids'
                ";
        }

        $mysqli->query($query) OR error(mysqli_error($mysqli));

        $transaction_id = $mysqli->insert_id;

        // assign posted variables to local variables
        $bank_information = nl2br(get_option('company_bank_info'));
        $item_name = $trans_desc;
        unset($_SESSION['quickad'][$access_token]);
        $page = new HtmlTemplate ("includes/payments/wire_transfer/pay.tpl");
        $page->SetParameter ('OVERALL_HEADER', create_header($lang['PAYMENT']));
        $page->SetParameter ('OVERALL_FOOTER', create_footer());
        $page->SetParameter ('BANK_INFO', $bank_information);
        $page->SetParameter ('TRANSACTION_ID', $transaction_id);
        $page->SetParameter ('ORDER_TITLE', $item_name);
        $page->SetParameter ('AMOUNT', $amount);
        $page->CreatePageEcho();

    }
}else{
    exit('Invalid Process');
    headerRedirect($link['LOGIN']);
}
?>