<!DOCTYPE html>
<html lang="en">
<head>
    <title>{NAME}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="author" content="{SITE_TITLE}">
    <link rel="shortcut icon" href="{SITE_URL}storage/logo/{SITE_FAVICON}">
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

    <link rel="stylesheet" href="{SITE_URL}includes/assets/css/icons.css">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/style.css?ver={VERSION}">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/color.css?ver={VERSION}">
    <script src="{SITE_URL}templates/{TPL_NAME}/js/jquery-3.4.1.min.js"></script>

</head>
<body>
<div class="single-page-header restaurant-header detail-header padding-top-0 padding-bottom-0 margin-bottom-30" data-background-image="{SITE_URL}storage/restaurant/cover/{COVER_IMAGE}">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="single-page-header-inner">
                    <div class="left-side d-flex">
                        <div class="header-image"><img class="lazy-load" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC" data-original="{SITE_URL}storage/restaurant/logo/{MAIN_IMAGE}" alt=""></div>
                        <div class="header-details margin-left-15">
                            <h3>{NAME}<span>{SUB_TITLE}</span></h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-xl-12">
            <form id="subscribeForm" method="POST" novalidate="novalidate">
                <h3>{LANG_PAYMENT_METHOD}</h3>
                <div class="payment margin-top-15">
                        IF("{RESTAURANT_PAYPAL_INSTALL}" == "1"){
                        <div class="payment-tab payment-tab-active">
                            <div class="payment-tab-trigger">
                                <input checked id="paypal" class="payment_method_id" name="payment_method_id" type="radio"
                                       value="paypal" data-name="paypal">
                                <label for="paypal">{RESTAURANT_PAYPAL_TITLE}</label>
                                <img class="payment-logo paypal"
                                     src="{SITE_URL}includes/payments/paypal/logo/logo.png"
                                     alt="{RESTAURANT_PAYPAL_TITLE}">
                            </div>
                            <div class="payment-tab-content">
                                <p>{LANG_REDIRECT_PAYPAL}</p>
                            </div>
                        </div>
                    {:IF}
                        IF("{RESTAURANT_PAYTM_INSTALL}" == "1"){
                        <!-- paytm-->
                        <div class="payment-tab">
                            <div class="payment-tab-trigger">
                                <input name="payment_method_id" class="payment_method_id" id="paytm"
                                       type="radio" value="paytm" data-name="paytm">
                                <label for="paytm">{RESTAURANT_PAYTM_TITLE}</label>
                                <img class="payment-logo paytm"
                                     src="{SITE_URL}includes/payments/paytm/logo/logo.png" alt="">
                            </div>

                            <div class="payment-tab-content">
                                <p>{LANG_REDIRECT_PAYTM}</p>
                            </div>
                        </div>
                        <!-- paytm -->
                    {:IF}

                    IF("{RESTAURANT_CCAVENUE_INSTALL}" == "1"){
                        <!-- ccavenue-->
                        <div class="payment-tab">
                            <div class="payment-tab-trigger">
                                <input name="payment_method_id" class="payment_method_id" id="ccavenue"
                                       type="radio" value="ccavenue" data-name="ccavenue">
                                <label for="ccavenue">{RESTAURANT_CCAVENUE_TITLE}</label>
                                <img class="payment-logo ccavenue"
                                     src="{SITE_URL}includes/payments/ccavenue/logo/logo.png" alt="">
                            </div>

                            <div class="payment-tab-content">
                                <p>{LANG_REDIRECT_CCAVENUE}</p>
                            </div>
                        </div>
                        <!-- ccavenue -->
                    {:IF}
                    IF("{RESTAURANT_PAYUMONEY_INSTALL}" == "1"){
                        <!-- Payumoney -->
                        <div class="payment-tab">
                            <div class="payment-tab-trigger">
                                <input name="payment_method_id" class="payment_method_id" id="payumoney"
                                       type="radio" value="payumoney" data-name="payumoney">
                                <label for="payumoney">{RESTAURANT_PAYUMONEY_TITLE}</label>
                                <img class="payment-logo payumoney"
                                     src="{SITE_URL}includes/payments/payumoney/logo/logo.png" alt="">
                            </div>

                            <div class="payment-tab-content">
                                <p>{LANG_REDIRECT_PAYUMONEY}</p>
                            </div>
                        </div>
                        <!-- Payumoney -->
                    {:IF}
                    IF("{RESTAURANT_PAYSTACK_INSTALL}" == "1"){
                        <div class="payment-tab">
                            <div class="payment-tab-trigger">
                                <input name="payment_method_id" class="payment_method_id" id="paystack"
                                       type="radio" value="paystack" data-name="paystack">
                                <label for="paystack">{RESTAURANT_PAYSTACK_TITLE}</label>
                                <img class="payment-logo paystack"
                                     src="{SITE_URL}includes/payments/paystack/logo/logo.png" alt="">
                            </div>
                            <div class="payment-tab-content">
                                <p>{LANG_REDIRECT_PAYSTACK}</p>
                            </div>
                        </div>
                    {:IF}
                        IF("{RESTAURANT_STRIPE_INSTALL}" == "1"){
                        <div class="payment-tab">
                            <div class="payment-tab-trigger">
                                <input name="payment_method_id" class="payment_method_id" id="creditCart" type="radio"
                                       value="stripe" data-name="stripe">
                                <label for="creditCart">{RESTAURANT_STRIPE_TITLE}</label>
                                <img class="payment-logo"
                                     src="{SITE_URL}includes/payments/stripe/logo/logo.png" alt="">
                            </div>

                            <div class="payment-tab-content">
                                <p>{LANG_REDIRECT_STRIPE}</p>
                            </div>
                        </div>
                    {:IF}
                    IF("{RESTAURANT_2CHECKOUT_INSTALL}"=="1"){
                        <div class="payment-tab">
                            <div class="payment-tab-trigger">
                                <input name="payment_method_id" class="payment_method_id" id="2checkout"
                                       type="radio" value="2checkout" data-name="2checkout">
                                <label for="2checkout">{RESTAURANT_2CHECKOUT_TITLE}</label>
                                <img class="payment-logo 2checkout"
                                     src="{SITE_URL}includes/payments/2checkout/logo/logo.png" alt="">
                            </div>
                            <div class="payment-tab-content">
                                <!-- CREDIT CARD FORM STARTS HERE -->
                                <div class="row payment-form-row">
                                    <div class="col-12">
                                        <div class="card-label form-group">
                                            <input type="text" class="form-control" name="checkoutCardNumber"
                                                   placeholder="{LANG_CARD_NUMBER}" autocomplete="cc-number" autofocus/>
                                        </div>
                                    </div>
                                    <div class="col-7">
                                        <div class="card-label form-group">
                                            <input type="tel" class="form-control" name="checkoutCardExpiry"
                                                   placeholder="MM / YYYY" autocomplete="cc-exp" aria-required="true"
                                                   aria-invalid="false">
                                        </div>
                                    </div>
                                    <div class="col-5 pull-right">
                                        <div class="card-label form-group">
                                            <input type="tel" class="form-control" name="checkoutCardCVC"
                                                   placeholder="CVV" autocomplete="cc-csc"/>
                                        </div>
                                    </div>
                                    <div class="col-7">
                                        <div class="card-label form-group">
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    name="checkoutCardFirstName"
                                                    placeholder="{LANG_FIRST_NAME}"

                                            />
                                        </div>
                                    </div>
                                    <div class="col-5 pull-right">
                                        <div class="card-label form-group">
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    name="checkoutCardLastName"
                                                    placeholder="{LANG_LAST_NAME}"

                                            />
                                        </div>
                                    </div>
                                    <div class="col-7">
                                        <div class="card-label form-group">
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    name="checkoutBillingAddress"
                                                    placeholder="{LANG_ADDRESS}"

                                            />
                                        </div>
                                    </div>
                                    <div class="col-5 pull-right">
                                        <div class="card-label form-group">
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    name="checkoutBillingCity"
                                                    placeholder="{LANG_CITY}"

                                            />
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="card-label form-group">
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    name="checkoutBillingState"
                                                    placeholder="{LANG_STATE}"

                                            />
                                        </div>
                                    </div>
                                    <div class="col-4 pull-right">
                                        <div class="card-label form-group">
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    name="checkoutBillingZipcode"
                                                    placeholder="{LANG_ZIPCODE}"

                                            />
                                        </div>
                                    </div>
                                    <div class="col-4 pull-right">
                                        <div class="card-label form-group">
                                            <input
                                                    type="text"
                                                    class="form-control"
                                                    name="checkoutBillingCountry"
                                                    placeholder="{LANG_COUNTRY}"

                                            />
                                        </div>
                                    </div>

                                    <div id="checkoutPaymentErrors" class="text-danger" style="display:none;">
                                        <div class="col-12">
                                            <p class="payment-errors"></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- CREDIT CARD FORM ENDS HERE -->

                            </div>

                        </div>
                    {:IF}
                        IF("{RESTAURANT_MOLLIE_INSTALL}"=="1"){
                        <div class="payment-tab">
                            <div class="payment-tab-trigger">
                                <input name="payment_method_id" class="payment_method_id" id="mollie"
                                       type="radio" value="mollie" data-name="mollie">
                                <label for="mollie">{RESTAURANT_MOLLIE_TITLE}</label>
                                <img class="payment-logo mollie"
                                     src="{SITE_URL}includes/payments/mollie/logo/logo.png"
                                     alt="mollie">
                            </div>
                            <div class="payment-tab-content">
                                <p>{LANG_REDIRECT_MOLLIE}</p>
                            </div>
                        </div>
                    {:IF}
                </div>
                <input type="hidden" name="token" value="{TOKEN}"/>
                <button type="submit" name="Submit"
                        class="button big ripple-effect margin-top-40 margin-bottom-65 subscribeNow"
                        id="subscribeNow">{LANG_SUBMIT}</button>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="{SITE_URL}templates/{TPL_NAME}/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="{SITE_URL}templates/{TPL_NAME}/js/jquery.payment.min.js"></script>

<!-- payment js -->
<script src="https://js.paystack.co/v1/inline.js"></script>
<script src="https://www.2checkout.com/checkout/api/2co.min.js"></script>
<script src="https://js.stripe.com/v2/"></script>

<script>
    var packagePrice = 1;
    var LANG_CONFIRM_PAY = "{LANG_CONFIRM_PAY}";
    var LANG_PROCCESSING = "{LANG_PROCCESSING}";
    var LANG_VALIDATING = "{LANG_VALIDATING}";
    var LANG_TRY_AGAIN = "{LANG_ERROR_TRY_AGAIN}";
    var LANG_INV_EXP_DATE = "{LANG_INV_EXP_DATE}";
    var LANG_INV_CVV = "{LANG_INV_CVV}";
    var LANG_FIELD_REQ = "{LANG_FIELD_REQ}";
    var LANG_CODE = "{LANG_CODE}";

    $(document).ready(function () {
        /* Show price & Payment Methods */
        var paymentMethod = $('input[name="payment_method_id"]:checked').data("name");

        /* Select a Payment Method */
        $('.payment_method_id').on('change', function () {
            paymentMethod = $(this).data('name');
            var $payment_tab_content = $(this).closest('.payment-tab').find('.payment-tab-content');
            $payment_tab_content.find('[name="payment_mode"]').first().prop('checked',true);
        });

        $('.payment_method_id').first().prop('checked',true).trigger('change');

        /* Fancy restrictive input formatting via jQuery.payment library */
        $('input[name=checkoutCardNumber]').payment('formatCardNumber');
        $('input[name=checkoutCardCVC]').payment('formatCardCVC');
        $('input[name=checkoutCardExpiry]').payment('formatCardExpiry');

        $('input[name=stripeCardNumber]').payment('formatCardNumber');
        $('input[name=stripeCardCVC]').payment('formatCardCVC');
        $('input[name=stripeCardExpiry]').payment('formatCardExpiry');

        /* Pull in the public encryption key for our environment (2Checkout) */
        TCO.loadPubKey();

        /* Form Default Submission */
        $('#subscribeNow').on('click', function (e) {
            e.preventDefault();

            paymentMethod = $('input[name="payment_method_id"]:checked').data("name");
            var $form = $('#subscribeForm');

            if (packagePrice <= 0) {
                $form.submit();
            }

            switch (paymentMethod) {
                case 'paypal':
                case 'ccavenue':
                case 'paytm':
                case 'payumoney':
                case 'mollie':
                case 'stripe':
                    $form.submit();
                    break;
                case 'paystack':
                    payWithPaystack();
                    break;
                case '2checkout':
                    if (ccFormValidationForCheckout()) {
                        payWithCheckout();
                    }
                    break;
            }

            return false;
        });

        function payWithPaystack() {
            var amount = '{PRICE}';
            amount = 100 * amount;
            var $form = $('#subscribeForm');
            $form.find('#subscribeNow').html(LANG_PROCCESSING + ' <i class="fa fa-spinner fa-pulse"></i>');

            var handler = PaystackPop.setup({
                    key: '{PAYSTACK_PUBLIC_KEY}',
                    email: '{EMAIL}',
                    amount: amount,
                    currency: '{CURRENCY_CODE}',
                    metadata: {
                        custom_fields: [
                            {
                                display_name: "Blank",
                                product_id: "Blank",
                                value: "Blank"
                            }
                        ]
                    }
                    ,
                    callback: function (response) {
                        var paystackReference = response.reference;
                        /* Insert the token into the form so it gets submitted to the server */
                        $form.append($('<input type="hidden" name="paystackReference" />').val(paystackReference));
                        $form.submit();
                    }
                    ,
                    onClose: function () {
                        $form.find('#subscribeNow').html(LANG_CONFIRM_PAY);
                    }
                }
                )
            ;
            handler.openIframe();
        }

        function ccFormValidationForCheckout() {
            var $form = $('#subscribeForm');

            /* Form validation */
            /*jQuery.validator.addMethod('checkoutCardExpiry', function(value, element) {
             *//* Regular expression to match Credit Card expiration date *//*
             var reg = new RegExp('^(0[1-9]|1[0-2])\\s?\/\\s?([0-9]|[0-9])$');
             return this.optional(element) || reg.test(value);
             }, "Invalid expiration date");*/

            jQuery.validator.addMethod(
                "checkoutCardExpiry",
                function (value, element, params) {
                    var minMonth = new Date().getMonth() + 1;
                    var minYear = new Date().getFullYear();

                    var checkoutCardExpiry = $('input[name=checkoutCardExpiry]').val().split('/');
                    var $month = (0 in checkoutCardExpiry) ? checkoutCardExpiry[0].replace(/\s/g, '') : '';
                    var $year = (1 in checkoutCardExpiry) ? checkoutCardExpiry[1].replace(/\s/g, '') : '';

                    var month = parseInt($month, 10);
                    var year = parseInt($year, 10);

                    return ((year > minYear) || ((year === minYear) && (month >= minMonth)));
                }
                ,
                LANG_INV_EXP_DATE);

            jQuery.validator.addMethod('checkoutCardCVC', function (value, element) {
                /* Regular expression matching a 3 or 4 digit CVC (or CVV) of a Credit Card */
                var reg = new RegExp('^[0-9]{3,4}$');
                return this.optional(element) || reg.test(value);
            }, LANG_INV_CVV);

            var validator = $form.validate({
                lang: '{LANG_CODE}',
                rules: {
                    checkoutCardNumber: {
                        required: true
                    },
                    checkoutCardExpiry: {
                        required: true,
                        checkoutCardExpiry: true
                    },
                    checkoutCardCVC: {
                        required: true,
                        checkoutCardCVC: true
                    },
                    checkoutCardHolderFirstName: {
                        required: true
                    },
                    checkoutCardHolderLastName: {
                        required: true
                    },
                    checkoutBillingAddress: {
                        required: true
                    },
                    checkoutBillingCity: {
                        required: true
                    },
                    checkoutBillingState: {
                        required: true
                    },
                    checkoutBillingZipcode: {
                        required: true
                    },
                    checkoutBillingCountry: {
                        required: true
                    }
                },
                highlight: function (element) {
                    $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                },
                unhighlight: function (element) {
                    $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                },
                errorPlacement: function (error, element) {
                    $(element).closest('.form-group').append(error);
                }
            });

            /* Abort if invalid form data */
            return validator.form();
        }

        function payWithCheckout() {
            var $form = $('#subscribeForm');

            /* Visual feedback */
            $form.find('#subscribeNow').html(LANG_VALIDATING + ' <i class="fa fa-spinner fa-pulse"></i>').prop('disabled', true);

            /* Setup token request arguments */
            var checkoutCardExpiry = $('input[name=checkoutCardExpiry]').val().split('/');

            var args = {
                sellerId: "{CHECKOUT_ACCOUNT_NUMBER}",
                publishableKey: "{CHECKOUT_PUBLIC_KEY}",
                ccNo: $('input[name=checkoutCardNumber]').val().replace(/\s/g, ''),
                cvv: $('input[name=checkoutCardCVC]').val(),
                expMonth: (0 in checkoutCardExpiry) ? checkoutCardExpiry[0].replace(/\s/g, '') : '',
                expYear: (1 in checkoutCardExpiry) ? checkoutCardExpiry[1].replace(/\s/g, '') : ''
            };

            /* Make the token request */
            TCO.requestToken(function (data) {
                /* Visual feedback */
                $form.find('#subscribeNow').html(LANG_PROCCESSING + ' <i class="fa fa-spinner fa-pulse"></i>');

                /* Hide Stripe errors on the form */
                $form.find('#checkoutPaymentErrors').hide();
                $form.find('#checkoutPaymentErrors').find('.payment-errors').text('');

                /* Set the token as the value for the token input */
                var checkoutToken = data.response.token.token;
                $form.append($('<input type="hidden" name="2checkoutToken" />').val(checkoutToken));

                /* IMPORTANT: Here we call `submit()` on the form element directly instead of using jQuery to prevent and infinite token request loop. */
                $form.submit();

            }, function (data) {
                if (data.errorCode === 200) {
                    tokenRequest();
                } else {
                    /* Visual feedback */
                    $form.find('#subscribeNow').html(LANG_TRY_AGAIN).prop('disabled', false);

                    /* Show errors on the form */
                    $form.find('#checkoutPaymentErrors').find('.payment-errors').text(data.errorMsg);
                    $form.find('#checkoutPaymentErrors').show();
                }
            }, args);
        }

    });

</script>
<script>
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
</script>
<!-- Scripts
================================================== -->
<script src="{SITE_URL}templates/{TPL_NAME}/js/chosen.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/jquery.lazyload.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/tippy.all.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/simplebar.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/bootstrap-slider.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/bootstrap-select.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/snackbar.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/counterup.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/magnific-popup.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/slick.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/jquery.cookie.min.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/user-ajax.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/custom.js?ver={VERSION}"></script>
</body>
</html>