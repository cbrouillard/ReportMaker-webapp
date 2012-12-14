<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
</head>

<body>
<g:render template="/common/flashmessage"/>
&
<div class="row">
    <div class="span12">
        <div class="well">
            <h1><g:message code="report.list"/></h1>

            <p><g:message code="report.list.help"/></p>

            <p><g:link class="btn btn-primary" action="create"><g:message code="report.howto.create"/></g:link></p>
        </div>
    </div>
</div>

<table class="table table-striped table-hover">
    <g:each in="${reports}" var="report" status="i">
        <tr class="clickable" link="${createLink(action: 'edit', id: report.id)}">
            <g:render template="onereport" model="[report: report, editAction: true]"/>
        </tr>
    </g:each>
</table>

</body>
</html>