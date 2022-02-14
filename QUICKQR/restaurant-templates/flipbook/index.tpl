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
    <link rel="stylesheet" href="{SITE_URL}restaurant-templates/{RESTAURANT_TEMPLATE}/css/style.css?ver={VERSION}">

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
<div class="flipbook-loader">
    <div class="flipbook-loader-container">
        <div class="flipbook-svg-wrapper">
            <svg class="icon flipbook-svg1"
                 viewBox="130 0 800 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2478"
                 xmlns:xlink="http://www.w3.org/1999/xlink" width="49" height="56">
                <defs>
                    <style type="text/css"></style>
                </defs>
                <path d="M835.55027 48.761905C876.805122 48.761905 910.222223 81.441158 910.222223 121.753604L910.222223 902.095C910.222223 902.095 910.222223 942.409011 876.805 975.238095L113.777778 975.238095 113.777778 24.380952 88.888889 48.761905 835.55027 48.761905ZM64 0 64 24.380952 64 1024L960 1024C835.55027 1024 904.277615 1024 960 969.325498L960 54.49204C960 54.49204 904.277615 0 835.55027 0L88.888889 0 64 0Z"
                      p-id="2479"></path>
                <path d="M775.164361 219.428572C788.910114 219.428572 800.05325 208.512847 800.05325 195.047619 800.05325 181.582391 788.910114 170.666667 775.164361 170.666667L263.111111 170.666667C249.365357 170.666667 238.222222 181.582391 238.222222 195.047619 238.222222 208.512847 249.365357 219.428572 263.111111 219.428572L775.164361 219.428572Z"
                      p-id="2481"></path>
                <path d="M775.164361 365.714285C788.910114 365.714285 800.05325 354.798562 800.05325 341.333333 800.05325 327.868105 788.910114 316.952382 775.164361 316.952382L263.111111 316.952382C249.365357 316.952382 238.222222 327.868105 238.222222 341.333333 238.222222 354.798562 249.365357 365.714285 263.111111 365.714285L775.164361 365.714285Z"
                      p-id="2482"></path>
                <path d="M775.164361 536.380951C788.910114 536.380951 800.05325 525.465229 800.05325 512 800.05325 498.534771 788.910114 487.619049 775.164361 487.619049L263.111111 487.619049C249.365357 487.619049 238.222222 498.534771 238.222222 512 238.222222 525.465229 249.365357 536.380951 263.111111 536.380951L775.164361 536.380951Z"
                      p-id="2483"></path>
            </svg>
            <svg class="icon flipbook-svg2"
                 viewBox="130 0 800 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2478"
                 xmlns:xlink="http://www.w3.org/1999/xlink" width="49" height="56">
                <defs>
                    <style type="text/css"></style>
                </defs>
                <path d="M835.55027 48.761905C876.805122 48.761905 910.222223 81.441158 910.222223 121.753604L910.222223 902.095C910.222223 902.095 910.222223 942.409011 876.805 975.238095L113.777778 975.238095 113.777778 24.380952 88.888889 48.761905 835.55027 48.761905ZM64 0 64 24.380952 64 1024L960 1024C835.55027 1024 904.277615 1024 960 969.325498L960 54.49204C960 54.49204 904.277615 0 835.55027 0L88.888889 0 64 0Z"
                      p-id="2479"></path>
                <path d="M775.164361 219.428572C788.910114 219.428572 800.05325 208.512847 800.05325 195.047619 800.05325 181.582391 788.910114 170.666667 775.164361 170.666667L263.111111 170.666667C249.365357 170.666667 238.222222 181.582391 238.222222 195.047619 238.222222 208.512847 249.365357 219.428572 263.111111 219.428572L775.164361 219.428572Z"
                      p-id="2481"></path>
                <path d="M775.164361 365.714285C788.910114 365.714285 800.05325 354.798562 800.05325 341.333333 800.05325 327.868105 788.910114 316.952382 775.164361 316.952382L263.111111 316.952382C249.365357 316.952382 238.222222 327.868105 238.222222 341.333333 238.222222 354.798562 249.365357 365.714285 263.111111 365.714285L775.164361 365.714285Z"
                      p-id="2482"></path>
                <path d="M775.164361 536.380951C788.910114 536.380951 800.05325 525.465229 800.05325 512 800.05325 498.534771 788.910114 487.619049 775.164361 487.619049L263.111111 487.619049C249.365357 487.619049 238.222222 498.534771 238.222222 512 238.222222 525.465229 249.365357 536.380951 263.111111 536.380951L775.164361 536.380951Z"
                      p-id="2483"></path>
            </svg>
            <svg class="loadingRun flipbook-svg3"
                 viewBox="130 0 800 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2478"
                 xmlns:xlink="http://www.w3.org/1999/xlink" width="49" height="56">
                <defs>
                    <style type="text/css"></style>
                </defs>
                <path d="M835.55027 48.761905C876.805122 48.761905 910.222223 81.441158 910.222223 121.753604L910.222223 902.095C910.222223 902.095 910.222223 942.409011 876.805 975.238095L113.777778 975.238095 113.777778 24.380952 88.888889 48.761905 835.55027 48.761905ZM64 0 64 24.380952 64 1024L960 1024C835.55027 1024 904.277615 1024 960 969.325498L960 54.49204C960 54.49204 904.277615 0 835.55027 0L88.888889 0 64 0Z"
                      p-id="2479"></path>
                <path d="M775.164361 219.428572C788.910114 219.428572 800.05325 208.512847 800.05325 195.047619 800.05325 181.582391 788.910114 170.666667 775.164361 170.666667L263.111111 170.666667C249.365357 170.666667 238.222222 181.582391 238.222222 195.047619 238.222222 208.512847 249.365357 219.428572 263.111111 219.428572L775.164361 219.428572Z"
                      p-id="2481"></path>
                <path d="M775.164361 365.714285C788.910114 365.714285 800.05325 354.798562 800.05325 341.333333 800.05325 327.868105 788.910114 316.952382 775.164361 316.952382L263.111111 316.952382C249.365357 316.952382 238.222222 327.868105 238.222222 341.333333 238.222222 354.798562 249.365357 365.714285 263.111111 365.714285L775.164361 365.714285Z"
                      p-id="2482"></path>
                <path d="M775.164361 536.380951C788.910114 536.380951 800.05325 525.465229 800.05325 512 800.05325 498.534771 788.910114 487.619049 775.164361 487.619049L263.111111 487.619049C249.365357 487.619049 238.222222 498.534771 238.222222 512 238.222222 525.465229 249.365357 536.380951 263.111111 536.380951L775.164361 536.380951Z"
                      p-id="2483"></path>
            </svg>
        </div>
    </div>
