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
            <h1><g:message code="report.list"/></h1>

            <p><g:message code="report.list.help"/></p>

            <p><g:link class="btn btn-primary" action="create"><g:message code="report.howto.create"/></g:link></p>
        </div>
    </div>
</div>

<table class="table table-striped table-hover">
    <g:each in="${reports}" var="report" status="i">
        <tr class="clickable" link="${createLink(action: 'edit', id: report.id)}">
            <td class="sized48 center middle"><img src="${resource(dir: 'images', file: 'mars.png')}" alt="[.]"/></td>
            <td>
                <div>
                    <h2>${report.name}</h2>

                    <span class="label label-info">[ <g:formatDate date="${report.date}"
                                                                   formatName="format.date.toDayAndTime"/> ]</span>
                    <h4>${report.one.name} VS ${report.two.name}</h4>
                </div>
            </td>
            <td class="center middle actions">
                <g:link action="edit" id="${report.id}"><img src="${resource(dir: 'images', file: 'edit.png')}"
                                                             alt="Edit"/></g:link>
                <g:link action="pdf" id="${report.id}"><img src="${resource(dir: 'images', file: 'pdf.png')}"
                                                            alt="PDF"/></g:link>
                <g:link action="code" params="[type: 'bbcode']" id="${report.id}"><img
                        src="${resource(dir: 'images', file: 'bb-code.png')}" alt="BB-Code"/></g:link>
            </td>
        </tr>
    </g:each>
</table>

</body>
</html>