{OVERALL_HEADER}

<!-- Dashboard Container -->
<div class="dashboard-container">

    <!-- Dashboard Sidebar
    ================================================== -->
    <div class="dashboard-sidebar">
        <div class="dashboard-sidebar-inner" data-simplebar>
            <div class="dashboard-nav-container">

                <!-- Responsive Navigation Trigger -->
                <a href="#" class="dashboard-responsive-nav-trigger">
					<span class="hamburger hamburger--collapse" >
						<span class="hamburger-box">
							<span class="hamburger-inner"></span>
						</span>
					</span>
                    <span class="trigger-title">{LANG_DASH_NAVIGATION}</span>
                </a>

                <!-- Navigation -->
                <div class="dashboard-nav">
                    <div class="dashboard-nav-inner">

                        <ul data-submenu-title="{LANG_MANAGEMENT}">
                            <li><a href="{LINK_DASHBOARD}"><i class="icon-feather-grid"></i> {LANG_DASHBOARD}</a></li>
                            <li><a href="{LINK_ADD_RESTAURANT}"><i class="icon-material-outline-restaurant"></i> {LANG_RESTAURANT}</a></li>
                            <li class="active"><a href="{LINK_MENU}"><i class="icon-feather-menu"></i> {LANG_MENU}</a></li>
                            <li><a href="{LINK_ORDER}"><i class="icon-feather-activity"></i> {LANG_ORDERS}</a></li>
                            <li><a href="{LINK_MEMBERSHIP}"><i class="icon-feather-gift"></i> {LANG_MEMBERSHIP}</a></li>
                            <li><a href="{LINK_QRBUILDER}"><i class="icon-material-outline-dashboard"></i> {LANG_QRBUILDER}</a></li>
                            IF("{QUICKORDER_ENABLE}" == "1"){
                            <li><a href="{LINK_WHATSAPP_ORDERING}"><i class="fa fa-whatsapp padding-right-25"></i> {LANG_WHATSAPP_ORDERING}</a></li>
                            {:IF}
                        </ul>

                        <ul data-submenu-title="{LANG_ACCOUNT}">
                            <li><a href="{LINK_TRANSACTION}"><i class="icon-material-outline-description"></i> {LANG_TRANSACTIONS}</a></li>
                            <li><a href="{LINK_ACCOUNT_SETTING}"><i class="icon-material-outline-settings"></i> {LANG_ACCOUNT_SETTING}</a></li>
                            <li><a href="{LINK_LOGOUT}"><i class="icon-material-outline-power-settings-new"></i> {LANG_LOGOUT}</a></li>
                        </ul>

                    </div>
                </div>
                <!-- Navigation / End -->

            </div>
        </div>
    </div>
    <!-- Dashboard Sidebar / End -->

    <!-- Dashboard Content
            ================================================== -->
    <div class="dashboard-content-container" data-simplebar>
        <div class="dashboard-content-inner" >
            <div class="notification notice margin-bottom-30">{LANG_RESTAURANT_THEME_IMAGES_ONLY}</div>

            <!-- Dashboard Headline -->
            <div class="dashboard-headline">
                <h3>{LANG_MANAGE_MENU}</h3>
                <div class="headline-right">
                    <a href="#" class="button ripple-effect button-sliding-icon margin-left-auto add-image-menu">{LANG_ADD_MENU}<i class="icon-feather-plus"></i></a>
                </div>
            </div>

            <div id="image-menu-items">
                {LOOP: IMAGE_MENU}
                    <div class="dashboard-box margin-top-0 margin-bottom-15" data-menuid="{IMAGE_MENU.id}">
                        <div class="headline">
                            <h3><i class="icon-feather-menu quickad-js-handle"></i><img class="menu-avatar" src="{SITE_URL}storage/menu/{IMAGE_MENU.image}" alt="{IMAGE_MENU.name}"> {IMAGE_MENU.name}</h3>
                            <div class="margin-left-auto">
                                <a href="javascript:void(0);" data-id="{IMAGE_MENU.id}" class="button ripple-effect btn-sm edit_image_menu_item" title="{LANG_EDIT_MENU}" data-tippy-placement="top"><i class="icon-feather-edit"></i></a>
                                <a href="javascript:void(0);" data-id="{IMAGE_MENU.id}" class="popup-with-zoom-anim button red ripple-effect btn-sm delete_image_menu" title="{LANG_DELETE_MENU}" data-tippy-placement="top"><i class="icon-feather-trash-2"></i></a>
                            </div>
                        </div>
                    </div>
                {/LOOP: IMAGE_MENU}
            </div>
            <!-- Row / End -->

            <!-- Footer -->
            <div class="dashboard-footer-spacer"></div>
            <div class="small-footer margin-top-15">
                <div class="small-footer-copyrights">
                    {COPYRIGHT_TEXT}
                </div>
                <ul class="footer-social-links">
                    IF('{FACEBOOK_LINK}'!=""){
                    <li>
                        <a href="{FACEBOOK_LINK}" target="_blank" rel="nofollow">
                            <i class="fa fa-facebook"></i>
                        </a>
                    </li>
                    {:IF}
                    IF('{TWITTER_LINK}'!=""){
                    <li>
                        <a href="{TWITTER_LINK}" target="_blank" rel="nofollow">
                            <i class="fa fa-twitter"></i>
                        </a>
                    </li>
                    {:IF}
                    IF('{INSTAGRAM_LINK}'!=""){
                    <li>
                        <a href="{INSTAGRAM_LINK}" target="_blank" rel="nofollow">
                            <i class="fa fa-instagram"></i>
                        </a>
                    </li>
                    {:IF}
                    IF('{LINKEDIN_LINK}'!=""){
                    <li>
                        <a href="{LINKEDIN_LINK}" target="_blank" rel="nofollow">
                            <i class="fa fa-linkedin"></i>
                        </a>
                    </li>
                    {:IF}
                    IF('{PINTEREST_LINK}'!=""){
                    <li>
                        <a href="{PINTEREST_LINK}" target="_blank" rel="nofollow">
                            <i class="fa fa-pinterest-p"></i>
                        </a>
                    </li>
                    {:IF}
                    IF('{YOUTUBE_LINK}'!=""){
                    <li>
                        <a href="{YOUTUBE_LINK}" target="_blank" rel="nofollow">
                            <i class="fa fa-youtube-play"></i>
                        </a>
                    </li>
                    {:IF}
                </ul>
                <div class="clearfix"></div>
            </div>
            <!-- Footer / End -->


        </div>
    </div>
    <!-- Dashboard Content / End -->

</div>
<!-- Dashboard Container / End -->

</div>
<!-- Wrapper / End -->

<!-- Add Item Popup / End -->
<div id="add_menu_item_dialog" class="zoom-anim-dialog mfp-hide dialog-with-tabs">
    <!--Tabs -->
    <div class="sign-in-form">
        <ul class="popup-tabs-nav">
            <li><a>{LANG_ADD_NEW_ITEM}</a></li>
        </ul>
        <div class="popup-tabs-container">
            <form id="add-item-form" method="post" action="#" enctype="multipart/form-data">
                <!-- Tab -->
                <div class="popup-tab-content">
                    <div id="add-item-status" class="notification error" style="display:none"></div>
                    <div class="submit-field">
                        <input name="title" type="text" class="with-border" id="menu-item-name" placeholder="{LANG_ITEM_TITLE}">
                    </div>
                    <div class="submit-field">
                        <h5>{LANG_ITEM_IMAGE}</h5>
                        <div class="input-file">
                            <img src="{SITE_URL}storage/menu/default.png" id="menu-item-image" alt="">
                        </div>
                        <div class="uploadButton margin-top-30">
                            <input class="uploadButton-input" type="file" accept="image/*"  onchange="readImageURL(this,'menu-item-image')" id="image_upload" name="main_image"/>
                            <label class="uploadButton-button ripple-effect" for="image_upload">{LANG_UPLOAD_IMAGE}</label>
                        </div>
                    </div>
                    <div class="submit-field">
                        <label class="switch padding-left-40">
                            <input name="active" id="menu-item-available" value="1" type="checkbox" checked>
                            <span class="switch-button"></span> {LANG_AVAILABLE}
                        </label>
                    </div>
                    <input name="id" id="menu-id" value="" type="hidden"/>
                    <!-- Button -->
                    <button id="add-item-button" class="margin-top-15 button button-sliding-icon ripple-effect" type="submit">{LANG_SAVE} <i class="icon-material-outline-arrow-right-alt"></i></button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Add Item Popup / End -->

<script>
    var session_uname = "{USERNAME}";
    var session_uid = "{USER_ID}";
    var SITE_URL = "{SITE_URL}";
    // Language Var
    var LANG_ERROR_TRY_AGAIN = "{LANG_ERROR_TRY_AGAIN}";
    var LANG_LOGGED_IN_SUCCESS = "{LANG_LOGGED_IN_SUCCESS}";
    var LANG_ERROR = "{LANG_ERROR}";
    var LANG_CANCEL = "{LANG_CANCEL}";
    var LANG_DELETED = "{LANG_DELETED}";
    var LANG_ARE_YOU_SURE = "{LANG_ARE_YOU_SURE}";
    var LANG_YES_DELETE = "{LANG_YES_DELETE}";
    var LANG_SHOW = "{LANG_SHOW}";
    var LANG_HIDE = "{LANG_HIDE}";
    var LANG_HIDDEN = "{LANG_HIDDEN}";
    var LANG_TYPE_A_MESSAGE = "{LANG_TYPE_A_MESSAGE}";
    var LANG_JUST_NOW = "{LANG_JUST_NOW}";
    var LANG_PREVIEW = "{LANG_PREVIEW}";
    var LANG_SEND = "{LANG_SEND}";
    var LANG_STATUS = "{LANG_STATUS}";
    var LANG_SIZE = "{LANG_SIZE}";
    var LANG_NO_MSG_FOUND = "{LANG_NO_MSG_FOUND}";
    var LANG_ONLINE = "{LANG_ONLINE}";
    var LANG_OFFLINE = "{LANG_OFFLINE}";
    var LANG_GOT_MESSAGE = "{LANG_GOT_MESSAGE}";
</script>

<script src="{SITE_URL}templates/{TPL_NAME}/js/chosen.min.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/jquery.lazyload.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/tippy.all.min.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/simplebar.min.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/bootstrap-slider.min.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/bootstrap-select.min.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/snackbar.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/counterup.min.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/magnific-popup.min.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/slick.min.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/jquery.cookie.min.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/user-ajax.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/custom.js?ver={VERSION}"></script>

<script src="{SITE_URL}templates/{TPL_NAME}/js/jquery-ui.min.js"></script>

<script>
    /* THIS PORTION OF CODE IS ONLY EXECUTED WHEN THE USER THE LANGUAGE(CLIENT-SIDE) */
    $(function () {
        $('.language-switcher').on('click', '.dropdown-menu li', function (e) {
            e.preventDefault();
            var lang = $(this).data('lang');
            if (lang != null) {
                var res = lang.substr(0, 2);
                $('#selected_lang').html(res);
                $.cookie('Quick_lang', lang,{ path: '/' });
                location.reload();
            }
        });
    });
    $(document).ready(function () {
        var lang = $.cookie('Quick_lang');
        if (lang != null) {
            var res = lang.substr(0, 2);
            $('#selected_lang').html(res);
        }
    });
</script>
<script>
    $(document).ready(function () {
        $("#header-container").addClass('dashboard-header not-sticky');
    });

    $(document).on('click', ".edit_image_menu_item" ,function(e){
        e.preventDefault();
        var id = $(this).data('id'),
            $this = $(this);

        $this.addClass('button-progress').prop('disabled', true);
        $.ajax({
            type: "POST",
            url: ajaxurl+'?action=get_image_menu&id='+id,
            dataType: 'json',
            success: function (response) {
                if(response.success) {
                    $('#menu-id').val(id);
                    $('#menu-item-name').val(response.name);
                    $('#menu-item-image').attr('src', response.image);
                    $('#menu-item-available').prop('checked',response.active == 1);

                    $.magnificPopup.open({
                        items: {
                            src: '#add_menu_item_dialog',
                            type: 'inline',
                            fixedContentPos: false,
                            fixedBgPos: true,
                            overflowY: 'auto',
                            closeBtnInside: true,
                            preloader: false,
                            midClick: true,
                            removalDelay: 300,
                            mainClass: 'my-mfp-zoom-in'
                        }
                    });
                }
                $this.removeClass('button-progress').prop('disabled', false);
            }
        });
    });

    $(document).on('click', ".add-image-menu" ,function(e){
        e.stopPropagation();
        e.preventDefault();

        $('#menu-id').val('');
        $('#menu-item-name').val('');
        $('#menu-item-image').attr('src', SITE_URL+'storage/restaurant/logo/default.png');
        $('#menu-item-available').prop('checked', true);

        $.magnificPopup.open({
            items: {
                src: '#add_menu_item_dialog',
                type: 'inline',
                fixedContentPos: false,
                fixedBgPos: true,
                overflowY: 'auto',
                closeBtnInside: true,
                preloader: false,
                midClick: true,
                removalDelay: 300,
                mainClass: 'my-mfp-zoom-in'
            }
        });
    });

    $(document).on('click', ".delete_image_menu" ,function(e){
        e.preventDefault();
        var id = $(this).data('id'),
            $this = $(this);

        if(confirm(LANG_ARE_YOU_SURE)) {
            $this.addClass('button-progress').prop('disabled', true);
            $.ajax({
                type: "POST",
                url: ajaxurl + '?action=delete_image_menu&id=' + id,
                dataType: 'json',
                success: function (response) {
                    if (response.success) {
                        $this.closest('.col-lg-4').remove();
                    }
                    Snackbar.show({
                        text: response.message,
                        pos: 'bottom-center',
                        showAction: false,
                        actionText: "Dismiss",
                        duration: 3000,
                        textColor: '#fff',
                        backgroundColor: '#383838'
                    });
                }
            });
        }
    });

    $("#add-item-form").on('submit',function (e) {
        e.preventDefault();
        var data = new FormData(this);
        var action = 'add_image_item';

        $('#add-item-button').addClass('button-progress').prop('disabled', true);
        $.ajax({
            type: "POST",
            url: ajaxurl+'?action='+action,
            data: data,
            cache:false,
            contentType: false,
            processData: false,
            dataType: 'json',
            success: function (response) {
                if(response.success){
                    $("#add-item-status").addClass('success').removeClass('error').html('<p>'+response.message+'</p>').slideDown();
                    location.reload();
                }
                else {
                    $("#add-item-status").removeClass('success').addClass('error').html('<p>'+response.message+'</p>').slideDown();
                }
                $('#add-item-button').removeClass('button-progress').prop('disabled', false);
            }
        });
        return false;
    });

    var $menus = $('#image-menu-items');
    $menus.sortable({
        //helper : fixHelper,
        axis   : 'y',
        handle : '.quickad-js-handle',
        update : function( event, ui ) {
            var data = [];
            $menus.children('div').each(function() {
                data.push($(this).data('menuid'));
            });
            $.ajax({
                type : 'POST',
                url  : ajaxurl,
                dataType: 'json',
                data : { action: 'updateImageMenuPosition', position: data },
                success: function (response, textStatus, jqXHR) {
                    Snackbar.show({
                        text: response.message,
                        pos: 'bottom-center',
                        showAction: false,
                        actionText: "Dismiss",
                        duration: 3000,
                        textColor: '#fff',
                        backgroundColor: '#383838'
                    });
                }
            });
        }
    });
</script>
</body>
</html>