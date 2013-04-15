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
    <r:require modules="jquery-ui, fileupload, autosize"/>
    <style>
    body {
        padding-top: 60px;
        padding-bottom: 40px;
    }
    </style>

    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body data-spy="scroll" data-target="#navbarSpy">

<sec:ifNotLoggedIn>
    <header class="epic">
        <div class="span1">
            <img width="100px" src="${resource(dir: 'images', file: 'icone.png')}" alt="[TWR]"/>
        </div>

        <div class="span11">
            <h1>${message(code: 'app.name')}</h1>

        </div>

        <div class="clearfix">&nbsp;</div>

    </header>
</sec:ifNotLoggedIn>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="brand" href="${createLink(uri: '/')}"><strong><g:message code="app.name"/></strong></a>

            <sec:ifLoggedIn>
                <ul class="nav">
                    <li class="dropdown">

                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <g:message code="reports"/>
                            <b class="caret"></b>
                        </a>

                        <ul class="dropdown-menu">
                            <li>
                                <g:link controller="report" action="list">
                                    <i class="icon-picture"></i> <g:message code="report.list"/>
                                </g:link>
                            </li>

                            <li>
                                <a href="#createReport" data-toggle="modal">
                                    <i class="icon-plus"></i> <g:message code="report.new"/>
                                </a>
                            </li>
                        </ul>

                    </li>
                </ul>
            </sec:ifLoggedIn>

            <sec:ifLoggedIn>
                <ul class="nav pull-right">
                    <li class="dropdown">

                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <g:message code="configuration"/> [<sec:username/>] <b class="caret"></b>
                        </a>

                        <ul class="dropdown-menu">
                            <li>
                                <g:link controller="person" action="profile">
                                    <i class="icon-user"></i> <g:message code="person.profile"/>
                                </g:link>
                            </li>

                            <li>
                                <a data-toggle="modal" href="#changepass"><i class="icon-lock"></i> <g:message
                                        code="person.infos.changepass"/></a>
                            </li>

                        </ul>

                    </li>
                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <li>
                            <g:link controller="metadataPhoto">
                                <g:message code="admin"/>
                            </g:link>
                        </li>
                    </sec:ifAllGranted>
                    <li>
                        <g:link controller="logout" class="logout">
                             <g:message code="logout"/> <i class="icon-off icon-white"></i>
                        </g:link>
                    </li>
                </ul>

            </sec:ifLoggedIn>
        </div>
    </div>
</div>


%{--<header class="jumbotron subhead">--}%
%{--<div class="container">--}%
%{--<h1>JavaScript</h1>--}%
%{--<p class="lead">Bring Bootstrap's components to life&mdash;now with 13 custom jQuery plugins.--}%
%{--</div>--}%
%{--</header>--}%



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

<g:form controller="report" action="add" method="post">
    <div id="createReport" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

            <h3 id="myModalLabel"><g:message code="report.new"/></h3>
        </div>


        <div class="modal-body">

            <label><g:message code="report.name"/></label>
            <g:textField name="name" required="true" placeholder="${message(code: 'report.name.hint')}"
                         class="input-xlarge"/>

            <label><g:message code="report.player1.name"/></label>
            <g:textField name="player1" placeholder="${message(code: 'report.player1.name.hint')}"
                         class="input-xlarge"/>

            <label><g:message code="report.player2.name"/></label>
            <g:textField name="player2" placeholder="${message(code: 'report.player2.name.hint')}"
                         class="input-xlarge"/>

            <div class="alert alert-info">
                <g:message code="report.create.help"/>
            </div>

        </div>

        <div class="modal-footer">
            <button class="btn btn-primary"><g:message code="create"/></button>
        </div>
    </div>
</g:form>

<g:formRemote method="post" name="changePassForm" url="[controller: 'person', action: 'changePass']" update="message">
    <div id="changepass" class="modal hide fade">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

            <h3><g:message
                    code="person.infos.changepass"/></h3>
        </div>

        <div class="modal-body">
            <div id="message"></div>

            <label><g:message code="person.change.pass"/></label>
            <g:passwordField name="pass" required="true"/>
            <label><g:message code="person.change.pass.check"/></label>
            <g:passwordField name="passCheck" required="true"/>
        </div>

        <div class="modal-footer">
            <g:actionSubmit value="${message(code:'change')}" class="btn btn-primary"/>
        </div>
    </div>
</g:formRemote>

%{--<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>--}%
<g:javascript library="application"/>
<r:layoutResources/>
</body>
</html>
