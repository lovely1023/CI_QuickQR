{OVERALL_HEADER}

<!-- Intro Banner
        ================================================== -->
<div class="hero-section-2 bg-overlay">
    <div class="shape-bottom">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 100" preserveAspectRatio="none">
            <path class="shape-fill" fill="#FFFFFF" d="M421.9,6.5c22.6-2.5,51.5,0.4,75.5,5.3c23.6,4.9,70.9,23.5,100.5,35.7c75.8,32.2,133.7,44.5,192.6,49.7  c23.6,2.1,48.7,3.5,103.4-2.5c54.7-6,106.2-25.6,106.2-25.6V0H0v30.3c0,0,72,32.6,158.4,30.5c39.2-0.7,92.8-6.7,134-22.4  c21.2-8.1,52.2-18.2,79.7-24.2C399.3,7.9,411.6,7.5,421.9,6.5z"></path>
        </svg>
    </div>
    <div class="container">

        <!-- Intro Headline -->
        <div class="row align-items-center justify-content-center">
            <!-- Welcome Intro Start -->
            <div class="col-12 col-lg-7">
                <div class="welcome-intro">
                    <h1 class="text-white">{LANG_HOME_BANNER_HEADLINE}</h1>
                    <p class="text-white">{LANG_HOME_BANNER_SUBLINE}</p>
                    IF("{TRY_DEMO_LINK}"!=""){
                    <!-- Store Buttons -->
                    <div class="d-flex">
                        <a href="{TRY_DEMO_LINK}" target="_blank" class="button tDemo-btn">{LANG_TRY_DEMO}</a>
                    </div>
                    {:IF}
                </div>
            </div>
            <div class="col-12 col-md-8 col-lg-5">
                <!-- Contact Box -->
                <div class="contact-box bg-white text-center">
                    <!-- Contact Form -->
                    <form id="contact-form" method="post" action="{LINK_SIGNUP}" accept-charset="UTF-8">
                        <div class="contact-top">
                            <h3 class="contact-title">{LANG_GET_STARTED_FOR_FREE}</h3>
                            <h5>{LANG_FILL_ALL_FIELDS_REGISTER}</h5>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <input type="text" class="with-border" name="username" placeholder="{LANG_USERNAME}" required="required">
                                </div>
                                <div class="form-group">
                                    <input type="email" class="with-border" name="email" placeholder="{LANG_EMAIL}" required="required">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="with-border" name="password" placeholder="{LANG_PASSWORD}" required="required">
                                </div>
                                <div class="form-group text-center">
                                    IF("{RECAPTCHA_MODE}"=="1"){
                                    <div style="display: inline-block;" class="g-recaptcha" data-sitekey="{RECAPTCHA_PUBLIC_KEY}"></div>
                                    <script src='https://www.google.com/recaptcha/api.js'></script>
                                    {:IF}
                                </div>
                            </div>
                            <div class="col-12">
                                <button class="button full-width button-sliding-icon ripple-effect" name="submit" type="submit">{LANG_REGISTER} <i class="icon-feather-arrow-right"></i></button>
                                <div class="contact-bottom">
                                    <div class="checkbox margin-top-24">
                                        <input type="checkbox" id="agree_for_term" name="agree_for_term" value="1" required>
                                        <label for="agree_for_term"><span class="checkbox-icon"></span>{LANG_BY_CLICK_REGISTER} <a href="{TERMCONDITION_LINK}">{LANG_TERM_CON}</a></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Section Features Start -->
<div class="section feature-section padding-top-65 padding-bottom-75">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-10 col-lg-7">
                <!-- Section Heading -->
                <div class="section-heading">
                            <span class="d-inline-block feature-tile margin-bottom-16">
                                <i class="icon-line-awesome-lightbulb-o text-primary"></i>
                                <span class="text-primary">{LANG_POWERFUL}</span>
                                {LANG_FEATURES}
                            </span>
                    <h2>{LANG_EXPLORE_FEATURES}</h2>
                    <p class="margin-top-24">{LANG_HOME_FEATURES_TAGLINE}</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-6 col-lg-4 margin-bottom-15 margin-top-15">
                <!-- Image Box -->
                <div class="image-box text-center icon-1">
                    <!-- Featured Image -->
                    <div class="featured-img margin-bottom-16">
                        <img class="feature-icon" src="{SITE_URL}templates/{TPL_NAME}/images/whatsapp.png" alt="">
                    </div>
                    <!-- Icon Text -->
                    <div class="icon-text">
                        <h3 class="margin-bottom-8">{LANG_WHATSAPP_ORDER}</h3>
                        <p>{LANG_WHATSAPP_ORDER_TAGLINE}</p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-4 margin-bottom-15 margin-top-15">
                <!-- Image Box -->
                <div class="image-box text-center icon-1">
                    <!-- Featured Image -->
                    <div class="featured-img margin-bottom-16">
                        <img class="feature-icon" src="{SITE_URL}templates/{TPL_NAME}/images/satisfaction.png" alt="">
                    </div>
                    <!-- Icon Text -->
                    <div class="icon-text">
                        <h3 class="margin-bottom-8">{LANG_HAPPY_CUSTOMER}</h3>
                        <p>{LANG_HAPPY_CUSTOMER_TAGLINE}</p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-4 margin-bottom-15 margin-top-15">
                <!-- Image Box -->
                <div class="image-box text-center icon-1">
                    <!-- Featured Image -->
                    <div class="featured-img margin-bottom-16">
                        <img class="feature-icon" src="{SITE_URL}templates/{TPL_NAME}/images/translation.png" alt="">
                    </div>
                    <!-- Icon Text -->
                    <div class="icon-text">
                        <h3 class="margin-bottom-8">{LANG_MULTIPLE_LANGUAGE}</h3>
                        <p>{LANG_MULTIPLE_LANGUAGE_TAGLINE}</p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-4 margin-bottom-15 margin-top-15">
                <!-- Image Box -->
                <div class="image-box text-center icon-1">
                    <!-- Featured Image -->
                    <div class="featured-img margin-bottom-16">
                        <img class="feature-icon" src="{SITE_URL}templates/{TPL_NAME}/images/credit-card.png" alt="">
                    </div>
                    <!-- Icon Text -->
                    <div class="icon-text">
                        <h3 class="margin-bottom-8">{LANG_RECURRING_PAYMENT}</h3>
                        <p>{LANG_RECURRING_PAYMENT_TAGLINE}</p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-4 margin-bottom-15 margin-top-15">
                <!-- Image Box -->
                <div class="image-box text-center icon-1">
                    <!-- Featured Image -->
                    <div class="featured-img margin-bottom-16">
                        <img class="feature-icon" src="{SITE_URL}templates/{TPL_NAME}/images/invoices.png" alt="">
                    </div>
                    <!-- Icon Text -->
                    <div class="icon-text">
                        <h3 class="margin-bottom-8">{LANG_INVOICING}</h3>
                        <p>{LANG_INVOICING_TAGLINE}</p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-4 margin-bottom-15 margin-top-15">
                <!-- Image Box -->
                <div class="image-box text-center icon-1">
                    <!-- Featured Image -->
                    <div class="featured-img margin-bottom-16">
                        <img class="feature-icon" src="{SITE_URL}templates/{TPL_NAME}/images/headphones.png" alt="">
                    </div>
                    <!-- Icon Text -->
                    <div class="icon-text">
                        <h3 class="margin-bottom-8">{LANG_DEDICATED_SUPPORT}</h3>
                        <p>{LANG_DEDICATED_SUPPORT_TAGLINE}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Section Features End-->

<!-- Testimonials -->
IF({TESTIMONIALS_ENABLE} && {SHOW_TESTIMONIALS_HOME}){
<div class="section padding-top-65 padding-bottom-55 gray">

    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <!-- Section Headline -->
                <div class="section-headline centered margin-top-0 margin-bottom-5">
                    <h3>{LANG_TESTIMONIALS}</h3>
                </div>
            </div>
        </div>
    </div>

    <!-- Categories Carousel -->
    <div class="fullwidth-carousel-container margin-top-20">
        <div class="testimonial-carousel testimonials">
            <!-- Item -->
            {LOOP: TESTIMONIALS}
                <div class="fw-carousel-review">
                    <div class="testimonial-box">
                        <div class="testimonial-avatar">
                            <img src="{SITE_URL}storage/testimonials/{TESTIMONIALS.image}"  alt="{TESTIMONIALS.name}">
                        </div>
                        <div class="testimonial-author">
                            <h4>{TESTIMONIALS.name}</h4>
                            <span>{TESTIMONIALS.designation}</span>
                        </div>
                        <div class="testimonial">{TESTIMONIALS.content}</div>
                    </div>
                </div>
            {/LOOP: TESTIMONIALS}
        </div>
    </div>
    <!-- Categories Carousel / End -->
</div>
{:IF}
<!-- Testimonials / End -->
<!-- Membership Plans -->
<div class="section padding-top-60 padding-bottom-75">
    <div class="container">
        <div class="row">

            <div class="col-xl-12">
                <!-- Section Headline -->
                <div class="section-headline centered margin-top-0 margin-bottom-75">
                    <h3>{LANG_MEMBERSHIPPLAN}</h3>
                </div>
            </div>


            <div class="col-xl-12">
                <form name="form1" method="post" action="{LINK_MEMBERSHIP}/changeplan">
                    <div class="billing-cycle-radios margin-bottom-70">
                        IF("{TOTAL_MONTHLY}"!="0"){
                        <div class="radio billed-monthly-radio">
                            <input id="radio-monthly" name="billed-type" type="radio" value="monthly" checked="">
                            <label for="radio-monthly"><span class="radio-label"></span> {LANG_MONTHLY}</label>
                        </div>
                        {:IF}
                        IF("{TOTAL_ANNUAL}"!="0"){
                        <div class="radio billed-yearly-radio">
                            <input id="radio-yearly" name="billed-type" type="radio" value="yearly">
                            <label for="radio-yearly"><span class="radio-label"></span> {LANG_YEARLY}</label>
                        </div>
                        {:IF}
                        IF("{TOTAL_LIFETIME}"!="0"){
                        <div class="radio billed-lifetime-radio">
                            <input id="radio-lifetime" name="billed-type" type="radio" value="lifetime">
                            <label for="radio-lifetime"><span class="radio-label"></span> {LANG_LIFETIME}</label>
                        </div>
                        {:IF}
                    </div>
                    <!-- Pricing Plans Container -->
                    <div class="pricing-plans-container">
                        {LOOP: SUB_TYPES}
                        <!-- Plan -->
                        <div class="pricing-plan IF("{SUB_TYPES.recommended}"=="yes"){ recommended {:IF}">
                        IF("{SUB_TYPES.recommended}"=="yes"){ <div class="recommended-badge">{LANG_RECOMMENDED}</div> {:IF}
                        <h3>{SUB_TYPES.title}</h3>
                        IF("{SUB_TYPES.id}"=="free" || "{SUB_TYPES.id}"=="trial"){
                        <div class="pricing-plan-label"><strong>
                                IF("{SUB_TYPES.id}"=="free"){
                                {LANG_FREE}
                                {ELSE}
                                {LANG_TRIAL}
                                {:IF}
                            </strong></div>
                        {ELSE}
                        IF("{TOTAL_MONTHLY}"!="0"){
                        <div class="pricing-plan-label billed-monthly-label"><strong>{SUB_TYPES.monthly_price}</strong>/ {LANG_MONTHLY}</div>
                        {:IF}
                        IF("{TOTAL_ANNUAL}"!="0"){
                        <div class="pricing-plan-label billed-yearly-label"><strong>{SUB_TYPES.annual_price}</strong>/ {LANG_YEARLY}</div>
                        {:IF}
                        IF("{TOTAL_LIFETIME}"!="0"){
                        <div class="pricing-plan-label billed-lifetime-label"><strong>{SUB_TYPES.lifetime_price}</strong> {LANG_LIFETIME}</div>
                        {:IF}
                        {:IF}
                        <div class="pricing-plan-features">
                            <strong>{LANG_FEATURES_OF} {SUB_TYPES.title}</strong>
                            <ul>
                                <li>{SUB_TYPES.category_limit} {LANG_MENU_CATEGORIES}</li>
                                <li>{SUB_TYPES.menu_limit} {LANG_MENU_ITEMS_PER_CATEGORY}</li>
                                <li>{SUB_TYPES.scan_limit} {LANG_SCANS_PER_MONTH}</li>
                                <li>
                                    IF("{SUB_TYPES.allow_ordering}"=="1"){
                                    <span class="icon-text yes"><i class="icon-feather-check-circle margin-right-2"></i></span>
                                    {ELSE}
                                    <span class="icon-text no"><i class="icon-feather-x-circle margin-right-2"></i></span>
                                    {:IF}
                                    {LANG_ALLOW_RESTAURANTS_ORDERS}
                                </li>
                                {SUB_TYPES.custom_settings}
                            </ul>
                        </div>

                        IF("{SUB_TYPES.Selected}"=="0"){
                        IF('{USERNAME}'!=""){
                        <button type="submit" class="button full-width margin-top-20 ripple-effect" name="upgrade" value="{SUB_TYPES.id}">{LANG_UPGRADE}</button>

                        {ELSE}
                        <a href="#sign-in-dialog" class="popup-with-zoom-anim button full-width margin-top-20 ripple-effect">{LANG_JOIN_NOW}</a>
                        {:IF}
                        {ELSE}
                        <a href="javascript:void(0);" class="button full-width margin-top-20 ripple-effect">
                            {LANG_CURRENT_PLAN}
                        </a>
                        {:IF}
                    </div>
                    {/LOOP: SUB_TYPES}
            </div>
            </form>
        </div>

    </div>
</div>
</div>
<!-- Membership Plans / End-->

<!-- Recent Blog Posts -->
IF({BLOG_ENABLE} && {SHOW_BLOG_HOME}){
<div class="section gray padding-top-65 padding-bottom-50">
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <!-- Section Headline -->
                <div class="section-headline margin-top-0 margin-bottom-45">
                    <h3>{LANG_RECENT_BLOG}</h3>
                    <a href="{LINK_BLOG}" class="headline-link">{LANG_VIEW_BLOG}</a>
                </div>

                <div class="row">
                    <!-- Blog Post Item -->
                    {LOOP: RECENT_BLOG}
                        <div class="col-xl-4">
                            <a href="{RECENT_BLOG.link}" class="blog-compact-item-container">
                                <div class="blog-compact-item">
                                    <img class="lazy-load" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC"  data-original="{SITE_URL}storage/blog/{RECENT_BLOG.image}"
                                         alt="{RECENT_BLOG.title}">
                                    <span class="blog-item-tag">{RECENT_BLOG.author}</span>
                                    <div class="blog-compact-item-content">
                                        <ul class="blog-post-tags">
                                            <li>{RECENT_BLOG.created_at}</li>
                                        </ul>
                                        <h3>{RECENT_BLOG.title}</h3>
                                        <p>{RECENT_BLOG.description}</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    {/LOOP: RECENT_BLOG}
                    <!-- Blog post Item / End -->
                </div>
            </div>
        </div>
    </div>
</div>
{:IF}
<!-- Recent Blog Posts / End -->
{OVERALL_FOOTER}