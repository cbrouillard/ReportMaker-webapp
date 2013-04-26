<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
</head>

<body>
<g:render template="/common/flashmessage"/>
<div class="row">
    <div class="span12">
        <div class="well">
            <h1><g:message code="report.create.howto"/></h1>

            <p><g:message code="report.create.howto.help"/></p>
        </div>
    </div>
</div>

<div>
    <h4 id="step1"><g:message code="report.create.howto.step1"/></h4>

    <p><g:message code="report.create.howto.step1.details"/></p>

    <p><g:message code="report.create.howto.step1.details.2"/></p>
    <hr/>

    <h4 id="step2"><g:message code="report.create.howto.step2"/></h4>

    <p><g:message code="report.create.howto.step2.details"/></p>

    <div class="center around-border">
        <img src="${resource(dir: 'images/mobapp', file: 'creer.png')}"
             alt="[TWR - Mobile - Créer]" width="300px"/>

        <img
                src="${resource(dir: 'images/mobapp', file: 'edition.png')}"
                alt="[TWR - Mobile - Edition]" width="300px"/>

        <img
                src="${resource(dir: 'images/mobapp', file: 'zoom.png')}"
                alt="[TWR - Mobile - Zoom]" width="300px"/>

    </div>
    <hr/>

    <h4 id="step3"><g:message code="report.create.howto.step3"/></h4>

    <p><g:message code="report.create.howto.step3.details"/></p>
    <hr/>

</div>

</body>
</html>