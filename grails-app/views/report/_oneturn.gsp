<legend><g:message code="turn" args="${[num]}"/></legend>

<g:if test="${num == 1 || num >= 5}">
    <h5><g:message code="report.turn.night"/></h5>
    <label for="nightFight_t${num}"><g:message code="report.turn.night.help"/> <g:checkBox
            name="nightFight_t${num}"
            checked="${turn?.nightFight}"/></label>

</g:if>

<g:if test="${num >= 5}">
    <h5><g:message code="report.turn.islast"/></h5>
    <label for="lastOne_t${num}"><g:message code="report.turn.islast.help"/> <g:checkBox name="lastOne_t${num}"
                                                                                         checked="${turn?.lastOne}"/></label>

</g:if>


<g:if test="${report.firstPlayer == 1}">
<g:render template="oneplayerturn"
          model="[report: report, turn: turn, player: report.one, numTurn: num]"/>

<g:render template="oneplayerturn"
          model="[report: report, turn: turn, player: report.two, numTurn: num]"/>
</g:if>
<g:else>
    <g:render template="oneplayerturn"
              model="[report: report, turn: turn, player: report.two, numTurn: num]"/>

    <g:render template="oneplayerturn"
              model="[report: report, turn: turn, player: report.one, numTurn: num]"/>

</g:else>