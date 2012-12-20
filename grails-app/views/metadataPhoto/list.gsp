<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
</head>

<body>

<ul class="thumbnails">
    <g:each in="${photos}" var="photo">
        <li class="span4">
            <div class="thumbnail">
                <img src="${createLink(url: photo.path)}" alt="">

                <p><g:link controller="report" action="edit"
                           id="${photo.report.id}">${photo.report.name}</g:link> - ${photo.path.split("/").last()}</p>

                <div class="form-actions">
                    <g:link action="delete" id="${photo.id}" class="btn btn-danger pull-right"><g:message code="delete"/></g:link>
                </div>
            </div>
        </li>
    </g:each>
</ul>

</body>
</html>