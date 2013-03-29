<html>
<head>
    <meta name='layout' content='export'/>
</head>

<body>
<g:render template="/common/flashmessage"/>

<div class="row">

    <div class="span6 justify">
        <div class="well">

            <p>Tactical War Report (TWR) est une application facilitant la rédaction de rapports de bataille pour vos parties de wargame.</p>

            <p>En quelques étapes, rédigez et partagez vos rapports de bataille:</p>

            <ul>
                <li>téléchargez l'application pour votre appareil Android</li>
                <li>créez votre rapport à partir de votre appareil mobile</li>
                <li>jouez votre partie tout en prenant notes et photos</li>
                <li>envoyez le tout sur votre compte TWR en ligne</li>
                <li>partagez !</li>
            </ul>

            <p>C'est simple et c'est gratuit !</p>
            <a class="btn btn-large btn-success"
               href="https://play.google.com/store/apps/details?id=com.headbangers.reportmaker"><g:message
                    code="download.mobile.app"/></a>
            <g:link class="btn btn-large btn-warning" action="register"><g:message code="login.noaccount"/></g:link>
        </div>

    </div>

    <div class="span6">

        <form class="form-signin" action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
            <h2 class="form-signin-heading alert alert-info"><g:message code="login.please.signin"/></h2>
            <input type="text" class="input-block-level" placeholder="${message(code: 'login.username')}"
                   name='j_username' required="true">
            <input type="password" class="input-block-level" placeholder="${message(code: 'login.password')}"
                   name='j_password' required="true">
            <label class="checkbox">
                <input type="checkbox" name='${rememberMeParameter}'
                       <g:if test='${hasCookie}'>checked='checked'</g:if>><g:message code="login.rememberme"/>
            </label>
            <button class="btn btn-large btn-primary" type="submit"><g:message code="login.submit"/></button>
        </form>

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
