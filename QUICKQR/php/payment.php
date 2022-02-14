<?php
require_once("includes/lib/curl/curl.php");
require_once("includes/lib/curl/CurlResponse.php");



if(isset($_GET['i']) && trim($_GET['i']) == '')
{
    error($lang['INVALID_PAYMENT_PROCESS'], __LINE__, __FILE__, 1);
    exit();
}

if(isset($_GET['i']) && isset($_GET['access_token']))
{
    $access_token = $_GET['access_token'];
    if(isset($_SESSION['quickad'][$access_token])){
        $payment_settings = ORM::for_table($config['db']['pre'].'payments')
            ->select('payment_folder')
            ->where('payment_folder', $_GET['i'])
            ->find_one();

        if(!isset($payment_settings['payment_folder']))
        {
            error($lang['NOT_FOUND_PAYMENT'], __LINE__, __FILE__, 1);
            exit();
        }
        require_once('includes/payments/'.$payment_settings['payment_folder'].'/pay.php');
    }
}

if(isset($_GET['status']) && $_GET['status'] == 'cancel') {

    $access_token = isset($_GET['access_token']) ? $_GET['access_token'] : 0;

    if($access_token){
        payment_fail_save_detail($access_token);

        $error_msg = "Payment has been cancelled.";

        payment_error("cancel",$error_msg,$access_token);
    }else{
        error($lang['INVALID_PAYMENT_PROCESS'], __LINE__, __FILE__, 1);
        exit();
    }
}
if(isset($_POST['payment_method_id']))
{
    $access_token = $_POST['token'];
    $payment_type = $_SESSION['quickad'][$access_token]['payment_type'];
    $_SESSION['quickad'][$access_token]['payment_mode'] = "one-time";
    $_SESSION['quickad'][$access_token]['plan_interval'] = "day";

    if (isset($payment_type)) {

        $folder = $_POST['payment_method_id'];

        $_SESSION['quickad'][$access_token]['folder'] = $folder;

        if($folder == "2checkout"){
            $_SESSION['quickad'][$access_token]['firstname'] = $_POST['checkoutCardFirstName'];
            $_SESSION['quickad'][$access_token]['lastname'] = $_POST['checkoutCardLastName'];
            $_SESSION['quickad'][$access_token]['BillingAddress'] = $_POST['checkoutBillingAddress'];
            $_SESSION['quickad'][$access_token]['BillingCity'] = $_POST['checkoutBillingCity'];
            $_SESSION['quickad'][$access_token]['BillingState'] = $_POST['checkoutBillingState'];
            $_SESSION['quickad'][$access_token]['BillingZipcode'] = $_POST['checkoutBillingZipcode'];
            $_SESSION['quickad'][$access_token]['BillingCountry'] = $_POST['checkoutBillingCountry'];
        }

        if (file_exists('includes/payments/' . $folder . '/pay.php')) {
            require_once('includes/payments/' . $folder . '/pay.php');
        } else {
            error($lang['PAYMENT_METHOD_DISABLED'], __LINE__, __FILE__, 1);
            exit();
        }
    }else{

        error($lang['INVALID_PAYMENT_PROCESS'], __LINE__, __FILE__, 1);
        exit();
    }
}
else if(isset($_GET['token'])) {
    $access_token = $_GET['token'];
    if (isset($_SESSION['quickad'][$access_token]['payment_type'])) {

        $order_id = $_SESSION['quickad'][$access_token]['order_id'];
        $price = $_SESSION['quickad'][$access_token]['amount'];
        $payment_type = $_SESSION['quickad'][$access_token]['payment_type'];
        $restaurant_id = $_SESSION['quickad'][$access_token]['restaurant_id'];

        $restaurant = ORM::for_table($config['db']['pre'] . 'restaurant')
            ->find_one($restaurant_id);

        $restro_id = $restaurant['id'];
        $name = $restaurant['name'];
        $sub_title = $restaurant['sub_title'];
        $main_image = $restaurant['main_image'];
        $cover_image = $restaurant['cover_image'];

        $userdata = get_user_data(null, $restaurant['user_id']);
        $currency = !empty($userdata['currency'])?$userdata['currency']:get_option('currency_code');
        $amount = price_format($price, $currency);

        $page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/payment.tpl');

        $page->SetParameter('RESTAURANT_PAYPAL_INSTALL', get_restaurant_option($restro_id,'restaurant_paypal_install',0));
        $page->SetParameter('RESTAURANT_PAYPAL_TITLE', get_restaurant_option($restro_id,'restaurant_paypal_title','Paypal'));

        $page->SetParameter('RESTAURANT_STRIPE_INSTALL', get_restaurant_option($restro_id,'restaurant_stripe_install',0));
        $page->SetParameter('RESTAURANT_STRIPE_TITLE', get_restaurant_option($restro_id,'restaurant_stripe_title','Stripe'));

        $page->SetParameter('RESTAURANT_MOLLIE_INSTALL', get_restaurant_option($restro_id,'restaurant_mollie_install',0));
        $page->SetParameter('RESTAURANT_MOLLIE_TITLE', get_restaurant_option($restro_id,'restaurant_mollie_title','Mollie'));

        $page->SetParameter('RESTAURANT_PAYTM_INSTALL', get_restaurant_option($restro_id,'restaurant_paytm_install',0));
        $page->SetParameter('RESTAURANT_PAYTM_TITLE', get_restaurant_option($restro_id,'restaurant_paytm_title','Paytm'));

        $page->SetParameter ('RESTAURANT_2CHECKOUT_TITLE', get_restaurant_option($restro_id,'restaurant_2checkout_title'));
        $page->SetParameter ('RESTAURANT_2CHECKOUT_INSTALL', get_restaurant_option($restro_id,'restaurant_2checkout_install',0));
        $page->SetParameter ('RESTAURANT_2CHECKOUT_SANDBOX_MODE', get_restaurant_option($restro_id,'restaurant_2checkout_sandbox_mode','sandbox'));
        $page->SetParameter ('RESTAURANT_2CHECKOUT_ACCOUNT_NUMBER', get_restaurant_option($restro_id,'restaurant_2checkout_account_number'));
        $page->SetParameter ('RESTAURANT_2CHECKOUT_PUBLIC_KEY', get_restaurant_option($restro_id,'restaurant_2checkout_public_key'));
        $page->SetParameter ('RESTAURANT_2CHECKOUT_PRIVATE_KEY', get_restaurant_option($restro_id,'restaurant_2checkout_private_key'));

        $page->SetParameter ('RESTAURANT_PAYSTACK_INSTALL', get_restaurant_option($restro_id,'restaurant_paystack_install',0));
        $page->SetParameter ('RESTAURANT_PAYSTACK_TITLE', get_restaurant_option($restro_id,'restaurant_paystack_title'));
        $page->SetParameter ('RESTAURANT_PAYSTACK_SECRET_KEY', get_restaurant_option($restro_id,'restaurant_paystack_secret_key'));
        $page->SetParameter ('RESTAURANT_PAYSTACK_PUBLIC_KEY', get_restaurant_option($restro_id,'restaurant_paystack_public_key'));

        $page->SetParameter ('RESTAURANT_CCAVENUE_INSTALL', get_restaurant_option($restro_id,'restaurant_ccavenue_install',0));
        $page->SetParameter ('RESTAURANT_CCAVENUE_TITLE', get_restaurant_option($restro_id,'restaurant_ccavenue_title'));
        $page->SetParameter ('RESTAURANT_CCAVENUE_MERCHANT_KEY', get_restaurant_option($restro_id,'restaurant_ccavenue_merchant_key'));
        $page->SetParameter ('RESTAURANT_CCAVENUE_ACCESS_CODE', get_restaurant_option($restro_id,'restaurant_ccavenue_access_code'));
        $page->SetParameter ('RESTAURANT_CCAVENUE_WORKING_KEY', get_restaurant_option($restro_id,'restaurant_ccavenue_working_key'));

        $page->SetParameter ('RESTAURANT_PAYUMONEY_TITLE', get_restaurant_option($restro_id,'restaurant_payumoney_title'));
        $page->SetParameter ('RESTAURANT_PAYUMONEY_INSTALL', get_restaurant_option($restro_id,'restaurant_payumoney_install',0));
        $page->SetParameter ('RESTAURANT_PAYUMONEY_SANDBOX_MODE', get_restaurant_option($restro_id,'restaurant_payumoney_sandbox_mode','test'));
        $page->SetParameter ('RESTAURANT_PAYUMONEY_MERCHANT_ID', get_restaurant_option($restro_id,'restaurant_payumoney_merchant_id'));
        $page->SetParameter ('RESTAURANT_PAYUMONEY_MERCHANT_KEY', get_restaurant_option($restro_id,'restaurant_payumoney_merchant_key'));
        $page->SetParameter ('RESTAURANT_PAYUMONEY_MERCHANT_SALT', get_restaurant_option($restro_id,'restaurant_payumoney_merchant_salt'));

        $page->SetParameter('NAME', $name);
        $page->SetParameter('SUB_TITLE', $sub_title);
        $page->SetParameter('PHONE', $userdata['phone']);
        $page->SetParameter('MAIN_IMAGE', $main_image);
        $page->SetParameter('COVER_IMAGE', $cover_image);
        $page->SetParameter ('PAYMENT_TYPE', $payment_type);
        $page->SetParameter ('PRICE', $price);
        $page->SetParameter ('AMOUNT', $amount);
        $page->SetParameter ('CURRENCY_CODE', $currency);
        $page->SetParameter ('EMAIL', '');
        $page->SetParameter ('TOKEN', $access_token);
        $page->SetParameter ('COUNTRY_CODE', strtoupper(check_user_country()));

        $themecolor = $config['theme_color'];
        $colors = array();
        list($r, $g, $b) = sscanf($themecolor, "#%02x%02x%02x");
        $i = 0.01;
        while($i <= 1){
            $colors["$i"]['id'] = str_replace('.','_',$i);
            $colors["$i"]['value'] = "rgba($r,$g,$b,$i)";
            $i += 0.01;
        }
        $colors[1]['id'] = 1;
        $colors[1]['value'] = "rgba($r,$g,$b,1)";
        $page->SetLoop ('COLORS',$colors);
        $page->CreatePageEcho();
    }
    else{
        error($lang['INVALID_PAYMENT_PROCESS'], __LINE__, __FILE__, 1);
        exit();
    }
}
else
{
    error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
    exit();
}

?>
