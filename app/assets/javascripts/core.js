
$(document).ready(function () {

    // Styles
    $('#home-featured li:odd').addClass('right');

    // PopUp
    /* Popup -> Opc */
    var tamanho = $('html').innerHeight();
    $('.popup').css('height', tamanho);

    /* Popup -> Close */
    $('sub').click(function () {
        $('.popup').fadeOut();
    });


    /* Popup -> Check Service */
    $('.check-service').mouseup(function () {
        $('.list-service').slideToggle();
    });

    // PopUps
    $('#hm-1').click(function () {
        $('.p-register').fadeIn();
        return false;
    });

    $('#hm-3').click(function () {
        $('.p-info').fadeIn();
        return false;
    });

    // Search
    $('#search-header small').click(function () {
        $('.sh-2, .sh-3').slideToggle();
    });

    $('ul#search-tabs li').not('.not-tab').click(function () {
        $('#search-tabs li').removeClass('active');
        $(this).addClass('active');
        return false;
    });

    // $('#sl-cont-list li big sup').click(function () {
    //     $(this).addClass('active');
    //     return false;
    // });

    $('ul#sg-list li:nth-child(3n)').css('margin-right', '0px');

    $('#search-tabs #st-list').click(function () {
        $('#search-list').fadeIn();
        $('#search-grid, #search #localinformation').hide();
    });

    $('#search-tabs #st-grid').click(function () {
        $('#search-grid').fadeIn();
        $('#search-list, #search #localinformation').hide();
    });

    $('#search-tabs #st-local').click(function () {
        $('#search-grid, #search-list').hide();
        $('#search #localinformation').fadeIn()
        return false;
    });

    // Search -> Select
    $('#search-select').on('change', function () {
        var $this = $(this),
            $value = $this.val();

        if ($value == "al") {
            $('.lb-list span').hide();
            $('.green').show();
        }
        if ($value == "il") {
            $('.lb-list span').hide();
            $('.blue').show();
        }
        if ($value == "rc") {
            $('.lb-list span').hide();
            $('.pink').show();
        }
        if ($value == "mc") {
            $('.lb-list span').hide();
            $('.orange').show();
        }
        if ($value == "ccrc") {
            $('.lb-list span').hide();
            $('.pink2').show();
        }
    });

    // Single Page

    // Single Page -> Like

    // Single Page -> Time
    $('#sp-header div span small.time').click(function () {
        $(this).addClass('active');
        return false;
    });

    // Single Page -> Tabs
    $('#sp-tabs li').click(function () {
        $('#sp-tabs li').removeClass('active');
        $(this).addClass('active');
        return false;
    });

    // Single Page -> Tabs -> Action
    $('.t-meet a').click(function () {
        $('#sp-c-content').slideDown();
        $('#sp-c-test').slideUp();
        return false;
    });
    $('.t-test a').click(function () {
        $('#sp-c-test').slideDown();
        $('#sp-c-content').slideUp();
        return false;
    });

    // Single Page -> yes no
    $('div.dining strong span small').click(function () {
        $(this).parent().find('small').removeClass('active');
        $(this).addClass('active');
    });
    $('div.dining strong span small.y').click(function () {
        $(this).parent().parent().find('input').val('y');
    });
    $('div.dining strong span small.n').click(function () {
        $(this).parent().parent().find('input').val('n');
    });

    // Single Page -> Content
    $('.t-pricing').click(function () {
        $('.tab-content').slideUp();
        $('#sp-content-pricing').slideDown();
    });
    $('.t-overview').click(function () {
        $('.tab-content').slideUp();
        $('#sp-content-overview').slideDown();
    });
    $('.t-care').click(function () {
        $('.tab-content').slideUp();
        $('#sp-content-care').slideDown();
    });
    $('.t-features').click(function () {
        $('.tab-content').slideUp();
        $('#sp-content-features').slideDown();
    });
    $('.t-culture').click(function () {
        $('.tab-content').slideUp();
        $('#sp-content-culture').slideDown();
    });

    // Single Page -> Tabs
    $('#sp-tabs li').click(function () {
        $('#sp-tabs li').removeClass('active');
        $(this).addClass('active');
    });

    // Single Page -> Comments -> Tabs
    $('#sp-c-tabs li a').click(function () {
        $('#sp-c-tabs li').removeClass('active');
        $(this).parent().addClass('active');
        return false;
    });

    // Single Page -> Contact -> Tabs
    $('ul#cc-tabs li').click(function () {
        $('ul#cc-tabs li').removeClass('active');
        $(this).addClass('active');
    });

    $('.t-call').click(function () {
        $('#cc-body fieldset').slideUp();
        $('#call-me').slideDown();
    });
    $('.t-mail').click(function () {
        $('#call-me').slideUp();
        $('#cc-body fieldset').slideDown();
    });

    // Single Page -> Show Number
    $('.shownumber').click(function () {
        $('#call-me strong').html( "&nbsp; " + $(this).data('phone-number') );
    });

    // Components -> Tooltip
    $('#sp-header div span small.time a').easyTooltip();
    $('#sl-cont-list li big sup a').easyTooltip();

    // Components -> Cycle
    $('ul#cycle-list').cycle({
        fx: 'fade',
        next: 'span#cycle-right',
        prev: 'span#cycle-left',
        after: onAfter
    });

    // Components -> Uniform
    $("input[type=checkbox]").uniform();

    // Components -> Tween
    $('ul#header-menu-alt li').borderRadius(3, 'px');
    $('#banner-find fieldset input.txt').borderRadiusCorner('top', 'left', 3, 'px');
    $('#banner-find fieldset input.txt').borderRadiusCorner('bottom', 'left', 3, 'px');
    $('.popup-cont').borderRadius(10, 'px');
    $('.register-form fieldset label input').borderRadius(5, 'px');
    $('.register-form fieldset big input').borderRadius(3, 'px');
    $('.info-left fieldset label.txt input').borderRadius(3, 'px');
    $('.info-left big label input').borderRadius(3, 'px');
    $('.popup-cont-footer input.bt').borderRadius(3, 'px');
    $('.list label input').borderRadius(3, 'px');
    $('.price-r textarea').borderRadius(3, 'px');
    $('.price-r .photo-gal big span').borderRadius(3, 'px');
    $('.price-r .photo-gal big span img').borderRadius(3, 'px');
    $('.price-r .photo-gal div label span').borderRadius(3, 'px');
    $('.price-r .photo-gal div label span img').borderRadius(3, 'px');
    $('.ok-bt .bt').borderRadius(3, 'px');
    $('#localinformation').borderRadius(5, 'px');
    $('#localinformation h2').borderRadius(2, 'px');
    $('#search-list').borderRadius(5, 'px');
    $('#search-grid').borderRadius(5, 'px');
    $('#about').borderRadius(5, 'px');
    $('#about h2').borderRadiusCorner('top', 'left', 5, 'px');
    $('#about h2').borderRadiusCorner('top', 'right', 5, 'px');
    $('#about').borderRadius(5, 'px');
    $('ul#sg-list li').borderRadius(7, 'px');
    $('#sp-content').borderRadius(5, 'px');
    $('#sp-c-content').borderRadius(5, 'px');
    $('#sp-c-test').borderRadius(5, 'px');
    $('#sp-header div span small.bt').borderRadius(3, 'px');
    $('ul#cycle-list li img').borderRadius(5, 'px');
    $('#sp-tabs li').borderRadiusCorner('top', 'right', 5, 'px');
    $('#sp-tabs li').borderRadiusCorner('top', 'left', 5, 'px');
    $('#sp-c-tabs li').borderRadiusCorner('top', 'right', 5, 'px');
    $('#sp-c-tabs li').borderRadiusCorner('top', 'left', 5, 'px');
    $('#sp-contact h2').borderRadiusCorner('top', 'left', 5, 'px');
    $('#sp-contact h2').borderRadiusCorner('top', 'right', 5, 'px');
    $('#sp-listing h2').borderRadiusCorner('top', 'left', 5, 'px');
    $('#sp-listing h2').borderRadiusCorner('top', 'right', 5, 'px');
    $('#contact-content').borderRadiusCorner('bottom', 'left', 5, 'px');
    $('#contact-content').borderRadiusCorner('bottom', 'right', 5, 'px');
    $('#listing-content').borderRadiusCorner('bottom', 'left', 5, 'px');
    $('#listing-content').borderRadiusCorner('bottom', 'right', 5, 'px');
    $('#listing-content ul li span.legend small').borderRadius(3, 'px');
    $('.sh-1 span').borderRadius(3, 'px');
    $('#banner-find span').borderRadius(3, 'px');
    $('ul#cc-tabs').borderRadiusCorner('top', 'left', 5, 'px');
    $('ul#cc-tabs').borderRadiusCorner('top', 'right', 5, 'px');
    $('ul#cc-tabs li:first-child').borderRadiusCorner('top', 'left', 5, 'px');
    $('#cc-body').borderRadiusCorner('bottom', 'left', 5, 'px');
    $('#cc-body').borderRadiusCorner('bottom', 'right', 5, 'px');
    $('#cc-body fieldset label input.txt').borderRadius(3, 'px');
    $('#cc-body fieldset label input.bt').borderRadius(3, 'px');
    $('#cc-body fieldset label textarea').borderRadius(3, 'px');
    $('#us h2').borderRadiusCorner('top', 'right', 5, 'px');
    $('#us h2').borderRadiusCorner('top', 'left', 5, 'px');
    $('#message h2').borderRadiusCorner('top', 'right', 5, 'px');
    $('#message h2').borderRadiusCorner('top', 'left', 5, 'px');
    $('#us-content').borderRadiusCorner('bottom', 'left', 5, 'px');
    $('#us-content').borderRadiusCorner('bottom', 'right', 5, 'px');
    $('#message-content').borderRadiusCorner('bottom', 'left', 5, 'px');
    $('#message-content').borderRadiusCorner('bottom', 'right', 5, 'px');
    $('#message-content fieldset label input').borderRadius(3, 'px');
    $('#message-content fieldset label textarea').borderRadius(3, 'px');
    $('ul#search-tabs li').borderRadiusCorner('top', 'left', 5, 'px');
    $('ul#search-tabs li').borderRadiusCorner('top', 'right', 5, 'px');
    $('#sl-cont-list li').borderRadius(5, 'px');
    $('#sl-cont-list li big span.lb small.lb-bt').borderRadius(3, 'px');
    $('ul#sg-list li big span.lb small').borderRadius(3, 'px');
    $('#easyTooltip').borderRadius(3, 'px');


    // Components -> Tween -> Shadow
    $('#localinformation').shadow('2px 2px 10px #ccc');
    $('#about').shadow('2px 2px 10px #ccc');
    $('#search-list').shadow('2px 2px 10px #ccc');
    $('#search-grid').shadow('2px 2px 10px #ccc');
    $('ul#sg-list li').shadow('2px 2px 5px #ddd');
    $('#sp-content').shadow('2px 2px 10px #ccc');
    $('#sp-c-content').shadow('2px 2px 10px #ccc');
    $('#sp-c-test').shadow('2px 2px 10px #ccc');
    $('#contact-content').shadow('2px 2px 10px #ccc');
    $('#listing-content').shadow('2px 2px 10px #ccc');
    $('#listing-content ul li span.legend small').shadow('2px 2px 5px #ccc');
    $('.sh-1 span').shadow('2px 2px 5px #ccc');
    $('#banner-find span').shadow('2px 2px 5px #ccc');
    $('#message-content').shadow('2px 2px 10px #ccc');
    $('#us-content').shadow('2px 2px 10px #ccc');
    $('#sl-cont-list li big span.lb small.lb-bt').shadow('2px 2px 5px #ccc');
    $('ul#sg-list li big span.lb small').shadow('2px 2px 5px #ccc');
    $('#easyTooltip').shadow('2px 2px 5px #ccc');
});

$(window).scroll(function () {
    if ($(window).scrollTop() > 320) {
        $('#sl-map').css({
            position: 'fixed',
            'top': '20px',
            'left': '50%',
            'margin-left': '167px'
        });
        $('.sh-2, .sh-3').slideUp();
    } else {
        $('#sl-map').css({
            position: 'relative',
            'top': 0,
            'left': '0',
            'margin-left': 0
        });
    }
});

function onAfter(curr, next, opts) {
    var caption = (opts.currSlide + 1) + ' / ' + opts.slideCount;
    $('span#cycle-counter').html(caption);
}