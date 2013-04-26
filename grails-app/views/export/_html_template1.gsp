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

<h4>Avant la partie :</h4>

<div class="row">

    <div class="span4">
        <div class="around-border">
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

    </div>

    <div class="span8">

        <ul class="thumbnails">
            <li class="span8">
                <div class="thumbnail">
                    <span class="label label-info"><i class="icon-camera"></i> <g:message code="report.photo.table"/>
                    </span>
                    <a href="${createLink(url: "/twr/${report.id}/table.jpg")}" class="nivoZoom">
                        <img src="${createLink(url: "/twr/${report.id}/table.jpg")}" alt=""
                             def="${resource(dir: 'images', file: 'default-no-image.png')}"/>

                        <div class="nivoCaption"><g:message code="report.photo.table"/></div>
                    </a>
                </div>
            </li>
        </ul>
    </div>
</div>

<h4>Déploiement :</h4>

<g:set var="numSecond" value="${report.firstPlayer == 1 ? 2 : 1}"/>
<g:set var="firstP" value="${report.first}"/>
<g:set var="secondP" value="${report.second}"/>

<div class="row deployment">
    <div class="span6">
        <ul class="thumbnails">
            <li class="span6">
                <div class="thumbnail">

                    <span class="label label-info"><i class="icon-camera"></i> <g:message code="report.photo.deployment"
                                                                                          args="${[firstP.name]}"/>
                    </span>
                    <img src="${createLink(url: "/twr/${report.id}/deploiement_j${firstP.num}.jpg")}" alt=""
                         def="${resource(dir: 'images', file: 'default-no-image.png')}"/>
                </div>
            </li>
        </ul>
    </div>

    <div class="span6">
        <ul class="thumbnails">
            <li class="span6">
                <div class="thumbnail">

                    <span class="label label-info"><i class="icon-camera"></i> <g:message code="report.photo.deployment"
                                                                                          args="${[secondP.name]}"/>
                    </span>
                    <img src="${createLink(url: "/twr/${report.id}/deploiement_j${numSecond}.jpg")}" alt=""
                         def="${resource(dir: 'images', file: 'default-no-image.png')}"/>
                </div>
            </li>
        </ul>
    </div>
</div>

<h4>Infiltration :</h4>

<div class="row infiltration">
    <div class="span6">
        <ul class="thumbnails">
            <li class="span6">
                <div class="thumbnail">

                    <span class="label label-info"><i class="icon-camera"></i> <g:message
                            code="report.photo.infiltration"
                            args="${[firstP.name]}"/>
                    </span>
                    <img src="${createLink(url: "/twr/${report.id}/infiltration_j${firstP.num}.jpg")}" alt=""
                         def="${resource(dir: 'images', file: 'default-no-image.png')}"/>
                </div>
            </li>
        </ul>
    </div>

    <div class="span6">
        <ul class="thumbnails">
            <li class="span6">
                <div class="thumbnail">

                    <span class="label label-info"><i class="icon-camera"></i> <g:message
                            code="report.photo.infiltration"
                            args="${[secondP.name]}"/>
                    </span>
                    <img src="${createLink(url: "/twr/${report.id}/infiltration_j${numSecond}.jpg")}" alt=""
                         def="${resource(dir: 'images', file: 'default-no-image.png')}"/>
                </div>
            </li>
        </ul>
    </div>
</div>

<h4>Mouvement scoot :</h4>

<div class="row scoot">
    <div class="span6">
        <ul class="thumbnails">
            <li class="span6">
                <div class="thumbnail">

                    <span class="label label-info"><i class="icon-camera"></i> <g:message code="report.photo.scooting"
                                                                                          args="${[firstP.name]}"/>
                    </span>
                    <img src="${createLink(url: "/twr/${report.id}/scoot_j${firstP.num}.jpg")}" alt=""
                         def="${resource(dir: 'images', file: 'default-no-image.png')}"/>
                </div>
            </li>
        </ul>
    </div>

    <div class="span6">
        <ul class="thumbnails">
            <li class="span6">
                <div class="thumbnail">

                    <span class="label label-info"><i class="icon-camera"></i> <g:message code="report.photo.scooting"
                                                                                          args="${[secondP.name]}"/>
                    </span>
                    <img src="${createLink(url: "/twr/${report.id}/scoot_j${numSecond}.jpg")}" alt=""
                         def="${resource(dir: 'images', file: 'default-no-image.png')}"/>
                </div>
            </li>
        </ul>
    </div>
