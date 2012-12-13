<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
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
        <div class="well">
            <h2><g:message code="report.list"/></h2>

            <p><g:message code="report.list.help"/></p>
        </div>
    </div>
</div>

<table class="table table-striped">
    <g:each in="${reports}" var="report" status="i">
        <tr>
            <td><img src="${resource(dir: 'images', file: 'mars.png')}" alt="[.]"/></td>
            <td>
                <div>
                    <h4>${report.name}</h4>

                    <div>[ <g:formatDate date="${report.date}" formatName="format.date.toDayAndTime"/> ]</div>

                    <div>${report.one.name} VS ${report.two.name}</div>
                </div>
            </td>
            <td class="center">Actions</td>
        </tr>
    </g:each>
</table>

</body>
</html>