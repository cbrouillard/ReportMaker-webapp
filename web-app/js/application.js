/*
 * Copyright (C) 2013 Cyril Brouillard <cyril.brouillard@gmail.com>
 *
 * This file is part of reportmaker.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
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
    $(".photo-display img, .thumbnail img").error(function () {
        //$(this).hide();
        var defaultPhoto = $(this).attr("def");
        alert(defaultPhoto);
        if (defaultPhoto != null) {
            $(this).attr('src', defaultPhoto);
        } else {
            $(this).attr('src', 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==');
        }
    });

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