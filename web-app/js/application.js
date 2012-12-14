if (typeof jQuery !== 'undefined') {
    (function ($) {
        $('#spinner').ajaxStart(function () {
            $(this).fadeIn();
        }).ajaxStop(function () {
                $(this).fadeOut();
            });
    })(jQuery);
}

jQuery(function () {
    registerClickableTr();
})

var registerClickableTr = function () {
    $('tr.clickable td:not(.actions)').click(function () {
        window.location = $(this).parent('tr').attr('link');
    });
    $('tr.clickable-blank td:not(.actions)').click(function () {
        window.open($(this).parent('tr').attr('link'));
    });
    $('a.disabled').click(function () {
        return false;
    });
}