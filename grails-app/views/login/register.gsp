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
        <g:if test="${flash.message}">
            <div class="alert alert-info">
                ${flash.message}
            </div>
        </g:if>

        <g:hasErrors bean="${personInstance}">
            <div class="alert alert-error">
                <ul class="errors" role="alert">
                    <g:eachError bean="${personInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>
    </div>

</div>

<div class="row">

    <div class="span12">
    %{--autocomplete='off'--}%
        <g:form class="form-signin" method='POST' action="apply">
            <h4 class="form-signin-heading alert alert-warning"><g:message code="register.heading"/></h4>
            <g:textField name="username" placeholder="${message(code: 'register.username')}"
                         class="${hasErrors(bean: personInstance, field: 'username', 'error')} input-block-level "
                         required="true" value="${personInstance?.username}"/>
            <g:textField name="email" placeholder="${message(code: 'register.email')}"
                         class="input-block-level ${hasErrors(bean: personInstance, field: 'email', 'error')}"
                         required="true" value="${personInstance?.email}"/>
            <g:passwordField name="password" placeholder="${message(code: 'register.password')}"
                             class="input-block-level ${hasErrors(bean: personInstance, field: 'password', 'error')}"
                             required="true"/>

            <button class="btn btn-large btn-warning" type="submit"><g:message code="register.submit"/></button>
            <g:message code="register.humor"/>
        </g:form>
    </div>

</div>

</body>
</html>