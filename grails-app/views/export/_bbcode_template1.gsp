<div class="row">

    <div class="span9 report-title">
        <h1>${report.name}

            <g:render template="/export/share"/></h1>
    </div>

    <div class="span3 ">
        <div class="pull-right around-border">
            <span class="label label-info btn-block"><i class="icon-calendar icon-white"></i> <g:formatDate
                    date="${report.date}"
                    formatName="format.date.toDay"/>
            </span>

            <g:if test="${report.one.name && report.two.name}">
                <span class="label label-success btn-block"><i
                        class="icon-user icon-white"></i> ${report.one.name} vs ${report.two.name}</span>
            </g:if>

            <g:if test="${report.one.race && report.two.race}">
                <span class="label label-success btn-block"><i
                        class="icon-user icon-white"></i> ${report.one.race} vs ${report.two.race}</span>
            </g:if>

            <g:if test="${report.format}">
                <span class="label label-warning btn-block"><i
                        class="icon-hand-right icon-white"></i> ${report.format} points</span>
            </g:if>
        </div>

        <div class="clearfix">&nbsp;</div>

    </div>

</div>

<div class="row">
    <div class="span12">
        <div class="alert alert-info"><g:message code="report.export.bbcode.informations"/></div>
    </div>
</div>

<div class="row">
    <div class="span12">
        <div class="around-border">

            [b]${report.name}[/b]<br/>
            <br/>
            Rapport de bataille généré par TWR.<br/>
            <br/>
            [quote]<g:message code="report.date"/> : <g:formatDate date="${report.date}"
                                                                   formatName="format.date.toDay"/><br/>
            ${report.one.name} vs ${report.two.name}<br/>
            <g:if test="${report.one.race && report.two.race}">
                ${report.one.race} vs ${report.two.race}<br/>
            </g:if>
            <g:if test="${report.format}">
                Format : ${report.format} points<br/>
            </g:if>[/quote]<br/>
            <br/>
            [img <a
                href="${createLink(absolute: true, uri: "/twr/${report.id}/table.jpg")}">${createLink(absolute: true, uri: "/twr/${report.id}/table.jpg")}</a>]

        </div>
    </div>

</div>