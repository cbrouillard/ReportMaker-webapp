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
    C'est la dernière étape ! Vous pourrez vous connecter immédiatement après.<br/>

        <a class="btn btn-primary"
           href="${createLink(controller: 'login', action: 'validate', id: token, absolute: true)}">
            ${createLink(controller: 'login', action: 'validate', id: token, absolute: true)}
        </a>

    </div>
</div>
</body>
</html>