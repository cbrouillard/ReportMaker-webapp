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
        </div>
    </div>
</div>

<div id="navbarSpy" class="navbar navbar-static">
    <div class="navbar-inner">
        <div class="container" style="width: auto;">
            %{--<a class="brand" href="#">Project Name</a>--}%
            <ul class="nav">
                <li><a href="#step1"><g:message code="report.create.howto.step1"/></a></li>
                <li><a href="#step2"><g:message code="report.create.howto.step2"/></a></li>
                <li><a href="#step3"><g:message code="report.create.howto.step3"/></a></li>
            </ul>
        </div>
    </div>
</div>

<div data-spy="scroll" data-target="#navbarSpy" style="height:350px;overflow: auto;position: relative;">
    <h4 id="step1"><g:message code="report.create.howto.step1"/></h4>

    <p><g:message code="report.create.howto.step1.details"/></p>

    <p><g:message code="report.create.howto.step1.details.2"/></p>
    <hr/>

    <h4 id="step2"><g:message code="report.create.howto.step2"/></h4>

    <p><g:message code="report.create.howto.step2.details"/></p>
    <hr/>

    <h4 id="step3"><g:message code="report.create.howto.step3"/></h4>

    <p><g:message code="report.create.howto.step3.details"/></p>
    <hr/>

</div>

</body>
</html>