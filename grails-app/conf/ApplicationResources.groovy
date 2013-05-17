/**
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
modules = {
    application {
        resource url: 'js/application.js'
    }

    fileupload {
        resource url: 'js/jquery-file-upload/jquery.ui.widget.js'
        resource url: 'js/jquery-file-upload/jquery.iframe-transport.js'
        resource url: 'js/jquery-file-upload/jquery.fileupload.js'
    }

    autosize {
        resource url: 'js/autosize/jquery.autosize-min.js'
    }

    fancybox {
        resource url: 'js/fancybox/source/jquery.fancybox.pack.js?v=2.1.4'
        resource url: 'js/fancybox/source/jquery.fancybox.css?v=2.1.4'
    }

    'my-bootstrap-js' {
        defaultBundle configDefaultBundle
        dependsOn 'bootstrap-transition,bootstrap-alert,bootstrap-dropdown,bootstrap-modal,bootstrap-scrollspy,bootstrap-tab,bootstrap-tooltip,' +
                  'bootstrap-popover,bootstrap-button,bootstrap-carousel,bootstrap-typeahead,bootstrap-collapse,bootstrap-affix'
    }

    mybootstrap {
        defaultBundle 'bundle_bootstrap'
        dependsOn 'bootstrap-css'
        dependsOn 'my-bootstrap-js'
    }

    reveal{
        resource url: 'js/reveal/lib/js/head.min.js'
        resource url: 'js/reveal/lib/js/classList.js'
        resource url: 'js/reveal/js/reveal.min.js'
    }
}