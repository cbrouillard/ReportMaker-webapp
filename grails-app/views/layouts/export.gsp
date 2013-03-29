<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:message code="app.name"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'twr.css')}" type="text/css">
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">--}%

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <r:require modules="bootstrap"/>
    <r:require modules="jquery-ui, fileupload"/>
    <style>
    body {
        padding-top: 60px;
        padding-bottom: 40px;
    }
    </style>

    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            %{--<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">--}%
            %{--<span class="icon-bar"></span>--}%
            %{--<span class="icon-bar"></span>--}%
            %{--<span class="icon-bar"></span>--}%
            %{--</a>--}%
            <a class="brand" href="${createLink(uri: '/')}"><g:message code="app.name"/></a>

            %{--<div class="nav-collapse collapse">--}%

            %{--</div><!--/.nav-collapse -->--}%

            <p class="navbar-text pull-right"><g:message code="hello"/> <sec:username/> ! <sec:ifLoggedIn>
                <g:link controller="logout" class="logout">
                    <i class="icon-off icon-white"></i>
                </g:link>
            </sec:ifLoggedIn></p>
        </div>
    </div>
</div>

<div class="container">
    <g:layoutBody/>
</div>

<div id="footer">
    <div class="navbar navbar-inverse navbar-fixed-bottom">
        <div class="navbar-inner">
            <div class="container-fluid">

                <p class="navbar-text pull-left">© BROUILLARD Cyril - 2013 - <g:message
                        code="app.name"/> - <g:message code="app.disclaimer"/></p>

                <div class="navbar-text pull-right dons">

                    <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                        <input type="hidden" name="cmd" value="_s-xclick"/>
                        <input type="hidden" name="encrypted"
                               value="-----BEGIN PKCS7-----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-----END PKCS7-----"/>
                        <input type="image" src="${resource(dir: 'images', file: 'btn_donate_SM.png')}" border="0"
                               name="submit"
                               alt="PayPal - la solution de paiement en ligne la plus simple et la plus sécurisée !"
                               style="background-color: transparent;border:none;"/>
                        <img alt="" border="0" src="https://www.paypalobjects.com/fr_FR/i/scr/pixel.gif" width="1"
                             height="1"/>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>


%{--<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>--}%
<g:javascript library="application"/>
<r:layoutResources/>
</body>
</html>
