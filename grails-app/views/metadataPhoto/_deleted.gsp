<a href="#" class="thumbnail">
    <img src="${resource(dir: 'images', file: 'damier.png')}" alt="Deleted">
</a>

<p><g:link controller="report" action="edit"
           id="${photo.report.id}">${photo.report.name}</g:link> ${photo.path.split("/").last()}</p>

<p class="inverse"><g:message code="photo.has.been.deleted"/></p>