$(document).on('click', ".add-cat" ,function(e){
    e.preventDefault();

    $('#cat-edit-id').val('');
    $('#category_name').val('');

    $.magnificPopup.open({
        items: {
            src: '#add-category',
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

$(document).on('click', ".edit-cat" ,function(e){
    e.preventDefault();
    e.stopPropagation();

    $('#cat-edit-id').val($(this).data('catid'));
    $('#category_name').val($(this).closest('.dashboard-box').find('.category-display-name').html());

    $.magnificPopup.open({
        items: {
            src: '#add-category',
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

$("#save-category").on('click',function (e) {
    e.stopPropagation();
    e.preventDefault();

    var id = $("#cat-edit-id").val();

    var form_data = {
        action: 'addNewCat',
        name: $("#category_name").val()
    };

    if(id){
        form_data['id'] = id;
        form_data['action'] = 'editCat';
    }

    $('#save-category').addClass('button-progress').prop('disabled', true);
    $.ajax({
        type: "POST",
        url: ajaxurl,
        data: form_data,
        dataType: 'json',
        success: function (response) {
            if(response.success){
                $("#category-status").addClass('success').removeClass('error').html('<p>'+response.message+'</p>').slideDown();
                location.reload();
            }
            else {
                $("#category-status").removeClass('success').addClass('error').html('<p>'+response.message+'</p>').slideDown();
            }
            $('#save-category').removeClass('button-progress').prop('disabled', false);
        }
    });
    return false;
});

$(document).on('click', ".add_sub_cat_item" ,function(e){
    e.preventDefault();

    $('#cat-id').val($(this).data('catid'));
    $('#sub-cat-id').val('');
    $('#sub_category_name').val('');

    $.magnificPopup.open({
        items: {
            src: '#add-sub-category',
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

$(document).on('click', ".edit-sub-cat" ,function(e){
    e.preventDefault();
    e.stopPropagation();

    $('#cat-id').val($(this).data('catid'));
    $('#sub-cat-id').val($(this).data('subcatid'));
    $('#sub_category_name').val($(this).closest('.dashboard-box').find('.sub-category-display-name').html());


    $.magnificPopup.open({
        items: {
            src: '#add-sub-category',
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

$("#save-sub-category").on('click',function (e) {
    e.stopPropagation();
    e.preventDefault();

    var id = $("#sub-cat-id").val();

    var form_data = {
        action: 'addNewSubCat',
        cat_id: $('#cat-id').val(),
        name: $("#sub_category_name").val()
    };

    if(id){
        form_data['id'] = id;
        form_data['action'] = 'editSubCat';
    }

    $('#save-sub-category').addClass('button-progress').prop('disabled', true);
    $.ajax({
        type: "POST",
        url: ajaxurl,
        data: form_data,
        dataType: 'json',
        success: function (response) {
            if(response.success){
                $("#category-status").addClass('success').removeClass('error').html('<p>'+response.message+'</p>').slideDown();
                location.reload();
            }
            else {
                $("#category-status").removeClass('success').addClass('error').html('<p>'+response.message+'</p>').slideDown();
            }
            $('#save-sub-category').removeClass('button-progress').prop('disabled', false);
        }
    });
    return false;
});

$(document).on('click', ".edit_menu_item" ,function(e){
    e.preventDefault();
    e.stopPropagation();

    var id = $(this).data('id'),
        $this = $(this);

    $('#cat_id').val($(this).data('catid'));

    $this.addClass('button-progress').prop('disabled', true);
    $.ajax({
        type: "POST",
        url: ajaxurl+'?action=get_item&id='+id,
        dataType: 'json',
        success: function (response) {
            if(response.success) {
                $('#menu-id').val(id);
                $('#menu-item-name').val(response.name);
                $('#menu-item-description').val(response.description);
                $('#menu-item-price').val(response.price);
                $('#menu-item-type').val(response.type).trigger('change');
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

$(document).on('click', ".add_menu_item" ,function(e){
    e.stopPropagation();
    e.preventDefault();

    $('#cat_id').val($(this).data('catid'));
    $('#menu-id').val('');
    $('#menu-item-name').val('');
    $('#menu-item-description').val('');
    $('#menu-item-price').val('');
    $('#menu-item-type').val('veg').trigger('change');
    $('#menu-item-image').attr('src', SITE_URL+'storage/restaurant/logo/default.png');
    $('#menu-item-available').prop('checked',true);

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

$(document).on('click', ".delete_menu_item" ,function(e){
    e.preventDefault();
    e.stopPropagation();

    var id = $(this).data('id'),
        $this = $(this);

    if(confirm(LANG_ARE_YOU_SURE)) {
        $this.addClass('button-progress').prop('disabled', true);
        $.ajax({
            type: "POST",
            url: ajaxurl + '?action=delete_item&id=' + id,
            dataType: 'json',
            success: function (response) {
                $this.removeClass('button-progress').prop('disabled', false);
                if (response.success) {
                    $this.closest('.dashboard-box').remove();
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

$(document).on('click', ".delete-cat" ,function(e){
    e.preventDefault();
    e.stopPropagation();

    var id = $(this).data('catid'),
        $this = $(this);

    if(confirm(LANG_ARE_YOU_SURE)) {
        $this.addClass('button-progress').prop('disabled', true);
        $.ajax({
            type: "POST",
            url: ajaxurl,
            data: {
                action: 'deleteCat',
                id: id
            },
            dataType: 'json',
            success: function (response) {
                $this.removeClass('button-progress').prop('disabled', false);
                if (response.success) {
                    $this.closest('.dashboard-box').remove();
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

$(document).on('click', ".delete-sub-cat" ,function(e){
    e.preventDefault();
    e.stopPropagation();

    var id = $(this).data('subcatid'),
        $this = $(this);

    if(confirm(LANG_ARE_YOU_SURE)) {
        $this.addClass('button-progress').prop('disabled', true);
        $.ajax({
            type: "POST",
            url: ajaxurl,
            data: {
                action: 'deleteSubCat',
                id: id
            },
            dataType: 'json',
            success: function (response) {
                $this.removeClass('button-progress').prop('disabled', false);
                if (response.success) {
                    $this.closest('.dashboard-box').remove();
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
    e.stopPropagation();

    var data = new FormData(this);
    var action = 'add_item';

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

var $categories = $('#menu-categories');
$categories.sortable({
    //helper : fixHelper,
    axis   : 'y',
    handle : '.quickad-js-handle',
    update : function( event, ui ) {
        var data = [];
        $categories.children('div').each(function() {
            data.push($(this).data('catid'));
        });
        $.ajax({
            type : 'POST',
            url  : ajaxurl,
            dataType: 'json',
            data : { action: 'updateCatPosition', position: data },
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

$('.menu-subcategories').sortable({
    //helper : fixHelper,
    axis   : 'y',
    handle : '.quickad-js-handle',
    update : function( event, ui ) {
        var data = [];
        $('.menu-subcategories').children('div').each(function() {
            data.push($(this).data('subcatid'));
        });
        $.ajax({
            type : 'POST',
            url  : ajaxurl,
            dataType: 'json',
            data : { action: 'updateSubCatPosition', position: data },
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

$('.cat-menu-items').sortable({
    //helper : fixHelper,
    axis   : 'y',
    handle : '.quickad-js-handle',
    update : function( event, ui ) {
        var data = [];
        $(this).children('div').each(function() {
            data.push($(this).data('menuid'));
        });
        $.ajax({
            type : 'POST',
            url  : ajaxurl,
            dataType: 'json',
            data : { action: 'updateMenuPosition', position: data },
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