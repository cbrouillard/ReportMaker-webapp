<legend><g:message code="report.turn.photo.move"/></legend>

<div class="photo-display">
    <img src="${createLink(absolute: true, url: "/twr/${report.id}/player${player.num}_turn${numTurn}_move.jpg")}"
         alt="" title="Move" class="photo-tochange-player${player.num}_turn${numTurn}_move"/>
    <a class="btn pull-right change-photo" photoName="player${player.num}_turn${numTurn}_move"><img
            src="${resource(dir: 'images', file: 'camera.png')}" alt="Change"/>
    </a>
</div>

<legend><g:message code="report.turn.photo.shoot"/></legend>

<div class="photo-display">
    <img src="${createLink(absolute: true, url: "/twr/${report.id}/player${player.num}_turn${numTurn}_shoot.jpg")}"
         alt="" title="Shoot" class="photo-tochange-player${player.num}_turn${numTurn}_shoot"/>
    <a class="btn pull-right change-photo" photoName="player${player.num}_turn${numTurn}_shoot"><img
            src="${resource(dir: 'images', file: 'camera.png')}" alt="Change"/>
    </a>
</div>

<legend><g:message code="report.turn.photo.assault"/></legend>

<div class="photo-display">
    <img src="${createLink(absolute: true, url: "/twr/${report.id}/player${player.num}_turn${numTurn}_assault.jpg")}"
         alt="" title="Assault" class="photo-tochange-player${player.num}_turn${numTurn}_assault"/>
    <a class="btn pull-right change-photo" photoName="player${player.num}_turn${numTurn}_assault"><img
            src="${resource(dir: 'images', file: 'camera.png')}" alt="Change"/>
    </a>
</div>

<legend><g:message code="report.turn.comments"/></legend>

<g:textArea name="comments_p${player.num}_t${numTurn}"
            value="${player.num == 1 ? turn?.comments1 : turn?.comments2}"/>