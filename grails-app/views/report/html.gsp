<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='export'/>
</head>

<body>

<div class="row">

    <div class="span10 report-title">
        <h1>${report.name}</h1>
    </div>

    <div class="span2">
        <div class="pull-right">
            <span class="label label-info"><i class="icon-calendar icon-white"></i> <g:formatDate date="${report.date}"
                                                                                                  formatName="format.date.toDay"/>
            </span>

            <span class="label label-success"><i
                    class="icon-user icon-white"></i> ${report.one.name} vs ${report.two.name}</span>

            <span class="label label-warning"><i class="icon-hand-right icon-white"></i> ${report.format} points</span>
        </div>

    </div>

</div>

<h4>Avant la partie :</h4>

<div class="row">

    <div class="span6">

        <dl>
            <dt><g:message code="report.deployment.type"/></dt>
            <dd>${report.deploymentType}</dd>

            <dt><g:message code="report.scenario"/></dt>
            <dd>${report.scenario}</dd>

            <dt><g:message code="report.lordcapacity" args="${[report.one.name]}"/></dt>
            <dd>${report.lordCapacity1}</dd>

            <dt><g:message code="report.lordcapacity" args="${[report.two.name]}"/></dt>
            <dd>${report.lordCapacity2}</dd>
        </dl>

    </div>

    <div class="span6">

        <ul class="thumbnails">
            <li class="span6">
                <div class="thumbnail">
                    <img src="${createLink(url: "/twr/${report.id}/table.jpg")}" alt=""/>

                    <span class="label label-info"><i class="icon-camera"></i> <g:message code="report.photo.table"/>
                    </span>
                </div>
            </li>
        </ul>
    </div>
</div>

<h4>Déploiement :</h4>
<div class="row">
    <div class="span6">
        <ul class="thumbnails">
            <li class="span6">
                <div class="thumbnail">
                    <img src="${createLink(url: "/twr/${report.id}/deployment_j1.jpg")}" alt=""/>

                    <span class="label label-info"><i class="icon-camera"></i> <g:message code="report.photo.deployment"
                                                                                          args="${[report.one.name]}"/>
                    </span>
                </div>
            </li>
        </ul>
    </div>

    <div class="span6">
        <ul class="thumbnails">
            <li class="span6">
                <div class="thumbnail">
                    <img src="${createLink(url: "/twr/${report.id}/deployment_j2.jpg")}" alt=""/>

                    <span class="label label-info"><i class="icon-camera"></i> <g:message code="report.photo.deployment"
                                                                                          args="${[report.two.name]}"/>
                    </span>
                </div>
            </li>
        </ul>
    </div>
</div>

</body>
</html>