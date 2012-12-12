<html>
<head>
    <meta name='layout' content='main'/>
    <title><g:message code="springSecurity.login.title"/></title>
    <style type='text/css' media='screen'>
    .form-signin {
        max-width: 350px;
        padding: 19px 29px 29px;
        /*margin: 0 auto 20px;*/
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
        -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
        box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
    }

    .form-signin .form-signin-heading,
    .form-signin .checkbox {
        margin-bottom: 10px;
    }

    .form-signin input[type="text"],
    .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
    }

    .or {
        text-align: center;
        font-size: 20px;
        font-weight: bold;
        padding-bottom: 20px;
        margin-right: 40px;
    }
    </style>
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

    <div class="span6">
        Description
    </div>

    <div class="span6">

        <form class="form-signin" action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
            <h4 class="form-signin-heading alert alert-info"><g:message code="login.please.signin"/></h4>
            <input type="text" class="input-block-level" placeholder="${message(code: 'login.username')}"
                   name='j_username' required="true">
            <input type="password" class="input-block-level" placeholder="${message(code: 'login.password')}"
                   name='j_password' required="true">
            <label class="checkbox">
                <input type="checkbox" name='${rememberMeParameter}'
                       <g:if test='${hasCookie}'>checked='checked'</g:if>><g:message code="login.rememberme"/>
            </label>
            <button class="btn btn-large btn-primary" type="submit"><g:message code="login.submit"/></button>
            %{--<g:link action="register" class=""><g:message code="login.noaccount"/></g:link>--}%
        </form>

        <div class="or"><g:message code="or"/></div>

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

<script type='text/javascript'>
    <!--
    (function () {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->

</script>
</body>
</html>
