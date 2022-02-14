<!doctype html>
<html lang="{LANG_CODE}" dir="{LANGUAGE_DIRECTION}">
<head>
    <title>IF("{PAGE_TITLE}"!=""){ {PAGE_TITLE} - {:IF}{SITE_TITLE}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="HandheldFriendly" content="True">


    <meta name="author" content="{SITE_TITLE}">
    <meta name="keywords" content="{PAGE_META_KEYWORDS}">
    <meta name="description" content="{PAGE_META_DESCRIPTION}">

    <link rel="dns-prefetch" href="//fonts.googleapis.com">
    <link rel="dns-prefetch" href="//google.com">
    <link rel="dns-prefetch" href="//apis.google.com">
    <link rel="dns-prefetch" href="//ajax.googleapis.com">
    <link rel="dns-prefetch" href="//www.google-analytics.com">
    <link rel="dns-prefetch" href="//pagead2.googlesyndication.com">
    <link rel="dns-prefetch" href="//gstatic.com">
    <link rel="dns-prefetch" href="//oss.maxcdn.com">

    <!-- Favicon-->
    <link rel="shortcut icon" href="{SITE_URL}storage/logo/{SITE_FAVICON}">
    <!-- Bootstrap v4.3.1 CSS -->
    <link rel="stylesheet" href="{SITE_URL}includes/assets/bootstrap/css/bootstrap.min.css">

    <script async>
        var themecolor = '{THEME_COLOR}';
        var mapcolor = '{MAP_COLOR}';
        var siteurl = '{SITE_URL}';
        var template_name = '{TPL_NAME}';
        var ajaxurl = "{SITE_URL}php/{QUICKAD_USER_SECRET_FILE}.php";
    </script>
    <style>
        :root{{LOOP: COLORS}--theme-color-{COLORS.id}: {COLORS.value};{/LOOP: COLORS}}
    </style>

    <!-- Custom CSS -->
    <link rel="stylesheet" href="{SITE_URL}restaurant-templates/{RESTAURANT_TEMPLATE}/css/normalize.css">
    <link rel="stylesheet" href="{SITE_URL}restaurant-templates/{RESTAURANT_TEMPLATE}/css/theme.css?ver={VERSION}">
    <link rel="stylesheet" type="text/css" href="{SITE_URL}restaurant-templates/{RESTAURANT_TEMPLATE}/lib/node-waves/waves.css">
    <!--Icon CSS-->
    <link rel="stylesheet" href="{SITE_URL}includes/assets/css/icons.css">
    <script src="{SITE_URL}templates/{TPL_NAME}/js/jquery-3.4.1.min.js"></script>
</head>
<body class="default {LANGUAGE_DIRECTION}">
<!--[if lt IE 8]>
<p class="browserupgrade">
    You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.
</p>
<![endif]-->
<!-- Preloading -->
<div class="preloading">
    <div class="wrap-preload">
        <div class="cssload-loader"></div>
    </div>
</div>
<!-- .Preloading -->
<!-- Sidebar left -->
<nav id="sidebarleft" class="sidenav">
    <div class="sidebar-header">
        <img src="{SITE_URL}storage/restaurant/cover/{COVER_IMAGE}">
    </div>
    <div class="heading">
        <div class="title col-secondary font-weight-normal">{LANG_ALL_CATEGORIES}</div>
    </div>
    <ul class="list-unstyled components">
        {LOOP: CATEGORY}
        <li>
            <a href="#" data-catid="{CATEGORY.id}" class="menu-category"><i class="icon-material-outline-restaurant"></i> {CATEGORY.name}</a>
        </li>
        {/LOOP: CATEGORY}
    </ul>
</nav>
<!-- .Sidebar left -->

<!-- Header  -->
<nav class="navbar navbar-expand-lg navbar-light bg-header">
    <div class="container-fluid flex-nowrap">
        <button type="button" id="sidebarleftbutton" class="btn mr-4">
            <i class="icon-feather-menu"></i>
        </button>
        IF({SHOW_LANGS}){
        <div class="btn-group user-lang-switcher">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="filter-option">EN</span>
            </button>
            <div class="dropdown-menu">
                {LOOP: LANGS}
                    <a href="#" class="dropdown-item" data-lang="{LANGS.file_name}" data-code="{LANGS.code}">
                        {LANGS.name}
                    </a>
                {/LOOP: LANGS}
            </div>
        </div>
        {:IF}
    </div>
</nav>
<!-- .Header  -->
<!-- Content  -->
<div id="content">
    <!-- Content Wrap  -->
    <div class="content-wrap">
        <div class="single-page-header detail-header" data-background-image="{SITE_URL}storage/restaurant/cover/{COVER_IMAGE}">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="single-page-header-inner">
                            <div class="left-side">
                                <div class="header-image"><img src="{SITE_URL}storage/restaurant/logo/{MAIN_IMAGE}"></div>
                                <div class="header-details">
                                    <h3>{NAME}<span>{SUB_TITLE}</span></h3>
                                    <ul>
                                        IF('{TIMING}'!=""){ <li><i class="icon-feather-watch margin-right-5"></i> {TIMING}</li>{:IF}
                                        <li><i class="icon-feather-map margin-right-5"></i> <a target="_blank" href="https://www.google.com/maps/search/?api=1&amp;query={ADDRESS}">{ADDRESS}</a></li>
                                        IF('{PHONE}'!=''){ <li><i class="icon-feather-phone margin-right-5"></i> <a href="tel:{PHONE}">{PHONE}</a></li>{:IF}
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

                {LOOP: CAT_MENU}
                    {CAT_MENU.menu}
                {/LOOP: CAT_MENU}

    </div>
</div>
<!-- .Content  -->

<!-- Bottom Panel  -->
<div class="footer none" id="view-order-wrapper">
    <div class="clearfix"></div>
    <div class="order-footer">
        <div class="view-order">
            <div class="">
                <div class="item"><span id="view-order-quantity">1</span> {LANG_ITEMS}</div>
                <span class="price"><span id="view-order-price"></span></span>
            </div>
            <button class="order-btn" id="viewOrderBtn">{LANG_VIEW_ORDER} <i class="icon-material-outline-keyboard-arrow-right"></i></button>
        </div>
    </div>
</div>
<!-- Bottom Panel  -->

<!-- Customized Menu -->
<div id="viewOrder" class="sidenav bottom">
    <div class="sidebar-header bg-white">
        <div class="navbar-heading">
            <h4>{LANG_MY_ORDER}</h4>
        </div>
        <button type="button" id="dismiss" class="btn ml-auto">
            <i class="icon-feather-x"></i>
        </button>
    </div>
    <div class="your-order-content">
        <form type="post" data-id="{RESTRO_ID}" id="send-order-form">
        <div class="sidebar-wrapper">
            <div class="section">
                <div class="your-order-items"></div>
            </div>
            <div class="section3">
                <div class="total-price">
                    <div class="grand-total">
                        <span>{LANG_GRAND_TOTAL}</span><span class="float-right"><span class="your-order-price"></span></span>
                    </div>
                </div>
            </div>
            IF('{RESTAURANT_SEND_ORDER}'=="1"){
            <div class="section">
                <div class="col-text font-medium my-2">{LANG_ORDERING_TYPE}</div>
                <div class="form-group">
                    <div class="form-line">
                        <select name="ordering-type" id="ordering-type" class="form-control" required>
                            IF('{RESTAURANT_ON_TABLE_ORDER}'=="1"){
                            <option value="on-table">{LANG_ON_TABLE}</option>
                            {:IF}
                            IF('{RESTAURANT_TAKEAWAY_ORDER}'=="1"){
                            <option value="takeaway">{LANG_TAKEAWAY}</option>
                            {:IF}
                            IF('{RESTAURANT_DELIVERY_ORDER}'=="1"){
                            <option value="delivery">{LANG_DELIVERY}</option>
                            {:IF}
                        </select>
                    </div>
                </div>
            </div>
            IF('{RESTAURANT_ONLINE_PAYMENT}'=="1"){
            <div class="section py-0">
                <div class="col-text font-medium my-2">{LANG_PAY_VIA}</div>
                <div class="form-group">
                    <div class="form-line">
                        <select name="pay_via" id="pay_via" class="form-control" required>
                            <option value="pay_on_counter">{LANG_PAY_ON_COUNTER}</option>
                            <option value="pay_online">{LANG_PAY_ONLINE}</option>
                        </select>
                    </div>
                </div>
            </div>
            {ELSE}
            <input name="pay_via" id="pay_via" type="hidden" value="pay_on_counter">
            {:IF}
            <div class="section">
                <div class="col-text font-medium my-2">{LANG_ORDERING_FOR}</div>
                <div class="form-group">
                    <div class="form-line">
                        <input type="text" name="name" class="form-control" placeholder="{LANG_YOUR_NAME}" required>
                    </div>
                </div>
                <div class="form-group" id="table-number-field">
                    <div class="form-line">
                        <input type="number" name="table" class="form-control" placeholder="{LANG_TABLE_NUMBER}">
                    </div>
                </div>
                <div class="form-group" id="phone-number-field">
                    <div class="form-line">
                        <input type="number" name="phone-number" class="form-control" placeholder="{LANG_PHONE_NUMBER}">
                    </div>
                </div>
                <div class="form-group" id="address-field">
                    <div class="form-line">
                        <textarea class="form-control" name="address" placeholder="{LANG_ADDRESS}" rows="1"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-line">
                        <textarea class="form-control" name="message" placeholder="{LANG_MESSAGE}" rows="1"></textarea>
                    </div>
                </div>
            </div>
            {:IF}
        </div>
            IF('{RESTAURANT_SEND_ORDER}'=="1"){
        <!-- Bottom Panel  -->
        <div class="footer footer-extras">
            <div class="clearfix"></div>
            <div class="section">
                <small class="form-error"></small>
                <button type="submit" class="btn btn-primary btn-block" id="submit-order-button">{LANG_SEND_ORDER}</button>
            </div>
        </div>
        <!-- Bottom Panel  -->
            {:IF}
        </form>
    </div>
    <div class="order-success-message none">
        <i class="icon-feather-check qr-success-icon"></i>
        <h4>{LANG_SENT_SUCCESSFULLY}</h4>
    </div>
</div>
<!--Customized Menu-->

<!-- Customized Menu -->
<div id="menuCustomize" class="sidenav bottom">
    <div class="sidebar-header">
        <div class="navbar-heading">
            <h4></h4>
        </div>
        <button type="button" id="dismiss" class="btn ml-auto">
            <i class="icon-feather-x"></i>
        </button>
    </div>
    <div class="sidebar-wrapper">
        <div class="section">
            <p class="mb-0 customize-item-description"></p>
        </div>
        <div class="line-separate mt-0"></div>
        <div class="section">
            <div class="extras-heading">
                <div class="title">{LANG_EXTRAS}</div>
                <small>{LANG_SELECT_EXTRA_ITEMS}</small>
            </div>
            <div id="customize-extras">
            </div>
        </div>
    </div>
    <!-- Bottom Panel  -->
    <div class="footer footer-extras">
        <div class="clearfix"></div>
        <div class="section">
            <div class="row no-gutters">
                <div class="col-3 p-r-10">
                    <div class="add-menu">
                        <div class="add-btn add-item-btn">
                            <div class="wrapper h-100">
                                <div class="addition menu-order-quantity-decrease">
                                    <i class="icon-feather-minus"></i>
                                </div>
                                <div class="count">
                                    <span class="num" id="menu-order-quantity">1</span>
                                </div>
                                <div class="addition menu-order-quantity-increase">
                                    <i class="icon-feather-plus"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-9 p-l-10">
                    <button type="button" class="btn btn-primary btn-block" id="add-order-button">{LANG_ADD} <span id="order-price"></span></button>
                </div>
            </div>
        </div>
    </div>
    <!-- Bottom Panel  -->
</div>
<!--Customized Menu-->

<div class="overlay"></div>
<script>
    var TOTAL_MENUS = {TOTAL_MENUS};
    var CURRENCY_SIGN = '{CURRENCY_SIGN}';
    var CURRENCY_LEFT = {CURRENCY_LEFT};
    var CURRENCY_DECIMAL_PLACES = {CURRENCY_DECIMAL_PLACES};
    var CURRENCY_DECIMAL_SEPARATOR = '{CURRENCY_DECIMAL_SEPARATOR}';
    var CURRENCY_THOUSAND_SEPARATOR = '{CURRENCY_THOUSAND_SEPARATOR}';

    var session_uname = "{USERNAME}";
    var session_uid = "{USER_ID}";
    var session_img = "{USERPIC}";
    // Language Var
    var LANG_ERROR_TRY_AGAIN = "{LANG_ERROR_TRY_AGAIN}";
    var LANG_LOGGED_IN_SUCCESS = "{LANG_LOGGED_IN_SUCCESS}";
    var LANG_ERROR = "{LANG_ERROR}";
    var LANG_CANCEL = "{LANG_CANCEL}";
    var LANG_DELETED = "{LANG_DELETED}";
    var LANG_ARE_YOU_SURE = "{LANG_ARE_YOU_SURE}";
    var LANG_YOU_WANT_DELETE = "{LANG_YOU_WANT_DELETE}";
    var LANG_YES_DELETE = "{LANG_YES_DELETE}";
    var LANG_SHOW = "{LANG_SHOW}";
    var LANG_HIDE = "{LANG_HIDE}";
    var LANG_HIDDEN = "{LANG_HIDDEN}";

    var LANG_TYPE_A_MESSAGE = "{LANG_TYPE_A_MESSAGE}";
    var LANG_ADD_FILES_TEXT = "{LANG_ADD_FILES_TEXT}";
    var LANG_JUST_NOW = "{LANG_JUST_NOW}";
    var LANG_PREVIEW = "{LANG_PREVIEW}";
    var LANG_SEND = "{LANG_SEND}";
    var LANG_FILENAME = "{LANG_FILENAME}";
    var LANG_STATUS = "{LANG_STATUS}";
    var LANG_SIZE = "{LANG_SIZE}";
    var LANG_DRAG_FILES_HERE = "{LANG_DRAG_FILES_HERE}";
    var LANG_STOP_UPLOAD = "{LANG_STOP_UPLOAD}";
    var LANG_ADD_FILES = "{LANG_ADD_FILES}";

    var LANG_ADD = "{LANG_ADD}";
    var LANG_PAY_NOW = "{LANG_PAY_NOW}";
    var LANG_SEND_ORDER = "{LANG_SEND_ORDER}";
</script>
<!-- Optional JavaScript -->
<!--  Bootstrap v4.3.1 JS -->
<script src="{SITE_URL}includes/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="{SITE_URL}restaurant-templates/{RESTAURANT_TEMPLATE}/lib/node-waves/waves.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/jquery.cookie.min.js"></script>
<!--  Custom JS -->
<script src="{SITE_URL}restaurant-templates/{RESTAURANT_TEMPLATE}/js/theme.js?ver={VERSION}"></script>

</body>
</html>