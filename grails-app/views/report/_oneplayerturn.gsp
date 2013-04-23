<legend>${player.name}</legend>

<h5><g:message code="report.turn.photo.move"/></h5>

<div class="around-border">
    <div class="photo-display">
        <img src="${createLink(absolute: true, url: "/twr/${report.id}/player${player.num}_turn${numTurn}_move.jpg")}"
             alt="" title="Move" class="photo-tochange-player${player.num}_turn${numTurn}_move"/>
    </div>
    <g:render template="/common/actionphotos" model="[photoName: 'player' + player.num + '_turn' + numTurn + '_move']"/>
</div>


<h5><g:message code="report.turn.photo.shoot"/></h5>

<div class="around-border">
    <div class="photo-display">
        <img src="${createLink(absolute: true, url: "/twr/${report.id}/player${player.num}_turn${numTurn}_shoot.jpg")}"
             alt="" title="Shoot" class="photo-tochange-player${player.num}_turn${numTurn}_shoot"/>
    </div>
    <g:render template="/common/actionphotos"
              model="[photoName: 'player' + player.num + '_turn' + numTurn + '_shoot']"/>
</div>


<h5><g:message code="report.turn.photo.assault"/></h5>

<div class="around-border">
    <div class="photo-display">
        <img src="${createLink(absolute: true, url: "/twr/${report.id}/player${player.num}_turn${numTurn}_assault.jpg")}"
             alt="" title="Assault" class="photo-tochange-player${player.num}_turn${numTurn}_assault"/>
    </div>
    <g:render template="/common/actionphotos"
              model="[photoName: 'player' + player.num + '_turn' + numTurn + '_assault']"/>
</div>

<h5><g:message code="report.turn.comments" args="${[numTurn]}"/></h5>

<g:textArea name="comments_p${player.num}_t${numTurn}"
            value="${player.num == 1 ? turn?.comments1?.decodeHTML() : turn?.comments2?.decodeHTML()}"
            placeholder="${message(code: 'report.turn.comments.hint')}"
            class="editableArea"/>