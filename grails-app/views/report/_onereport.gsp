<td class="sized48 center middle"><img src="${resource(dir: 'images', file: 'mars.png')}" alt="[.]"/></td>
<td>
    <div>
        <h2>${report.name}</h2>

        <span class="label label-info"><g:message code="report.date"/> : <g:formatDate date="${report.date}"
                                                       formatName="format.date.toDay"/></span>
        <h4>${report.one.name} VS ${report.two.name}</h4>
    </div>
</td>
<td class="middle actions">

    <g:if test="${editAction}">
        <span>
            <g:link action="edit" id="${report.id}"><img src="${resource(dir: 'images', file: 'edit.png')}"
                                                         alt="Edit"/></g:link><br/>Editer
        </span>
    </g:if>

    <span>
        <g:link action="pdf" id="${report.id}"><img src="${resource(dir: 'images', file: 'pdf.png')}"
                                                    alt="PDF"/></g:link><br/>PDF
    </span>

    <span>
        <g:link action="code" params="[type: 'bbcode']" id="${report.id}"><img
                src="${resource(dir: 'images', file: 'bb-code.png')}" alt="BB-Code"/></g:link><br/>BB-Code
    </span>

    <span>
        <g:link action="code" params="[type: 'html']" id="${report.id}"><img
                src="${resource(dir: 'images', file: 'html.png')}" alt="HTML"/></g:link><br/>HTML
    </span>
</td>