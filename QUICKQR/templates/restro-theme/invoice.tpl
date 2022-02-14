<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>{LANG_INVOICE} - {SITE_TITLE}</title>
    <style>
        :root{--theme-color-1: {THEME_COLOR};}
    </style>
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/invoice.css">
</head>
<body>

<!-- Print Button -->
<div class="print-button-container">
    <a href="javascript:window.print()" class="print-button">{LANG_PRINT_INVOICE}</a>
</div>

<!-- Invoice -->
<div id="invoice">
    <!-- Header -->
    <div class="row">
        <div class="col-xl-6">
            <div id="logo"><img src="{SITE_URL}storage/logo/{SITE_LOGO}" alt="{SITE_TITLE}"></div>
        </div>
        <div class="col-xl-6">
            <p id="details">
                <strong>{LANG_INVOICE}:</strong> {INVOICE_NR_PREFIX}{INVOICE_ID} <br>
                <strong>{LANG_DATE}:</strong> {INVOICE_DATE}
            </p>
        </div>
    </div>


    <!-- Client & Supplier -->
    <div class="row">
        <div class="col-xl-12">
            <h2>{LANG_INVOICE}</h2>
        </div>
        <div class="col-md-6">
            <h3 class="margin-bottom-5">{LANG_SUPPLIER}</h3>
            <p>
                IF("{ADMIN_NAME}"!=""){ <strong>{LANG_NAME}:</strong> {ADMIN_NAME}<br>{:IF}
                IF("{ADMIN_ADDRESS}"!=""){ <strong>{LANG_ADDRESS}:</strong> {ADMIN_ADDRESS}<br>{:IF}
                IF("{ADMIN_CITY}"!=""){ <strong>{LANG_CITY}:</strong> {ADMIN_CITY}<br>{:IF}
                IF("{ADMIN_STATE}"!=""){ <strong>{LANG_STATE}:</strong> {ADMIN_STATE}<br>{:IF}
                IF("{ADMIN_COUNTRY}"!=""){ <strong>{LANG_COUNTRY}:</strong> {ADMIN_COUNTRY}<br>{:IF}
                IF("{ADMIN_ZIPCODE}"!=""){ <strong>{LANG_ZIPCODE}:</strong> {ADMIN_ZIPCODE}<br>{:IF}
                IF("{ADMIN_TAX_TYPE}"!="" && "{ADMIN_TAX_ID}"!=""){
                <strong>{ADMIN_TAX_TYPE}:</strong> {ADMIN_TAX_ID}<br>
                {:IF}
            </p>
        </div>
        <div class="col-md-6">
            <h3 class="margin-bottom-5">{LANG_CUSTOMER}</h3>
            <p>
                IF("{BILLING_NAME}"!=""){ <strong>{LANG_NAME}:</strong> {BILLING_NAME}<br>{:IF}
                IF("{BILLING_ADDRESS}"!=""){ <strong>{LANG_ADDRESS}:</strong> {BILLING_ADDRESS}<br>{:IF}
                IF("{BILLING_CITY}"!=""){ <strong>{LANG_CITY}:</strong> {BILLING_CITY}<br>{:IF}
                IF("{BILLING_STATE}"!=""){ <strong>{LANG_STATE}:</strong> {BILLING_STATE}<br>{:IF}
                IF("{BILLING_COUNTRY}"!=""){ <strong>{LANG_COUNTRY}:</strong> {BILLING_COUNTRY}<br>{:IF}
                IF("{BILLING_ZIPCODE}"!=""){ <strong>{LANG_ZIPCODE}:</strong> {BILLING_ZIPCODE}<br>{:IF}
                IF("{BILLING_DETAILS_TYPE}"!="business"){
                <strong>IF("{ADMIN_TAX_TYPE}"!=""){ {ADMIN_TAX_TYPE} {ELSE} {LANG_TAX_ID}{:IF}:</strong> {BILLING_TAX_ID}<br>
                {:IF}
            </p>
        </div>
    </div>
    <!-- Invoice -->
    <div class="row">
        <div class="col-xl-12">
            <table class="margin-top-20">
                <tr>
                    <th>{LANG_ITEM}</th>
                    <th>{LANG_AMOUNT}</th>
                </tr>
                <tr>
                    <td>{ITEM_NAME}</td>
                    <td>{ITEM_AMOUNT}</td>
                </tr>
                {LOOP: TAXES}
                <tr>
                    <td>{TAXES.name}<br><small>{TAXES.description}</small></td>
                    <td>{TAXES.value_formatted}</td>
                </tr>
                {/LOOP: TAXES}
            </table>
            <table id="totals">
                <tr>
                    <th>{LANG_TOTAL}<br><small>Paid via {PAID_VIA}</small></th>
                    <th><span>{TOTAL_AMOUNT}</span></th>
                </tr>
            </table>
        </div>
    </div>
    <!-- Footer -->
    <div class="row">
        <div class="col-xl-12">
            <ul id="footer">
                <li><span>{SITE_URL}</span></li>
                <li>{INVOICE_ADMIN_EMAIL}</li>
                <li>{INVOICE_ADMIN_PHONE}</li>
            </ul>
        </div>
    </div>
</div>
</html>