</div>

<div class="single-page-header detail-header" data-background-image="{SITE_URL}storage/restaurant/cover/{COVER_IMAGE}">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="single-page-header-inner">
                    <div class="left-side">
                        <div class="header-image"><img src="{SITE_URL}storage/restaurant/logo/{MAIN_IMAGE}"></div>
                        <div class="header-details">
                            <h3>{NAME}<span>{SUB_TITLE}</span></h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="wrapper shadow">
    <div class="aspect">
        <div class="aspect-inner">
            <div class="flipbook" id="flipbook">
                {LOOP: IMAGE_MENU}
                <div class="page"><img src="{SITE_URL}storage/menu/{IMAGE_MENU.image}" draggable="false" alt="{IMAGE_MENU.name}" /></div>
                {/LOOP: IMAGE_MENU}
            </div>
            </div>
    </div>
</div>
<script>
    var LANG_THIS_FIRST_PAGE = '{LANG_THIS_FIRST_PAGE}';
    var LANG_THIS_LAST_PAGE = '{LANG_THIS_LAST_PAGE}';
</script>
<script src="{SITE_URL}restaurant-templates/{RESTAURANT_TEMPLATE}/js/jquery.mobile.min.js"></script>
<script src="{SITE_URL}restaurant-templates/{RESTAURANT_TEMPLATE}/js/turn.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/snackbar.js?ver={VERSION}"></script>
<script src="{SITE_URL}restaurant-templates/{RESTAURANT_TEMPLATE}/js/script.js"></script>

</body>
</html>