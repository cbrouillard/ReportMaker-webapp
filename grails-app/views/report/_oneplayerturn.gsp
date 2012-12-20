<legend><g:message code="report.turn.photo.move"/></legend>

<div class="photo-display">
    <img src="${createLink(absolute: true, uri: "/twr/${report.id}/player${player.num}_turn${numTurn}_move.jpg")}"
         alt="Move" title="Move"/>
    <button class="btn pull-right"><img src="${resource(dir: 'images', file: 'camera.png')}" alt="Change"/>
    </button>
</div>

<legend><g:message code="report.turn.photo.shoot"/></legend>

<div class="photo-display">
    <img src="${createLink(absolute: true, uri: "/twr/${report.id}/player${player.num}_turn${numTurn}_shoot.jpg")}"
         alt="Shoot" title="Shoot"/>
    <button class="btn pull-right"><img src="${resource(dir: 'images', file: 'camera.png')}" alt="Change"/>
    </button>
</div>

<legend><g:message code="report.turn.photo.assault"/></legend>

<div class="photo-display">
    <img src="${createLink(absolute: true, uri: "/twr/${report.id}/player${player.num}_turn${numTurn}_assault.jpg")}"
         alt="Assault" title="Assault"/>
    <button class="btn pull-right"><img src="${resource(dir: 'images', file: 'camera.png')}" alt="Change"/>
    </button>
</div>

<legend><g:message code="report.turn.comments"/></legend>

<g:textArea name="comments_p${player.id}_t${numTurn}" rows="5" class="span12" cols=""
            value="${player.num == 1 ? turn?.comments1 : turn?.comments2}"/>