<%@ page contentType="text/html" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'twr.css')}" type="text/css"/>
</head>

<body>

<div class="span12">
    <div class="well"
         style="background-color: #F5F5F5;border: 2px solid #cccccc;min-height: 20px;padding: 10px;margin-bottom: 10px;">
        <h2>Bienvenue sur <g:message code="app.name"/> !</h2>
    </div>

    <div class="row-fluid">

        <strong>${person.username}</strong>, suivez ce lien afin de valider votre compte.
    C'est la dernière étape ! Vous pourrez vous connecter immédiatement après.<br/><br/>

        <div class="well"
             style="background-color: #F5F5F5;border: 2px solid #cccccc;min-height: 20px;padding: 10px;margin-bottom: 10px;">
            <a class="btn btn-primary"
               href="http://www.tacticalwarreport.com/login/validate/${token}">
                http://www.tacticalwarreport.com/login/validate/${token}
            </a><br/><br/><br/>
        </div>

        En cas de problème, ne pas hésiter à <a href="mailto:cyril@tacticalwarreport.com">contacter le support</a>.
        <br/><br/>

        ---------------------------------<br/>
        TWR - Tactical War Report<br/>
        Logiciel de création de rapport de bataille.

    </div>
</div>
</body>
</html>