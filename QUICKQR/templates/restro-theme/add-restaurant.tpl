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
                            <li class="active"><a href="{LINK_ADD_RESTAURANT}"><i class="icon-material-outline-restaurant"></i> {LANG_RESTAURANT}</a></li>
                            <li><a href="{LINK_MENU}"><i class="icon-feather-menu"></i> {LANG_MENU}</a></li>
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

            <!-- Dashboard Headline -->
            <div class="dashboard-headline">
                <h3>{LANG_MANAGE_RESTAURANT}</h3>
            </div>

            <!-- Row -->
            <div class="row">
                <form name="restaurent_form" method="post" action="#" enctype="multipart/form-data">
                    <!-- Dashboard Box -->
                    <div class="col-xl-12">
                        <div class="dashboard-box margin-top-0">
                            <!-- Headline -->
                            <div class="headline">
                                <h3><i class="icon-feather-folder-plus"></i>{LANG_RESTAURANT_INFO}</h3>
                                <a href="{RESTRO_LINK}" class="button dark ripple-effect button-sliding-icon margin-left-auto live-preview-button">{LANG_LIVE_PREVIEW}<i class="icon-feather-arrow-right"></i></a>
                            </div>
                            {LOOP: ERRORS}
                                <div class="notification error"><p>! {ERRORS.message}</p></div>
                            {/LOOP: ERRORS}
                            <div class="content with-padding padding-bottom-10">
                                <div class="row">

                                    <div class="col-xl-12">
                                        <div class="submit-field">
                                            <h5>{LANG_RESTAURANT_NAME}</h5>
                                            <input type="text" class="with-border" name="name" value="{NAME}">
                                        </div>
                                    </div>
                                    <div class="col-xl-12">
                                        <div class="submit-field">
                                            <h5>{LANG_STORE_SLUG}</h5>
                                            <input type="text" id="store-slug" class="with-border" name="slug" value="{SLUG}" onBlur="checkAvailabilityStoreSlug()">
                                            <div id="slug-availability-status"></div>
                                            <small>{LANG_STORE_SLUG_HINT}</small>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="submit-field">
                                            <h5>{LANG_RESTAURANT_SUBTITLE}</h5>
                                            <input type="text" class="with-border" name="sub_title" value="{SUB_TITLE}">
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="submit-field">
                                            <h5>{LANG_RESTAURANT_TIMING}</h5>
                                            <input type="text" class="with-border" name="timing" value="{TIMING}">
                                        </div>
                                    </div>
                                    <div class="col-xl-12">
                                        <div class="submit-field">
                                            <h5>{LANG_RESTAURANT_DESC}</h5>
                                            <textarea class="with-border text-editor" name="description">{DESCRIPTION}</textarea>
                                        </div>
                                    </div>
                                    <div class="col-xl-12">
                                        <div class="submit-field">
                                            <h5>{LANG_RESTAURANT_LOCATION}</h5>
                                            <input class="with-border" type="text" placeholder="{LANG_ADDRESS}" name="address" id="address-autocomplete" value="{ADDRESS}">
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="submit-field">
                                            <h5>{LANG_RESTAURANT_IMAGE}<i class="help-icon" data-tippy-placement="right" title="{LANG_RESTAURANT_IMAGE}"></i></h5>
                                            <div class="input-file">
                                                <img src="{SITE_URL}storage/restaurant/logo/{MAIN_IMAGE}" id="restro_image">
                                            </div>

                                            <div class="uploadButton margin-top-30">
                                                <input class="uploadButton-input" type="file" accept="image/*"  onchange="readImageURL(this,'restro_image')" id="image_upload" name="main_image"/>
                                                <label class="uploadButton-button ripple-effect" for="image_upload">{LANG_UPLOAD_RESTAURANT_IMAGE}</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="submit-field">
                                            <h5>{LANG_RESTAURANT_COVER_IMAGE}<i class="help-icon" data-tippy-placement="right" title="{LANG_RESTAURANT_COVER_IMAGE}"></i></h5>
                                            <div class="input-file">
                                                <img src="{SITE_URL}storage/restaurant/cover/{COVER_IMAGE}" id="restro_cover_image">
                                            </div>
                                            <div class="uploadButton margin-top-30">
                                                <input class="uploadButton-input" type="file" accept="image/*" onchange="readImageURL(this,'restro_cover_image')" id="cover_upload" name="cover_image"/>
                                                <label class="uploadButton-button ripple-effect" for="cover_upload">{LANG_UPLOAD_COVER_IMAGE}</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-12">
                                        <div class="submit-field">
                                            <h5>{LANG_RESTAURANT_TEMPLATE}</h5>
                                            <div class="account-type row template-chooser">
                                                {LOOP: RESTAURANT_TEMPLATES}
                                                <div class="col-md-3 margin-right-0">
                                                    <input type="radio" name="restaurant_template" value="{RESTAURANT_TEMPLATES.folder}" id="{RESTAURANT_TEMPLATES.folder}" class="account-type-radio" IF("{RESTAURANT_TEMPLATE}" == "{RESTAURANT_TEMPLATES.folder}"){ checked {:IF}>
                                                    <label for="{RESTAURANT_TEMPLATES.folder}" class="ripple-effect-dark">
                                                        <img class="margin-bottom-5" src="{SITE_URL}/restaurant-templates/{RESTAURANT_TEMPLATES.folder}/screenshot.png">
                                                        <strong>{RESTAURANT_TEMPLATES.name} IF("flipbook" == "{RESTAURANT_TEMPLATES.folder}"){ <i class="icon-feather-image" data-tippy-placement="top" title="{LANG_TEMPLATE_IMAGES_ONLY}"></i>{:IF}</strong>
                                                    </label>
                                                </div>
                                                {/LOOP: RESTAURANT_TEMPLATES}
                                            </div>
                                        </div>
                                    </div>

                                    IF("{ALLOW_ORDERING}" == "1"){

                                    <div class="col-xl-12">
                                        <div class="submit-field">
                                            <h5>{LANG_ALLOW_ON_TABLE_ORDER}</h5>
                                            <select class="selectpicker with-border" name="restaurant_on_table_order">
                                                <option value="1" IF("{RESTAURANT_ON_TABLE_ORDER}" == "1"){ selected {:IF}>{LANG_YES}</option>
                                                <option value="0" IF("{RESTAURANT_ON_TABLE_ORDER}" == "0"){ selected {:IF}>{LANG_NO}</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xl-12">
                                        <div class="submit-field">
                                            <h5>{LANG_ALLOW_TAKEAWAY_ORDER}</h5>
                                            <select class="selectpicker with-border" name="restaurant_takeaway_order">
                                                <option value="1" IF("{RESTAURANT_TAKEAWAY_ORDER}" == "1"){ selected {:IF}>{LANG_YES}</option>
                                                <option value="0" IF("{RESTAURANT_TAKEAWAY_ORDER}" == "0"){ selected {:IF}>{LANG_NO}</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xl-12">
                                        <div class="submit-field">
                                            <h5>{LANG_ALLOW_DELIVERY_ORDER}</h5>
                                            <select class="selectpicker with-border" name="restaurant_delivery_order">
                                                <option value="1" IF("{RESTAURANT_DELIVERY_ORDER}" == "1"){ selected {:IF}>{LANG_YES}</option>
                                                <option value="0" IF("{RESTAURANT_DELIVERY_ORDER}" == "0"){ selected {:IF}>{LANG_NO}</option>
                                            </select>
                                        </div>
                                    </div>
                                    IF("{ADMIN_ALLOW_ONLINE_PAYMENT}" == "1"){
                                    <div class="col-xl-12">
                                        <div class="submit-field">
                                            <h5>{LANG_ALLOW_ONLINE_PAYMENT}</h5>
                                            <select class="selectpicker with-border" name="restaurant_online_payment">
                                                <option value="1" IF("{RESTAURANT_ONLINE_PAYMENT}" == "1"){ selected {:IF}>{LANG_YES}</option>
                                                <option value="0" IF("{RESTAURANT_ONLINE_PAYMENT}" == "0"){ selected {:IF}>{LANG_NO}</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xl-12 js-accordion">
                                        <div class="dashboard-box margin-top-0 margin-bottom-15 js-accordion-item">
                                            <!-- Headline -->
                                            <div class="headline js-accordion-header">
                                                <h3>{LANG_PAYPAL}</h3>
                                            </div>
                                            <div class="content with-padding padding-bottom-10 js-accordion-body" style="display: none">
                                                <div class="submit-field">
                                                    <h4>{LANG_INTEGRATION_STEPS}</h4>
                                                    <ol>
                                                        <li>{LANG_PAYPAL_INTEGRATION_1}</li>
                                                        <li>{LANG_PAYPAL_INTEGRATION_2}</li>
                                                        <li>{LANG_PAYPAL_INTEGRATION_3}</li>
                                                        <li>{LANG_PAYPAL_INTEGRATION_4}</li>
                                                        <li>{LANG_PAYPAL_INTEGRATION_5}</li>
                                                    </ol>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_TURN_ON_OFF}</label>
                                                    <div class="col-sm-6">
                                                        <select name="restaurant_paypal_install" id="restaurant_paypal_install" class="selectpicker with-border">
                                                            <option value="1" IF("{RESTAURANT_PAYPAL_INSTALL}" == "1"){ selected {:IF}>{LANG_ON}</option>
                                                            <option value="0" IF("{RESTAURANT_PAYPAL_INSTALL}" == "0"){ selected {:IF}>{LANG_OFF}</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_TITLE}</label>
                                                    <div class="col-sm-6">
                                                        <input name="restaurant_paypal_title" type="text" class="with-border" value="{RESTAURANT_PAYPAL_TITLE}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_LIVE_MODE_SANDBOX_MODE}</label>
                                                    <div class="col-sm-6">
                                                        <select name="restaurant_paypal_sandbox_mode" class="selectpicker with-border">
                                                            <option value="Yes" IF("{RESTAURANT_PAYPAL_SANDBOX_MODE}" == "Yes"){ selected {:IF}>{LANG_SANDBOX_MODE}</option>
                                                            <option value="No" IF("{RESTAURANT_PAYPAL_SANDBOX_MODE}" == "No"){ selected {:IF}>{LANG_LIVE_MODE}</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_PAYPAL_API_CLIENT_ID}</label>
                                                    <div class="col-sm-6">
                                                        <input name="restaurant_paypal_api_client_id" type="text" class="with-border" value="{RESTAURANT_PAYPAL_API_CLIENT_ID}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_PAYPAL_API_SECRET}</label>
                                                    <div class="col-sm-6">
                                                        <input name="restaurant_paypal_api_secret" type="text" class="with-border" value="{RESTAURANT_PAYPAL_API_SECRET}">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dashboard-box margin-top-0 margin-bottom-15 js-accordion-item">
                                            <!-- Headline -->
                                            <div class="headline js-accordion-header">
                                                <h3>{LANG_STRIPE}</h3>
                                            </div>
                                            <div class="content with-padding padding-bottom-10 js-accordion-body" style="display: none">
                                                <div class="submit-field">
                                                    <h4>{LANG_INTEGRATION_STEPS}</h4>
                                                    <ol>
                                                        <li>{LANG_STRIPE_INTEGRATION_1}</li>
                                                        <li>{LANG_STRIPE_INTEGRATION_2}</li>
                                                        <li>{LANG_STRIPE_INTEGRATION_3}</li>
                                                        <li>{LANG_STRIPE_INTEGRATION_4}</li>
                                                        <li>{LANG_STRIPE_INTEGRATION_5}</li>
                                                        <li>{LANG_STRIPE_INTEGRATION_6}</li>
                                                        <li>{LANG_STRIPE_INTEGRATION_7} <strong>{SITE_URL}webhook/stripe?restaurant={RESTRO_ID}</strong></li>
                                                        <li>{LANG_STRIPE_INTEGRATION_8}</li>
                                                        <li>{LANG_STRIPE_INTEGRATION_9}</li>
                                                        <li>{LANG_STRIPE_INTEGRATION_10}</li>
                                                    </ol>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_TURN_ON_OFF}</label>
                                                    <div class="col-sm-6">
                                                        <select name="restaurant_stripe_install" id="restaurant_stripe_install" class="selectpicker with-border">
                                                            <option value="1" IF("{RESTAURANT_STRIPE_INSTALL}" == "1"){ selected {:IF}>{LANG_ON}</option>
                                                            <option value="0" IF("{RESTAURANT_STRIPE_INSTALL}" == "0"){ selected {:IF}>{LANG_OFF}</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_TITLE}</label>
                                                    <div class="col-sm-6">
                                                        <input name="restaurant_stripe_title" type="text" class="with-border" value="{RESTAURANT_STRIPE_TITLE}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_STRIPE_PUBLISHABLE_KEY}</label>
                                                    <div class="col-sm-6">
                                                        <input name="restaurant_stripe_publishable_key" type="text" class="with-border" value="{RESTAURANT_STRIPE_PUBLISHABLE_KEY}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_STRIPE_SECRET_KEY}</label>
                                                    <div class="col-sm-6">
                                                        <input name="restaurant_stripe_secret_key" type="text" class="with-border" value="{RESTAURANT_STRIPE_SECRET_KEY}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_STRIPE_WEBHOOK_SECRET}</label>
                                                    <div class="col-sm-6">
                                                        <input name="restaurant_stripe_webhook_secret" type="text" class="with-border" value="{RESTAURANT_STRIPE_WEBHOOK_SECRET}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_STRIPE_WEBHOOK_URL}</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" class="with-border" value="{SITE_URL}webhook/stripe?restaurant={RESTRO_ID}" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dashboard-box margin-top-0 margin-bottom-15 js-accordion-item">
                                            <!-- Headline -->
                                            <div class="headline js-accordion-header">
                                                <h3>{LANG_PAYTM}</h3>
                                            </div>
                                            <div class="content with-padding padding-bottom-10 js-accordion-body" style="display: none">
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_TURN_ON_OFF}</label>
                                                    <div class="col-sm-6">
                                                        <select name="restaurant_paytm_install" id="restaurant_paytm_install" class="selectpicker with-border">
                                                            <option value="1" IF("{RESTAURANT_PAYTM_INSTALL}" == "1"){ selected {:IF}>{LANG_ON}</option>
                                                            <option value="0" IF("{RESTAURANT_PAYTM_INSTALL}" == "0"){ selected {:IF}>{LANG_OFF}</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_TITLE}</label>
                                                    <div class="col-sm-6">
                                                        <input name="restaurant_paytm_title" type="text" class="with-border" value="{RESTAURANT_PAYTM_TITLE}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_LIVE_MODE_SANDBOX_MODE}</label>
                                                    <div class="col-sm-6">
                                                        <select name="restaurant_paytm_sandbox_mode" class="selectpicker with-border">
                                                            <option value="TEST" IF("{RESTAURANT_PAYTM_SANDBOX_MODE}" == "TEST"){ selected {:IF}>{LANG_SANDBOX_MODE}</option>
                                                            <option value="PROD" IF("{RESTAURANT_PAYTM_SANDBOX_MODE}" == "PROD"){ selected {:IF}>{LANG_LIVE_MODE}</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_PAYTM_MERCHANT_KEY}</label>
                                                    <div class="col-sm-6">
                                                        <input name="restaurant_paytm_merchant_key" type="text" class="with-border" value="{RESTAURANT_PAYTM_MERCHANT_KEY}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_PAYTM_MERCHANT_ID}</label>
                                                    <div class="col-sm-6">
                                                        <input name="restaurant_paytm_merchant_mid" type="text" class="with-border" value="{RESTAURANT_PAYTM_MERCHANT_MID}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_PAYTM_WEBSITE_NAME}</label>
                                                    <div class="col-sm-6">
                                                        <input name="restaurant_paytm_merchant_website" type="text" class="with-border" value="{RESTAURANT_PAYTM_MERCHANT_WEBSITE}">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dashboard-box margin-top-0 margin-bottom-15 js-accordion-item">
                                            <!-- Headline -->
                                            <div class="headline js-accordion-header">
                                                <h3>{LANG_MOLLIE}</h3>
                                            </div>
                                            <div class="content with-padding padding-bottom-10 js-accordion-body" style="display: none">
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_TURN_ON_OFF}</label>
                                                    <div class="col-sm-6">
                                                        <select name="restaurant_mollie_install" id="restaurant_mollie_install" class="selectpicker with-border">
                                                            <option value="1" IF("{RESTAURANT_MOLLIE_INSTALL}" == "1"){ selected {:IF}>{LANG_ON}</option>
                                                            <option value="0" IF("{RESTAURANT_MOLLIE_INSTALL}" == "0"){ selected {:IF}>{LANG_OFF}</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_TITLE}</label>
                                                    <div class="col-sm-6">
                                                        <input name="restaurant_mollie_title" type="text" class="with-border" value="{RESTAURANT_MOLLIE_TITLE}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label for="mollie_api_key" class="col-sm-4 control-label">{LANG_MOLLIE_API_KEY}</label>
                                                    <div class="col-sm-6">
                                                        <input id="restaurant_mollie_api_key" class="with-border" type="text"
                                                               name="restaurant_mollie_api_key"
                                                               value="{RESTAURANT_MOLLIE_API_KEY}">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dashboard-box margin-top-0 margin-bottom-15 js-accordion-item" style="display: none">
                                            <!-- Headline -->
                                            <div class="headline js-accordion-header">
                                                <h3>{LANG_2CHECKOUT}</h3>
                                            </div>
                                            <div class="content with-padding padding-bottom-10 js-accordion-body" style="display: none">
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_TURN_ON_OFF}</label>
                                                    <div class="col-sm-6">
                                                        <select name="restaurant_2checkout_install" id="restaurant_2checkout_install" class="selectpicker with-border">
                                                            <option value="1" IF("{RESTAURANT_2CHECKOUT_INSTALL}" == "1"){ selected {:IF}>{LANG_ON}</option>
                                                            <option value="0" IF("{RESTAURANT_2CHECKOUT_INSTALL}" == "0"){ selected {:IF}>{LANG_OFF}</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_TITLE}</label>
                                                    <div class="col-sm-6">
                                                        <input name="restaurant_2checkout_title" type="text" class="with-border" value="{RESTAURANT_2CHECKOUT_TITLE}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_LIVE_MODE_SANDBOX_MODE}</label>
                                                    <div class="col-sm-6">
                                                        <select name="restaurant_2checkout_sandbox_mode" class="selectpicker with-border">
                                                            <option value="sandbox" IF("{RESTAURANT_2CHECKOUT_SANDBOX_MODE}" == "sandbox"){ selected {:IF}>{LANG_SANDBOX_MODE}</option>
                                                            <option value="production" IF("{RESTAURANT_2CHECKOUT_SANDBOX_MODE}" == "production"){ selected {:IF}>{LANG_LIVE_MODE}</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label for="restaurant_2checkout_account_number" class="col-sm-4 control-label">{LANG_2CHECKOUT_ACCOUNT_NUMBER}</label>
                                                    <div class="col-sm-6">
                                                        <input id="restaurant_2checkout_account_number" class="with-border" type="text"
                                                               name="restaurant_2checkout_account_number"
                                                               value="{RESTAURANT_2CHECKOUT_ACCOUNT_NUMBER}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label for="restaurant_2checkout_public_key" class="col-sm-4 control-label">{LANG_PUBLISHABLE_KEY}</label>
                                                    <div class="col-sm-6">
                                                        <input id="restaurant_2checkout_public_key" class="with-border" type="text"
                                                               name="restaurant_2checkout_public_key"
                                                               value="{RESTAURANT_2CHECKOUT_PUBLIC_KEY}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label for="restaurant_2checkout_private_key" class="col-sm-4 control-label">{LANG_PRIVATE_API_KEY}</label>
                                                    <div class="col-sm-6">
                                                        <input id="restaurant_2checkout_private_key" class="with-border" type="text"
                                                               name="restaurant_2checkout_private_key"
                                                               value="{RESTAURANT_2CHECKOUT_PRIVATE_KEY}">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dashboard-box margin-top-0 margin-bottom-15 js-accordion-item" style="display: none">
                                            <!-- Headline -->
                                            <div class="headline js-accordion-header">
                                                <h3>{LANG_PAYSTACK}</h3>
                                            </div>
                                            <div class="content with-padding padding-bottom-10 js-accordion-body" style="display: none">
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_TURN_ON_OFF}</label>
                                                    <div class="col-sm-6">
                                                        <select name="restaurant_paystack_install" id="restaurant_paystack_install" class="selectpicker with-border">
                                                            <option value="1" IF("{RESTAURANT_PAYSTACK_INSTALL}" == "1"){ selected {:IF}>{LANG_ON}</option>
                                                            <option value="0" IF("{RESTAURANT_PAYSTACK_INSTALL}" == "0"){ selected {:IF}>{LANG_OFF}</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_TITLE}</label>
                                                    <div class="col-sm-6">
                                                        <input name="restaurant_paystack_title" type="text" class="with-border" value="{RESTAURANT_PAYSTACK_TITLE}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label for="restaurant_paystack_secret_key" class="col-sm-4 control-label">{LANG_PAYSTACK_SECRET_KEY}</label>
                                                    <div class="col-sm-6">
                                                        <input id="restaurant_paystack_secret_key" class="with-border" type="text"
                                                               name="restaurant_paystack_secret_key"
                                                               value="{RESTAURANT_PAYSTACK_SECRET_KEY}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label for="restaurant_paystack_public_key" class="col-sm-4 control-label">{LANG_PAYSTACK_PUBLIC_KEY}</label>
                                                    <div class="col-sm-6">
                                                        <input id="restaurant_paystack_public_key" class="with-border" type="text"
                                                               name="restaurant_paystack_public_key"
                                                               value="{RESTAURANT_PAYSTACK_PUBLIC_KEY}">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dashboard-box margin-top-0 margin-bottom-15 js-accordion-item" style="display: none">
                                            <!-- Headline -->
                                            <div class="headline js-accordion-header">
                                                <h3>{LANG_CCAVENUE}</h3>
                                            </div>
                                            <div class="content with-padding padding-bottom-10 js-accordion-body" style="display: none">
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_TURN_ON_OFF}</label>
                                                    <div class="col-sm-6">
                                                        <select name="restaurant_ccavenue_install" id="restaurant_ccavenue_install" class="selectpicker with-border">
                                                            <option value="1" IF("{RESTAURANT_CCAVENUE_INSTALL}" == "1"){ selected {:IF}>{LANG_ON}</option>
                                                            <option value="0" IF("{RESTAURANT_CCAVENUE_INSTALL}" == "0"){ selected {:IF}>{LANG_OFF}</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_TITLE}</label>
                                                    <div class="col-sm-6">
                                                        <input name="restaurant_ccavenue_title" type="text" class="with-border" value="{RESTAURANT_CCAVENUE_TITLE}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label for="restaurant_ccavenue_merchant_key" class="col-sm-4 control-label">{LANG_CCAVENUE_MERCHANT_KEY}</label>
                                                    <div class="col-sm-6">
                                                        <input id="restaurant_ccavenue_merchant_key" class="with-border" type="text"
                                                               name="restaurant_ccavenue_merchant_key"
                                                               value="{RESTAURANT_CCAVENUE_MERCHANT_KEY}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label for="restaurant_ccavenue_access_code" class="col-sm-4 control-label">{LANG_CCAVENUE_ACCESS_CODE}</label>
                                                    <div class="col-sm-6">
                                                        <input id="restaurant_ccavenue_access_code" class="with-border" type="text"
                                                               name="restaurant_ccavenue_access_code"
                                                               value="{RESTAURANT_CCAVENUE_ACCESS_CODE}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label for="restaurant_ccavenue_working_key" class="col-sm-4 control-label">{LANG_CCAVENUE_WORKING_KEY}</label>
                                                    <div class="col-sm-6">
                                                        <input id="restaurant_ccavenue_working_key" class="with-border" type="text"
                                                               name="restaurant_ccavenue_working_key"
                                                               value="{RESTAURANT_CCAVENUE_WORKING_KEY}">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dashboard-box margin-top-0 margin-bottom-15 js-accordion-item">
                                            <!-- Headline -->
                                            <div class="headline js-accordion-header">
                                                <h3>{LANG_PAYUMONEY}</h3>
                                            </div>
                                            <div class="content with-padding padding-bottom-10 js-accordion-body" style="display: none">
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_TURN_ON_OFF}</label>
                                                    <div class="col-sm-6">
                                                        <select name="restaurant_payumoney_install" id="restaurant_payumoney_install" class="selectpicker with-border">
                                                            <option value="1" IF("{RESTAURANT_PAYUMONEY_INSTALL}" == "1"){ selected {:IF}>{LANG_ON}</option>
                                                            <option value="0" IF("{RESTAURANT_PAYUMONEY_INSTALL}" == "0"){ selected {:IF}>{LANG_OFF}</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_TITLE}</label>
                                                    <div class="col-sm-6">
                                                        <input name="restaurant_payumoney_title" type="text" class="with-border" value="{RESTAURANT_PAYUMONEY_TITLE}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label class="col-sm-4 control-label">{LANG_LIVE_MODE_SANDBOX_MODE}</label>
                                                    <div class="col-sm-6">
                                                        <select name="restaurant_payumoney_sandbox_mode" class="selectpicker with-border">
                                                            <option value="test" IF("{RESTAURANT_PAYUMONEY_SANDBOX_MODE}" == "test"){ selected {:IF}>{LANG_SANDBOX_MODE}</option>
                                                            <option value="live" IF("{RESTAURANT_PAYUMONEY_SANDBOX_MODE}" == "live"){ selected {:IF}>{LANG_LIVE_MODE}</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label for="restaurant_payumoney_merchant_id" class="col-sm-4 control-label">{LANG_PAYUMONEY_MERCHANT_ID}</label>
                                                    <div class="col-sm-6">
                                                        <input id="restaurant_payumoney_merchant_id" class="with-border" type="text"
                                                               name="restaurant_payumoney_merchant_id"
                                                               value="{RESTAURANT_PAYUMONEY_MERCHANT_ID}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label for="restaurant_payumoney_merchant_key" class="col-sm-4 control-label">{LANG_PAYUMONEY_MERCHANT_KEY}</label>
                                                    <div class="col-sm-6">
                                                        <input id="restaurant_payumoney_merchant_key" class="with-border" type="text"
                                                               name="restaurant_payumoney_merchant_key"
                                                               value="{RESTAURANT_PAYUMONEY_MERCHANT_KEY}">
                                                    </div>
                                                </div>
                                                <div class="submit-field">
                                                    <label for="restaurant_payumoney_merchant_salt" class="col-sm-4 control-label">{LANG_PAYUMONEY_MERCHANT_SALT}</label>
                                                    <div class="col-sm-6">
                                                        <input id="restaurant_payumoney_merchant_salt" class="with-border" type="text"
                                                               name="restaurant_payumoney_merchant_salt"
                                                               value="{RESTAURANT_PAYUMONEY_MERCHANT_SALT}">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    {:IF}
                                    {:IF}

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-12">
                        <button type="submit" name="submit" class="button ripple-effect margin-top-30">{LANG_SAVE}</button>
                    </div>
                </form>
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
<script>
    $(document).ready(function () {
        $("#header-container").addClass('dashboard-header not-sticky');
    });
</script>
<!-- Footer Code -->

<script>
    var session_uname = "{USERNAME}";
    var session_uid = "{USER_ID}";
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

<script type="text/javascript" src="{SITE_URL}templates/{TPL_NAME}/js/chosen.min.js?ver={VERSION}"></script>
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

    $('.live-preview-button').on('click',function (e) {
        e.preventDefault();
        window.open($(this).attr('href'), "live-preview-button", 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, copyhistory=no,display=popup, width=380, height=' + screen.height + ', top=0, left=0');
    });

    function checkAvailabilityStoreSlug() {
        var $item = $("#store-slug").closest('.submit-field');
        var form_data = {
            action: 'checkStoreSlug',
            slug: $("#store-slug").val()
        };
        $.ajax({
            type: "POST",
            url: ajaxurl,
            data: form_data,
            dataType: 'html',
            success: function (response) {
                $("#slug-availability-status").html(response);
            }
        });
    }
</script>

IF("{RESTAURANT_TEXT_EDITOR}"=="1"){
<link media="all" rel="stylesheet" type="text/css"
      href="{SITE_URL}includes/assets/plugins/simditor/styles/simditor.css"/>
<script src="{SITE_URL}includes/assets/plugins/simditor/scripts/mobilecheck.js"></script>
<script src="{SITE_URL}includes/assets/plugins/simditor/scripts/module.js"></script>
<script src="{SITE_URL}includes/assets/plugins/simditor/scripts/uploader.js"></script>
<script src="{SITE_URL}includes/assets/plugins/simditor/scripts/hotkeys.js"></script>
<script src="{SITE_URL}includes/assets/plugins/simditor/scripts/simditor.js"></script>
<script>
    (function () {
        $(function () {
            var $preview, editor, mobileToolbar, toolbar, allowedTags;
            Simditor.locale = 'en-US';
            toolbar = ['title', 'bold','italic','underline','|','ol','ul','blockquote','table','link','|','image','hr','indent','outdent','alignment'];
            mobileToolbar = ["bold", "italic", "underline", "ul", "ol"];
            if (mobilecheck()) {
                toolbar = mobileToolbar;
            }
            allowedTags = ['br', 'span', 'a', 'img', 'b', 'strong', 'i', 'strike', 'u', 'font', 'p', 'ul', 'ol', 'li', 'blockquote', 'pre',  'h2', 'h3', 'h4', 'hr', 'table'];
            editor = new Simditor({
                textarea: $('.text-editor'),
                placeholder: '',
                toolbar: toolbar,
                pasteImage: false,
                toolbarFloat: false,
                defaultImage: '{SITE_URL}includes/assets/plugins/simditor/images/image.png',
                upload: false,
                allowedTags: allowedTags
            });
            $preview = $('#preview');
            if ($preview.length > 0) {
                return editor.on('valuechanged', function (e) {
                    return $preview.html(editor.getValue());
                });
            }
        });
    }).call(this);
</script>
{:IF}

</body>
</html>