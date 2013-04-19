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
            <a href="javascript:deleteReport('${report.id}');" data-toggle="tooltip"
               title="${message(code: 'report.delete.tooltip')}">
                <img src="${resource(dir: 'images', file: 'trash2.png')}" alt="Edit"/></a><br/>Supprimer

        </span>

        <span>
            <g:link controller="report" action="edit" id="${report.id}" data-toggle="tooltip"
                    title="${message(code: 'report.edit.tooltip')}"><img src="${resource(dir:
                    'images', file: 'edit.png')}"
                                                                         alt="Edit"/></g:link><br/>Editer
        </span>
    </g:if>

    <span>
        <g:link controller="report" action="pdf" id="${report.id}" data-toggle="tooltip"
                title="${message(code: 'report.export.pdf.tooltip')}"><img src="${resource(dir: 'images',
                file: 'pdf.png')}"
                                                                           alt="PDF"/></g:link><br/>PDF
    </span>

    <span>
        <g:link controller="report" action="code" params="[type: 'bbcode']" id="${report.id}" data-toggle="tooltip"
                title="${message(code: 'report.export.bbcode.tooltip')}"><img
                src="${resource(dir: 'images', file: 'bb-code.png')}" alt="BB-Code"/></g:link><br/>BB-Code
    </span>

    <span>
        <g:link controller="report" action="code" params="[type: 'html']" id="${report.id}" data-toggle="tooltip"
                title="${message(code: 'report.export.html.tooltip')}"><img
                src="${resource(dir: 'images', file: 'html.png')}" alt="HTML"/></g:link><br/>HTML
    </span>

</td>