<?php
if(checkloggedin())
{
    $start = date('Y-m-01');
    $end = date('Y-m-t');

    $days = $scans = [];
    $total_scans = $total_categories = $total_menus = $pending_orders = 0;

    $period = new \DatePeriod( date_create($start), \DateInterval::createFromDateString( '1 day' ), date_create($end) );
    /** @var \DateTime $dt */
    foreach ( $period as $dt ) {
        $days[] = date('d M', $dt->getTimestamp() );
        $scans[date('d M', $dt->getTimestamp() )] = 0;
    }

    $restaurant = ORM::for_table($config['db']['pre'].'restaurant')
        ->where('user_id', $_SESSION['user']['id'])
        ->find_one();

    if(isset($restaurant['user_id'])) {
        $sql = "SELECT DATE(`date`) AS created, COUNT(1) AS scans 
                FROM " . $config['db']['pre'] . "restaurant_view 
                WHERE 
                    `restaurant_id` = {$restaurant['id']} 
                    AND `date` BETWEEN '$start' AND '$end'
                GROUP BY DATE(`date`)";

        $result = ORM::for_table($config['db']['pre'] . 'restaurant_view')
            ->raw_query($sql)
            ->find_many();

        foreach ($result as $data) {
            $scans[date('d M', strtotime($data['created']))] = $data['scans'];
        }

        $total_scans = ORM::for_table($config['db']['pre'].'restaurant_view')
            ->where('restaurant_id', $restaurant['id'])
            ->count();

        $total_menus = ORM::for_table($config['db']['pre'].'menu')
            ->where('user_id', $_SESSION['user']['id'])
            ->count();

        $ses_userdata = get_user_data($_SESSION['user']['username']);
        $currency = !empty($ses_userdata['currency']) ? $ses_userdata['currency'] : get_option('currency_code');

        $pending_orders = get_restaurant_option($restaurant['id'],'wallet_amount',0);
        $pending_orders = price_format($pending_orders, $currency);

        // get orders
        $pending_orders = ORM::for_table($config['db']['pre'] . 'orders')
            ->where(array(
                'restaurant_id' => $restaurant['id'],
                'status' => 'pending'
            ))
            ->count();
    }


    $page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/dashboard.tpl');
    $page->SetParameter ('OVERALL_HEADER', create_header($lang['DASHBOARD']));
    $page->SetParameter ('SCANS', json_encode(array_values($scans)));
    $page->SetParameter ('DAYS', json_encode(array_values($days)));
    $page->SetParameter ('PENDING_ORDERS', $pending_orders);
    $page->SetParameter ('TOTAL_SCANS', $total_scans);
    $page->SetParameter ('TOTAL_CATEGORIES', $total_categories);
    $page->SetParameter ('TOTAL_MENUS', $total_menus);
    $page->SetParameter ('OVERALL_FOOTER', create_footer());
    $page->CreatePageEcho();
}
else{
    headerRedirect($link['LOGIN']);
}