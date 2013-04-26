<td class="sized48 center middle" xmlns="http://www.w3.org/1999/html"><img
        src="${resource(dir: 'images', file: 'mars.png')}" alt="[.]"/></td>
<td>

    <g:if test="${editInfosAvailable}">
        <div class="input-invisible">

            <div class="control-group">
                <label class="control-label" for="name">Nom</label>

                <div class="controls">
                    <div class="input-prepend">
                        <span class="add-on"><i class="icon-pencil"></i></span>
                        <g:textField name="name" value="${report.name}" class="h2 input-xlarge"/>
                    </div>
                </div>
            </div>


            <div class="control-group">
                <label class="control-label" for="name"><g:message code="report.date"/></label>

                <div class="controls">
                    <div class="input-prepend">
                        <span class="add-on"><i class="icon-pencil"></i></span>
                        <g:textField name="date" class="datepicker" readonly="true"
                                     value="${formatDate(date: report.date, formatName: "format.date.toDay")}"/>
                    </div>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">Joueurs</label>

                <div class="controls">
                    <div class="input-prepend">
                        <span class="add-on"><i class="icon-pencil"></i></span>
                        <g:textField name="one.name" value="${report.one.name}" class="h4"/>
                    </div> VS
                    <div class="input-prepend">
                        <span class="add-on"><i class="icon-pencil"></i></span>
                        <g:textField name="two.name" value="${report.two.name}" class="h4"/>
                    </div>
                </div>
            </div>
        </div>
    </g:if>
    <g:else>
        <div>
            <h2>${report.name}</h2>

            <span class="label label-info"><g:message code="report.date"/> : <g:formatDate date="${report.date}"
                                                                                           formatName="format.date.toDay"/></span>
            <h4>${report.one.name} VS ${report.two.name}</h4>
        </div>
    </g:else>
</td>
<td class="middle actions">
    <div id="actionreport-${report.id}">

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
            <g:link controller="export" action="pdf" id="${report.id}" data-toggle="tooltip"
                    title="${message(code: 'report.export.pdf.tooltip')}"><img src="${resource(dir: 'images',
                    file: 'pdf.png')}"
                                                                               alt="PDF"/></g:link><br/>PDF
        </span>

        <span>
            <g:link controller="export" action="bbcode" id="${report.id}" data-toggle="tooltip"
                    title="${message(code: 'report.export.bbcode.tooltip')}"><img
                    src="${resource(dir: 'images', file: 'bb-code.png')}" alt="BB-Code"/></g:link><br/>BB-Code
        </span>

        <span>
            <g:link controller="export" action="html" id="${report.id}" data-toggle="tooltip"
                    title="${message(code: 'report.export.html.tooltip')}"><img
                    src="${resource(dir: 'images', file: 'html.png')}" alt="HTML"/></g:link><br/>HTML
        </span>
    </div>

</td>