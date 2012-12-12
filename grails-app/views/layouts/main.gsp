<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'twr.css')}" type="text/css">
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">--}%

    <r:require modules="bootstrap"/>

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
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="${createLink(uri: '/')}"><g:message code="app.name"/></a>

            <div class="nav-collapse collapse">
                <p class="navbar-text pull-right"><g:message code="hello"/> <sec:username/> ! <sec:ifLoggedIn>
                    <g:link controller="logout" class="logout">
                        <g:message code="logout"/> <i class="icon-off icon-white"></i>
                    </g:link>
                </sec:ifLoggedIn></p>

            </div><!--/.nav-collapse -->
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
                <p class="navbar-text pull-center">© BROUILLARD Cyril - 2012 - <g:message
                        code="app.name"/> - <g:message code="app.disclaimer"/></p>
            </div>
        </div>
    </div>
</div>


<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<g:javascript library="application"/>
<r:layoutResources/>
</body>
</html>
