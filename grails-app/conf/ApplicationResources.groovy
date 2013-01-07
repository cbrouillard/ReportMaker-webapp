modules = {
    application {
        resource url: 'js/application.js'
    }

    fileupload {
        dependsOn 'jquery', 'jquery-ui'
        resource url: 'js/jquery-file-upload/jquery.ui.widget.js'
        resource url: 'js/jquery-file-upload/jquery.iframe-transport.js'
        resource url: 'js/jquery-file-upload/jquery.fileupload.js'
    }
}