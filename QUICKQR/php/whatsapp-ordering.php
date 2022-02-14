<?php
// if whatsapp ordering is disable
if(!$config['quickorder_enable']){
    error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
}

if(checkloggedin()) {
    $restaurant = ORM::for_table($config['db']['pre'].'restaurant')
        ->where('user_id', $_SESSION['user']['id'])
        ->find_one();

    if(isset($_POST['submit'])){
        update_restaurant_option($restaurant['id'],'quickorder_enable', $_POST['quickorder_enable']);
        update_restaurant_option($restaurant['id'],'whatsapp_number', $_POST['whatsapp_number']);
        update_restaurant_option($restaurant['id'],'whatsapp_message', $_POST['whatsapp_message']);

        transfer($link['WHATSAPP_ORDERING'],$lang['SAVED_SUCCESS'],$lang['SAVED_SUCCESS']);
        exit;
    }


    $whatsapp_number = $whatsapp_message = '';
    if($restaurant['id']){

        $whatsapp_message = get_restaurant_option($restaurant['id'],'whatsapp_message');

        if(empty($whatsapp_message))
            $whatsapp_message = $config['quickorder_whatsapp_message'];

        $whatsapp_number = get_restaurant_option($restaurant['id'],'whatsapp_number');
    } else{
        transfer($link['ADD_RESTAURANT'],$lang['CREATE_RESTAURANT_FIRST'],$lang['CREATE_RESTAURANT_FIRST']);
        exit;
    }

    // Output to template
    if (!file_exists('plugins/quickorder/index.tpl')) {
        error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
        exit();
    }

    $page = new HtmlTemplate ('plugins/quickorder/index.tpl');
    $page->SetParameter ('OVERALL_HEADER', create_header($lang['WHATSAPP_ORDERING']));
    $page->SetParameter ('WHATSAPP_NUMBER', $whatsapp_number);
    $page->SetParameter ('WHATSAPP_MESSAGE', $whatsapp_message);
    $page->SetParameter ('RESTAURANT_QUICKORDER_ENABLE', get_restaurant_option($restaurant['id'],'quickorder_enable',0));
    $page->SetParameter ('OVERALL_FOOTER', create_footer());

    $page->CreatePageEcho();
}
else{
    error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
    exit();
}
?>