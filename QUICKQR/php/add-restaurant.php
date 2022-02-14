<?php
if(checkloggedin())
{
    $restaurant = ORM::for_table($config['db']['pre'].'restaurant')
        ->where('user_id', $_SESSION['user']['id'])
        ->find_one();

    $errors = array();
    if(isset($_POST['submit'])){

        if (empty($_POST['name'])) {
            $errors[]['message'] = $lang['RESTRO_NAME_REQ'];
        }
        if (empty($_POST['slug'])) {
            $errors[]['message'] = $lang['RESTRO_SLUG_REQ'];

        }else if(!preg_match('/^[a-z0-9]+(-?[a-z0-9]+)*$/i', $_POST['slug'])){
            $errors[]['message'] = $lang['RESTRO_SLUG_INVALID'];
        }else{
            $count = ORM::for_table($config['db']['pre'].'restaurant')
                ->where('slug', $_POST['slug'])
                ->where_not_equal('user_id',$_SESSION['user']['id'])
                ->count();
            // check row exist
            if ($count) {
                $errors[]['message'] = $lang['RESTRO_SLUG_NOT_EXIST'];
            }else if(in_array($config['site_url'] .$_POST['slug'],$link)){
                $errors = $lang['SLUG_NOT_EXIST'];
            }
        }
        if (empty($_POST['description'])) {
            $errors[]['message'] = $lang['RESTRO_DESC_REQ'];
        }
        if (empty($_POST['address'])) {
            $errors[]['message'] = $lang['RESTRO_ADDRESS_REQ'];
        }
        $MainFileName = null;
        $CoverFileName = null;

        if(isset($restaurant['main_image'])){
            $main_imageName = $restaurant['main_image'];
        }else{
            $main_imageName = '';
        }

        if(isset($restaurant['main_image'])){
            $cover_imageName = $restaurant['cover_image'];
        }else{
            $cover_imageName = '';
        }
        // Valid formats
        $valid_formats = array("jpeg", "jpg", "png");

        if(!count($errors) > 0)
        {
            /*Start Restaurant Logo Image Uploading*/
            $file = $_FILES['main_image'];
            $filename = $file['name'];
            $ext = getExtension($filename);
            $ext = strtolower($ext);
            if (!empty($filename)) {
                //File extension check
                if (in_array($ext, $valid_formats)) {
                    $main_path = ROOTPATH . "/storage/restaurant/logo/";
                    $filename = uniqid(time()) . '.' . $ext;
                    if (move_uploaded_file($file['tmp_name'], $main_path . $filename)) {
                        $MainFileName = $filename;
                        resizeImage(300, $main_path . $filename, $main_path . $filename);
                        resizeImage(60, $main_path . 'small_' . $filename, $main_path . $filename);
                        if (file_exists($main_path . $main_imageName) && $main_imageName != 'default.png') {
                            unlink($main_path . $main_imageName);
                            unlink($main_path . 'small_' . $main_imageName);
                        }
                    } else {
                        $errors[]['message'] = $lang['ERROR_MAIN_IMAGE'];
                    }
                } else {
                    $errors[]['message'] = $lang['ONLY_JPG_ALLOW'];
                }
            }
            /*End Restaurant Logo Image Uploading*/

            /*Start Restaurant Cover Image Uploading*/
            $cover_file = $_FILES['cover_image'];
            // Valid formats
            $valid_formats = array("jpeg", "jpg", "png");

            $cover_filename = $cover_file['name'];
            $ext = getExtension($cover_filename);
            $ext = strtolower($ext);
            if (!empty($cover_filename)) {
                //File extension check
                if (in_array($ext, $valid_formats)) {
                    $cover_path = ROOTPATH . "/storage/restaurant/cover/";
                    $cover_filename = uniqid(time()) . '.' . $ext;
                    if (move_uploaded_file($cover_file['tmp_name'], $cover_path . $cover_filename)) {
                        $CoverFileName = $cover_filename;
                        resizeImage(300, $cover_path . $cover_filename, $cover_path . $cover_filename);
                        resizeImage(60, $cover_path . 'small_' . $cover_filename, $cover_path . $cover_filename);
                        if (file_exists($cover_path . $cover_imageName) && $cover_imageName != 'default.png') {
                            unlink($cover_path . $cover_imageName);
                            unlink($cover_path . 'small_' . $cover_imageName);
                        }
                    } else {
                        $errors[]['message'] = $lang['ERROR_COVER_IMAGE'];
                    }
                } else {
                    $errors[]['message'] = $lang['ONLY_JPG_ALLOW'];
                }
            }
            /*End Restaurant Cover Image Uploading*/

        }

        if(count($errors) == 0)
        {
            $now = date("Y-m-d H:i:s");
            if(isset($restaurant['user_id'])){

                if($config['restaurant_text_editor'] == 1)
                    $description = addslashes(validate_input($_POST['description'],true));
                else
                    $description = validate_input($_POST['description']);

                $restaurant_update = ORM::for_table($config['db']['pre'].'restaurant')
                    ->where('user_id', $_SESSION['user']['id'])
                    ->find_one();
                $restaurant_id = $restaurant_update['id'];
                $restaurant_update->set('name', validate_input($_POST['name']));
                $restaurant_update->set('slug', validate_input($_POST['slug']));
                $restaurant_update->set('sub_title', validate_input($_POST['sub_title']));
                $restaurant_update->set('timing', validate_input($_POST['timing']));
                $restaurant_update->set('description', $description);
                $restaurant_update->set('address', validate_input($_POST['address']));
                if ($MainFileName) {
                    $restaurant_update->set('main_image', $MainFileName);
                }
                if ($CoverFileName) {
                    $restaurant_update->set('cover_image', $CoverFileName);
                }
                $restaurant_update->save();

            }else{
                $insert_restaurant = ORM::for_table($config['db']['pre'].'restaurant')->create();
                $insert_restaurant->user_id = validate_input($_SESSION['user']['id']);
                $insert_restaurant->name = validate_input($_POST['name']);
                $insert_restaurant->slug = validate_input($_POST['slug']);
                $insert_restaurant->sub_title = validate_input($_POST['sub_title']);
                $insert_restaurant->timing = validate_input($_POST['timing']);
                $insert_restaurant->description = validate_input($_POST['description']);
                $insert_restaurant->address = validate_input($_POST['address']);
                $insert_restaurant->created_at = $now;
                if ($MainFileName) {
                    $insert_restaurant->main_image = $MainFileName;
                }
                if ($CoverFileName) {
                    $insert_restaurant->cover_image = $CoverFileName;
                }
                $insert_restaurant->save();

                $restaurant_id = $insert_restaurant->id();
            }

            update_restaurant_option($restaurant_id,'restaurant_template',$_POST['restaurant_template']);
            update_restaurant_option($restaurant_id,'restaurant_on_table_order',$_POST['restaurant_on_table_order']);
            update_restaurant_option($restaurant_id,'restaurant_takeaway_order',$_POST['restaurant_takeaway_order']);
            update_restaurant_option($restaurant_id,'restaurant_delivery_order',$_POST['restaurant_delivery_order']);
            update_restaurant_option($restaurant_id,'restaurant_online_payment',$_POST['restaurant_online_payment']);

            update_restaurant_option($restaurant_id,'restaurant_paypal_install',$_POST['restaurant_paypal_install']);
            update_restaurant_option($restaurant_id,'restaurant_paypal_title',$_POST['restaurant_paypal_title']);
            update_restaurant_option($restaurant_id,'restaurant_paypal_sandbox_mode',$_POST['restaurant_paypal_sandbox_mode']);
            update_restaurant_option($restaurant_id,'restaurant_paypal_api_client_id',$_POST['restaurant_paypal_api_client_id']);
            update_restaurant_option($restaurant_id,'restaurant_paypal_api_secret',$_POST['restaurant_paypal_api_secret']);

            update_restaurant_option($restaurant_id,'restaurant_stripe_install',$_POST['restaurant_stripe_install']);
            update_restaurant_option($restaurant_id,'restaurant_stripe_title',$_POST['restaurant_stripe_title']);
            update_restaurant_option($restaurant_id,'restaurant_stripe_publishable_key',$_POST['restaurant_stripe_publishable_key']);
            update_restaurant_option($restaurant_id,'restaurant_stripe_secret_key',$_POST['restaurant_stripe_secret_key']);
            update_restaurant_option($restaurant_id,'restaurant_stripe_webhook_secret',$_POST['restaurant_stripe_webhook_secret']);

            update_restaurant_option($restaurant_id,'restaurant_paytm_install',$_POST['restaurant_paytm_install']);
            update_restaurant_option($restaurant_id,'restaurant_paytm_title',$_POST['restaurant_paytm_title']);
            update_restaurant_option($restaurant_id,'restaurant_paytm_sandbox_mode',$_POST['restaurant_paytm_sandbox_mode']);
            update_restaurant_option($restaurant_id,'restaurant_paytm_merchant_key',$_POST['restaurant_paytm_merchant_key']);
            update_restaurant_option($restaurant_id,'restaurant_paytm_merchant_mid',$_POST['restaurant_paytm_merchant_mid']);
            update_restaurant_option($restaurant_id,'restaurant_paytm_merchant_website',$_POST['restaurant_paytm_merchant_website']);

            update_restaurant_option($restaurant_id,'restaurant_mollie_install',$_POST['restaurant_mollie_install']);
            update_restaurant_option($restaurant_id,'restaurant_mollie_title',$_POST['restaurant_mollie_title']);
            update_restaurant_option($restaurant_id,'restaurant_mollie_api_key',$_POST['restaurant_mollie_api_key']);

            update_restaurant_option($restaurant_id,'restaurant_2checkout_install',$_POST['restaurant_2checkout_install']);
            update_restaurant_option($restaurant_id,'restaurant_2checkout_title',$_POST['restaurant_2checkout_title']);
            update_restaurant_option($restaurant_id,'restaurant_2checkout_sandbox_mode',$_POST['restaurant_2checkout_sandbox_mode']);
            update_restaurant_option($restaurant_id,'restaurant_2checkout_account_number',$_POST['restaurant_2checkout_account_number']);
            update_restaurant_option($restaurant_id,'restaurant_2checkout_public_key',$_POST['restaurant_2checkout_public_key']);
            update_restaurant_option($restaurant_id,'restaurant_2checkout_private_key',$_POST['restaurant_2checkout_private_key']);

            update_restaurant_option($restaurant_id,'restaurant_paystack_install',$_POST['restaurant_paystack_install']);
            update_restaurant_option($restaurant_id,'restaurant_paystack_title',$_POST['restaurant_paystack_title']);
            update_restaurant_option($restaurant_id,'restaurant_paystack_secret_key',$_POST['restaurant_paystack_secret_key']);
            update_restaurant_option($restaurant_id,'restaurant_paystack_public_key',$_POST['restaurant_paystack_public_key']);

            update_restaurant_option($restaurant_id,'restaurant_ccavenue_install',$_POST['restaurant_ccavenue_install']);
            update_restaurant_option($restaurant_id,'restaurant_ccavenue_title',$_POST['restaurant_ccavenue_title']);
            update_restaurant_option($restaurant_id,'restaurant_ccavenue_merchant_key',$_POST['restaurant_ccavenue_merchant_key']);
            update_restaurant_option($restaurant_id,'restaurant_ccavenue_access_code',$_POST['restaurant_ccavenue_access_code']);
            update_restaurant_option($restaurant_id,'restaurant_ccavenue_working_key',$_POST['restaurant_ccavenue_working_key']);

            update_restaurant_option($restaurant_id,'restaurant_payumoney_install',$_POST['restaurant_payumoney_install']);
            update_restaurant_option($restaurant_id,'restaurant_payumoney_title',$_POST['restaurant_payumoney_title']);
            update_restaurant_option($restaurant_id,'restaurant_payumoney_sandbox_mode',$_POST['restaurant_payumoney_sandbox_mode']);
            update_restaurant_option($restaurant_id,'restaurant_payumoney_merchant_id',$_POST['restaurant_payumoney_merchant_id']);
            update_restaurant_option($restaurant_id,'restaurant_payumoney_merchant_key',$_POST['restaurant_payumoney_merchant_key']);
            update_restaurant_option($restaurant_id,'restaurant_payumoney_merchant_salt',$_POST['restaurant_payumoney_merchant_salt']);

            transfer($link['ADD_RESTAURANT'],$lang['SAVED_SUCCESS'],$lang['SAVED_SUCCESS']);
            exit;
        }
    }


    if(isset($restaurant['user_id'])){
        $restro_id = $restaurant['id'];
        $name = $restaurant['name'];
        $slug = $restaurant['slug'];
        $sub_title = $restaurant['sub_title'];
        $timing = $restaurant['timing'];
        $description = stripcslashes(nl2br($restaurant['description']));
        $address = $restaurant['address'];
        $mapLat = $restaurant['latitude'];
        $mapLong = $restaurant['longitude'];
        $main_image = $restaurant['main_image'];
        $cover_image = $restaurant['cover_image'];
        if(!empty($slug)) {
            $restaurant_link = $config['site_url'] . $slug;
        }else{
            $restaurant_link = $link['RESTAURANT'].'/' . $restro_id;
        }
    }else{
        $restro_id = '';
        $name = '';
        $slug = '';
        $sub_title = '';
        $timing = '';
        $description = '';
        $address = '';
        $mapLat     =  get_option("home_map_latitude");
        $mapLong    =  get_option("home_map_longitude");
        $main_image = 'default.png';
        $cover_image = 'default.png';
        $restaurant_link = '#';
    }

    $restaurant_templates = array();

    if ($handle = opendir('restaurant-templates/'))
    {
        while (false !== ($folder = readdir($handle)))
        {
            if ($folder != "." && $folder != "..")
            {
                $filepath = "restaurant-templates/" . $folder . "/theme-info.txt";
                if(file_exists($filepath)){
                    $themefile = fopen($filepath,"r");

                    $themeinfo = array();
                    while(! feof($themefile)) {
                        $lineRead = fgets($themefile);
                        if (strpos($lineRead, ':') !== false) {
                            $line = explode(':',$lineRead);
                            $key = trim($line[0]);
                            $value = trim($line[1]);
                            $themeinfo[$key] = $value;
                        }
                    }
                    $restaurant_templates[$folder]['folder'] = $folder;
                    $restaurant_templates[$folder]['name'] = $themeinfo['Theme Name'];
                    fclose($themefile);
                }
            }
        }
        closedir($handle);
    }

    // Get usergroup details
    $group_id = get_user_group();
    // Get membership details
    switch ($group_id){
        case 'free':
            $plan = json_decode(get_option('free_membership_plan'), true);
            $settings = $plan['settings'];
            $allow_order = $settings['allow_ordering'];
            break;
        case 'trial':
            $plan = json_decode(get_option('trial_membership_plan'), true);
            $settings = $plan['settings'];
            $allow_order = $settings['allow_ordering'];
            break;
        default:
            $plan = ORM::for_table($config['db']['pre'] . 'plans')
                ->select('settings')
                ->where('id', $group_id)
                ->find_one();
            if(!isset($plan['settings'])){
                $plan = json_decode(get_option('free_membership_plan'), true);
                $settings = $plan['settings'];
                $allow_order = $settings['allow_ordering'];
            }else{
                $settings = json_decode($plan['settings'],true);
                $allow_order = $settings['allow_ordering'];
            }
            break;
    }


    $page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/add-restaurant.tpl');
    $page->SetParameter ('OVERALL_HEADER', create_header($lang['MANAGE_RESTAURANT']));
    $page->SetParameter ('SITE_TITLE', $config['site_title']);
    if(count($errors) > 0){
        $page->SetLoop('ERRORS', $errors);
    }else{
        $page->SetLoop('ERRORS', "");
    }

    $page->SetLoop('RESTAURANT_TEMPLATES', $restaurant_templates);
    $page->SetParameter('RESTAURANT_TEMPLATE', get_restaurant_option($restro_id,'restaurant_template','classic-theme'));
    $page->SetParameter ('RESTAURANT_SEND_ORDER', get_restaurant_option($restro_id,'restaurant_send_order',1));
    $page->SetParameter ('RESTAURANT_ON_TABLE_ORDER', get_restaurant_option($restro_id,'restaurant_on_table_order', get_restaurant_option($restro_id,'restaurant_send_order',1)));
    $page->SetParameter ('RESTAURANT_TAKEAWAY_ORDER', get_restaurant_option($restro_id,'restaurant_takeaway_order',0));
    $page->SetParameter ('RESTAURANT_DELIVERY_ORDER', get_restaurant_option($restro_id,'restaurant_delivery_order',0));
    $page->SetParameter ('RESTAURANT_ONLINE_PAYMENT', get_restaurant_option($restro_id,'restaurant_online_payment',0));

    $page->SetParameter ('RESTAURANT_PAYPAL_INSTALL', get_restaurant_option($restro_id,'restaurant_paypal_install',0));
    $page->SetParameter ('RESTAURANT_PAYPAL_TITLE', get_restaurant_option($restro_id,'restaurant_paypal_title'));
    $page->SetParameter ('RESTAURANT_PAYPAL_SANDBOX_MODE', get_restaurant_option($restro_id,'restaurant_paypal_sandbox_mode','Yes'));
    $page->SetParameter ('RESTAURANT_PAYPAL_API_CLIENT_ID', get_restaurant_option($restro_id,'restaurant_paypal_api_client_id'));
    $page->SetParameter ('RESTAURANT_PAYPAL_API_SECRET', get_restaurant_option($restro_id,'restaurant_paypal_api_secret'));

    $page->SetParameter ('RESTAURANT_STRIPE_INSTALL', get_restaurant_option($restro_id,'restaurant_stripe_install',0));
    $page->SetParameter ('RESTAURANT_STRIPE_TITLE', get_restaurant_option($restro_id,'restaurant_stripe_title'));
    $page->SetParameter ('RESTAURANT_STRIPE_PUBLISHABLE_KEY', get_restaurant_option($restro_id,'restaurant_stripe_publishable_key'));
    $page->SetParameter ('RESTAURANT_STRIPE_SECRET_KEY', get_restaurant_option($restro_id,'restaurant_stripe_secret_key'));
    $page->SetParameter ('RESTAURANT_STRIPE_WEBHOOK_SECRET', get_restaurant_option($restro_id,'restaurant_stripe_webhook_secret'));

    $page->SetParameter ('RESTAURANT_PAYTM_TITLE', get_restaurant_option($restro_id,'restaurant_paytm_title'));
    $page->SetParameter ('RESTAURANT_PAYTM_INSTALL', get_restaurant_option($restro_id,'restaurant_paytm_install',0));
    $page->SetParameter ('RESTAURANT_PAYTM_SANDBOX_MODE', get_restaurant_option($restro_id,'restaurant_paytm_sandbox_mode','Yes'));
    $page->SetParameter ('RESTAURANT_PAYTM_MERCHANT_KEY', get_restaurant_option($restro_id,'restaurant_paytm_merchant_key'));
    $page->SetParameter ('RESTAURANT_PAYTM_MERCHANT_MID', get_restaurant_option($restro_id,'restaurant_paytm_merchant_mid'));
    $page->SetParameter ('RESTAURANT_PAYTM_MERCHANT_WEBSITE', get_restaurant_option($restro_id,'restaurant_paytm_merchant_website'));

    $page->SetParameter ('RESTAURANT_MOLLIE_TITLE', get_restaurant_option($restro_id,'restaurant_mollie_title'));
    $page->SetParameter ('RESTAURANT_MOLLIE_INSTALL', get_restaurant_option($restro_id,'restaurant_mollie_install',0));
    $page->SetParameter ('RESTAURANT_MOLLIE_API_KEY', get_restaurant_option($restro_id,'restaurant_mollie_api_key'));

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

    $page->SetParameter ('ALLOW_ORDERING', $allow_order);
    $page->SetParameter('RESTRO_LINK', $restaurant_link);
    $page->SetParameter('RESTRO_ID', $restro_id);
    $page->SetParameter('NAME', $name);
    $page->SetParameter('SLUG', $slug);
    $page->SetParameter('SUB_TITLE', $sub_title);
    $page->SetParameter('TIMING', $timing);
    $page->SetParameter('DESCRIPTION', $description);
    $page->SetParameter('ADDRESS', $address);
    $page->SetParameter('MAIN_IMAGE', $main_image);
    $page->SetParameter('COVER_IMAGE', $cover_image);
    $page->SetParameter('MAP_COLOR', $config['map_color']);
    $page->SetParameter('ZOOM', $config['home_map_zoom']);


    $page->SetParameter ('OVERALL_FOOTER', create_footer());
    $page->CreatePageEcho();
}
else{
    headerRedirect($link['LOGIN']);
}
?>