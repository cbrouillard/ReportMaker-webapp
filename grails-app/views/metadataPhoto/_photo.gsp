<a href="javascript:zoomOn();" class="thumbnail">
    <img src="${createLink(url: photo.path)}" alt="">
</a>

<p><g:link controller="report" action="edit"
           id="${photo.report.id}">${photo.report.name}</g:link> ${photo.path.split("/").last()}</p>

<p><span
        class="label label-${photo.valid ? 'info' : 'important'}">${message(code: photo.valid ? 'photo.valid' : 'photo.not.valid')}</span>
</p>

<div>

    <g:remoteLink action="delete" id="${photo.id}" class="btn btn-danger pull-right"
                  update="photo${photo.id}"><g:message
            code="delete"/></g:remoteLink>
    <a href="javascript:showLink();" class="btn btn-info"><g:message
            code="link"/></a>
    <g:remoteLink action="ok" id="${photo.id}" class="btn btn-success" update="photo${photo.id}"><g:message
            code="ok"/></g:remoteLink>
</div>