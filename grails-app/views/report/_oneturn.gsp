<legend><g:message code="turn" args="${[num]}"/></legend>

<g:if test="${num == 1 || num >= 5}">
    <h5><g:message code="report.turn.night"/></h5>
    <label for="nightFight_t${num}"><g:message code="report.turn.night.help"/> <g:checkBox
            name="nightFight_t${num}"
            checked="turn?.nightFight"/></label>

</g:if>

<g:if test="${num >= 5}">
    <h5><g:message code="report.turn.islast"/></h5>
    <label for="lastOne_t${num}"><g:message code="report.turn.islast.help"/> <g:checkBox name="lastOne_t${num}"
                                                                                         checked="turn?.lastOne"/></label>

</g:if>

%{--<div class="tabbable">--}%
%{--<ul class="nav nav-pills">--}%
%{--<li class="${report.firstPlayer == 1 ? 'active' : ''}"><a href="#player1_turn${turn.num}"--}%
%{--data-toggle="tab">${report.one.name}--}%
%{--<span--}%
%{--class="label label-info">${report.firstPlayer == 1 ? '1' : '2'}</span></a></li>--}%
%{--<li class="${report.firstPlayer == 2 ? 'active' : ''}"><a href="#player2_turn${turn.num}"--}%
%{--data-toggle="tab">${report.two.name--}%
%{--} <span--}%
%{--class="label label-info">${report.firstPlayer == 2 ? '1' : '2'}</span></a></li>--}%
%{--</ul>--}%

%{--<div class="tab-content">--}%
%{--<div class="tab-pane ${report.firstPlayer == 1 ? 'active' : ''}" id="player1_turn${turn.num}">--}%

%{--<g:render template="oneplayerturn"--}%
%{--model="[report: report, turn: turn, player: report.one, numTurn: num]"/>--}%

%{--</div>--}%

%{--<div class="tab-pane ${report.firstPlayer == 2 ? 'active' : ''}" id="player2_turn${turn.num}">--}%
%{--<g:render template="oneplayerturn"--}%
%{--model="[report: report, turn: turn, player: report.two, numTurn: num]"/>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%

<g:render template="oneplayerturn"
          model="[report: report, turn: turn, player: report.one, numTurn: num]"/>

<g:render template="oneplayerturn"
          model="[report: report, turn: turn, player: report.two, numTurn: num]"/>