</div>

<table class="table table-striped">

    <g:set var="reportDone" value="${false}"/>
    <g:each in="${report.turns}" var="turn" status="t">
        <g:if test="${!reportDone}">
            <tr><td class="${turn.nightFight ? "night" : ""}">
                <div class="row">
                    <div class="span12">

                        <h4><i class="icon-list"></i> Tour #${turn.num} ${turn.nightFight ? " - " + message(code: "turn.night.played") : ""}
                        </h4>

                        <h6><i class="icon-user"></i> ${firstP.name}</h6>

                        <div class="photos-turn">
                            <ul class="thumbnails">
                                <li class="span4">
                                    <div class="thumbnail">
                                        <span class="label label-info"><i class="icon-camera"></i> <g:message
                                                code="report.turn.photo.move"/>
                                        </span>
                                        <img src="${createLink(url: "/twr/${report.id}/player${report.firstPlayer}_turn${turn.num}_move.jpg")}"
                                             alt="" def="${resource(dir: 'images', file: 'default-no-image.png')}"/>
                                    </div>
                                </li>

                                <li class="span4">
                                    <div class="thumbnail">
                                        <span class="label label-info"><i class="icon-camera"></i> <g:message
                                                code="report.turn.photo.shoot"/>
                                        </span>
                                        <img src="${createLink(url: "/twr/${report.id}/player${report.firstPlayer}_turn${turn.num}_shoot.jpg")}"
                                             alt="" def="${resource(dir: 'images', file: 'default-no-image.png')}"/>
                                    </div>
                                </li>

                                <li class="span4">
                                    <div class="thumbnail">

                                        <span class="label label-info"><i class="icon-camera"></i> <g:message
                                                code="report.turn.photo.assault"/>
                                        </span>
                                        <img src="${createLink(url: "/twr/${report.id}/player${report.firstPlayer}_turn${turn.num}_assault.jpg")}"
                                             alt="" def="${resource(dir: 'images', file: 'default-no-image.png')}"/>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <div class="comment-turn">
                            <div class="blockquote">
                                ${turn.getComments(numSecond)}
                            </div>
                        </div>

                        <h6><i class="icon-user"></i> ${secondP.name}</h6>

                        <div class="photos-turn">
                            <ul class="thumbnails">
                                <li class="span4">
                                    <div class="thumbnail">
                                        <span class="label label-info"><i class="icon-camera"></i> <g:message
                                                code="report.turn.photo.move"/>
                                        </span>
                                        <img src="${createLink(url: "/twr/${report.id}/player${numSecond}_turn${turn.num}_move.jpg")}"
                                             alt="" def="${resource(dir: 'images', file: 'default-no-image.png')}"/>
                                    </div>
                                </li>

                                <li class="span4">
                                    <div class="thumbnail">
                                        <span class="label label-info"><i class="icon-camera"></i> <g:message
                                                code="report.turn.photo.shoot"/>
                                        </span>
                                        <img src="${createLink(url: "/twr/${report.id}/player${numSecond}_turn${turn.num}_shoot.jpg")}"
                                             alt="" def="${resource(dir: 'images', file: 'default-no-image.png')}"/>
                                    </div>
                                </li>

                                <li class="span4">
                                    <div class="thumbnail">
                                        <span class="label label-info"><i class="icon-camera"></i> <g:message
                                                code="report.turn.photo.assault"/>
                                        </span>
                                        <img src="${createLink(url: "/twr/${report.id}/player${numSecond}_turn${turn.num}_assault.jpg")}"
                                             alt="" def="${resource(dir: 'images', file: 'default-no-image.png')}"/>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <div class="comment-turn ">
                            <div class="blockquote">
                                ${turn.getComments(numSecond)}
                            </div>
                        </div>

                    </div>
                </div>
            </td></tr>

            <g:if test="${turn.lastOne}">
                <g:set var="reportDone" value="${true}"/>
            </g:if>

        </g:if>

    </g:each>

</table>