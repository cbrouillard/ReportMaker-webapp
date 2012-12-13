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
        </div>
    </div>
</div>

<table class="table table-striped table-hover">
    <g:each in="${reports}" var="report" status="i">
        <tr>
            <td class="sized48 center middle"><img src="${resource(dir: 'images', file: 'mars.png')}" alt="[.]"/></td>
            <td>
                <div>
                    <h2>${report.name}</h2>

                    <span class="label label-info">[ <g:formatDate date="${report.date}"
                                                                   formatName="format.date.toDayAndTime"/> ]</span>
                    <h4>${report.one.name} VS ${report.two.name}</h4>
                </div>
            </td>
            <td class="center middle">
                EDIT PDF BBCODE
            </td>
        </tr>
    </g:each>
</table>

</body>
</html>