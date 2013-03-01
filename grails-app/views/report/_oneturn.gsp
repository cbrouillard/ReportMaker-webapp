<h2><g:message code="turn" args="${[num]}"/></h2>

<g:if test="${num == 1 || num >= 5}">
    <legend><g:message code="report.turn.night"/></legend>
    <label for="nightFight_t${num}"><g:message code="report.turn.night.help"/> <g:checkBox name="nightFight_t${num}"
                                                                                           checked="turn?.nightFight"/></label>

</g:if>

<g:if test="${num >= 5}">
    <legend><g:message code="report.turn.islast"/></legend>
    <label for="lastOne_t${num}"><g:message code="report.turn.islast.help"/> <g:checkBox name="lastOne_t${num}"
                                                                                         checked="turn?.lastOne"/></label>

</g:if>

<legend><g:message code="report.turn.players"/></legend>

<div class="tabbable">
    <ul class="nav nav-tabs">
        <li class="${report.one.num == 1 ? 'active' : ''}"><a href="#player1" data-toggle="tab">${report.one.name} <span
                class="label label-info">${report.one.num}</span></a></li>
        <li class="${report.two.num == 1 ? 'active' : ''}"><a href="#player2" data-toggle="tab">${report.two.name} <span
                class="label label-info">${report.two.num}</span></a></li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane ${report.one.num == 1 ? 'active' : ''}" id="player1">

            <g:render template="oneplayerturn" model="[report: report, turn: turn, player: report.one, numTurn: num]"/>

        </div>

        <div class="tab-pane ${report.two.num == 1 ? 'active' : ''}" id="player2">
            <g:render template="oneplayerturn" model="[report: report, turn: turn, player: report.two, numTurn: num]"/>
        </div>
    </div>
</div>