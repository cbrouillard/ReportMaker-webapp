<legend><g:message code="report.turn.photo.move"/></legend>

<div class="around-border">
    <div class="photo-display">
        <img src="${createLink(absolute: true, url: "/twr/${report.id}/player${player.num}_turn${numTurn}_move.jpg")}"
             alt="" title="Move" class="photo-tochange-player${player.num}_turn${numTurn}_move"/>
    </div>
    <g:render template="actionphotos" model="[photoName: 'player' + player.num + '_turn' + numTurn + '_move']"/>
</div>

<legend><g:message code="report.turn.photo.shoot"/></legend>

<div class="around-border">
    <div class="photo-display">
        <img src="${createLink(absolute: true, url: "/twr/${report.id}/player${player.num}_turn${numTurn}_shoot.jpg")}"
             alt="" title="Shoot" class="photo-tochange-player${player.num}_turn${numTurn}_shoot"/>
    </div>
    <g:render template="actionphotos" model="[photoName: 'player' + player.num + '_turn' + numTurn + '_shoot']"/>
</div>

<legend><g:message code="report.turn.photo.assault"/></legend>

<div class="around-border">
    <div class="photo-display">
        <img src="${createLink(absolute: true, url: "/twr/${report.id}/player${player.num}_turn${numTurn}_assault.jpg")}"
             alt="" title="Assault" class="photo-tochange-player${player.num}_turn${numTurn}_assault"/>
    </div>
    <g:render template="actionphotos" model="[photoName: 'player' + player.num + '_turn' + numTurn + '_assault']"/>
</div>

<legend><g:message code="report.turn.comments"/></legend>

<g:textArea name="comments_p${player.num}_t${numTurn}"
            value="${player.num == 1 ? turn?.comments1 : turn?.comments2}"/>