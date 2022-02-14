var flipbookEL = document.getElementById('flipbook');
let flipbook = $(flipbookEL);

function loadApp() {
    $('.flipbook-loader').fadeOut();

    $(window).on('resize', function (e) {
        console.log(flipbook.find('.page.p'+flipbook.turn("page")+' img').height());
        $('.wrapper').height(flipbook.find('.page.p'+flipbook.turn("page")+' img').height() || 300);

        flipbookEL.style.width = '';
        flipbookEL.style.height = '';
        $(flipbookEL).turn('size', flipbookEL.clientWidth, flipbookEL.clientHeight);
    });

    $('.wrapper').on( "swipeleft", function(){
        if(flipbook.turn("page") == flipbook.turn("pages")){
            Snackbar.show({
                text: LANG_THIS_LAST_PAGE,
                pos: 'top-center',
                showAction: false,
                actionText: "Dismiss",
                duration: 3000,
                textColor: '#fff',
                backgroundColor: '#383838'
            });
            return;
        }

        flipbook.turn('next');
    }).on( "swiperight", function(){
        if(flipbook.turn("page") == 1){
            Snackbar.show({
                text: LANG_THIS_FIRST_PAGE,
                pos: 'top-center',
                showAction: false,
                actionText: "Dismiss",
                duration: 3000,
                textColor: '#fff',
                backgroundColor: '#383838'
            });
            return;
        }

        flipbook.turn('previous');
    });

    flipbook.turn({
        elevation: 50,
        acceleration: true,
        duration: 1500,
        gradients: true,
        autoCenter: true,
        display: 'single'
    });

    $(window).trigger('resize');
}
$(window).on('load',loadApp);

function inlineBG() {
    $(".single-page-header").each(function () {
        var attrImageBG = $(this).attr('data-background-image');
        if (attrImageBG !== undefined) {
            $(this).append('<div class="background-image-container"></div>');
            $('.background-image-container').css('background-image', 'url(' + attrImageBG + ')');
        }
    });
}

inlineBG();