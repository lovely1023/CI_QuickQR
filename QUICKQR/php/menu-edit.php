<?php
if (checkloggedin()) {
    $ses_userdata = get_user_data($_SESSION['user']['username']);
    $currency = !empty($ses_userdata['currency'])?$ses_userdata['currency']:get_option('currency_code');
    $currency_data = get_currency_by_code($currency);

    $menu = ORM::for_table($config['db']['pre'] . 'menu')
        ->where(array(
            'id' => $_GET['id']
        ))
        ->find_one();

    if(!empty($menu['id'])) {
        $menuId = $menu['id'];
        $menuName = $menu['name'];
        $menuPrice = $currency_data['html_entity'] . $menu['price'];
        $menuImage = !empty($menu['image']) ? $menu['image'] : 'default.png';

        $extras_data = ORM::for_table($config['db']['pre'] . 'menu_extras')
            ->where(array(
                'menu_id' => $menuId
            ))
            ->order_by_asc('position')
            ->find_many();

        $extra = array();
        foreach ($extras_data as $info) {
            $extra[$info['id']]['id'] = $info['id'];

            $user_lang = !empty($_COOKIE['Quick_user_lang_code'])? $_COOKIE['Quick_user_lang_code'] : $config['lang_code'];
            $json = json_decode($info['translation'],true);

            $extra[$info['id']]['title'] = !empty($json[$user_lang]['title'])?$json[$user_lang]['title']:$info['title'];

            $extra[$info['id']]['price'] = $info['price'];
            $extra[$info['id']]['active'] = $info['active'];
        }

        $menu_lang = get_user_option($_SESSION['user']['id'],'restaurant_menu_languages','');
        $menu_lang = explode(',', $menu_lang);

        $language = array();
        if(!empty($menu_lang) && count($menu_lang) > 1) {
            $menu_languages = ORM::for_table($config['db']['pre'] . 'languages')
                ->where('active', 1)
                ->order_by_asc('name')
                ->where_in('code', $menu_lang)
                ->find_many();

            foreach ($menu_languages as $info) {
                $language[$info['id']]['code'] = $info['code'];
                $language[$info['id']]['name'] = $info['name'];
                $language[$info['id']]['file_name'] = $info['file_name'];
            }
        }

        $page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/menu-edit.tpl');
        $page->SetParameter('OVERALL_HEADER', create_header($lang['MANAGE_MENU']));
        $page->SetParameter('MENU_ID', $menuId);
        $page->SetParameter('MENU_NAME', $menuName);
        $page->SetParameter('MENU_PRICE', $menuPrice);
        $page->SetParameter('MENU_IMAGE', $menuImage);
        $page->SetParameter('SHOW_LANGS', count($language));
        $page->SetLoop ('LANGS', $language);
        $page->SetLoop('EXTRAS', $extra);
        $page->SetParameter('OVERALL_FOOTER', create_footer());
        $page->CreatePageEcho();
    }else{
        // 404 page
        error($lang['PAGE_NOT_FOUND'], __LINE__, __FILE__, 1);
    }
} else {
    headerRedirect($link['LOGIN']);
}