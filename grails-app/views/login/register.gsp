<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
    <title><g:message code="register.title"/></title>
</head>

<body>
<div class="row">
    <div class="span12">
        <g:if test='${flash.message}'>
            <div class="alert alert-error">${flash.message}</div>
        </g:if>
    </div>
</div>

<div class="row">

    <div class="span12">
        <g:form class="form-signin" method='POST' action="apply" autocomplete='off'>
            <h4 class="form-signin-heading alert alert-warning"><g:message code="register.heading"/></h4>
            <g:textField name="username" placeholder="${message(code: 'register.username')}" class="input-block-level"
                         required="true"/>
            <g:textField name="email" placeholder="${message(code: 'register.email')}" class="input-block-level"
                         required="true"/>
            <g:passwordField name="password" placeholder="${message(code: 'register.password')}"
                             class="input-block-level" required="true"/>

            <button class="btn btn-large btn-warning" type="submit"><g:message code="register.submit"/></button>
            <g:message code="register.humor"/>
        </g:form>
    </div>

</div>

</body>
</html>