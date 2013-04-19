<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
</head>

<body>
<div class="well">
    <h1><g:message code="report.list"/></h1>

    <p><g:message code="report.list.help"/></p>

</div>
<g:render template="/common/flashmessage"/>
<div id="deleteMessage"></div>

<g:if test="${reports}">
    <table class="table table-striped table-hover">
        <g:each in="${reports}" var="report" status="i">
            <tr id="report-${report.id}" class="clickable" link="${createLink(action: 'edit', id: report.id)}">
                <g:render template="onereport" model="[report: report, editAction: true]"/>
            </tr>
        </g:each>
    </table>
</g:if>
<g:else>
    <div class="alert alert-info">
        <g:message code="report.list.noreports"/>
        <g:link class="btn btn-primary" action="create"><g:message code="report.howto.create"/></g:link>
    </div>
</g:else>

<script type="text/javascript">
    var deleteReport = function (reportId) {
        if (confirm("${message (code:'report.deletion.confirm')}")) {
            $.ajax('${createLink(controller: 'report', action:"delete")}' + "/" + reportId, {type: 'POST',
                success: function (data, textStatus, ajax) {
                    $("#deleteMessage").html(data);
                    $("#report-"+reportId).fadeTo(500, 0.3);
                    $("#actionreport-"+reportId).fadeOut();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("${message(code:'report.deletion.error')} ("+errorThrown+")")
                }

            })
        }
    }
</script>

</body>
</html>