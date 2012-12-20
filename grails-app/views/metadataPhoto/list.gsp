<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
</head>

<body>

<g:set var="report" value="'start'"/>
<g:set var="hasUlOpen" value="false"/>
<g:each in="${photos}" var="photo">
    <g:if test="${!photo.report.id.equals(report)}">
        <g:if test="${hasUlOpen}">
            </ul>
        </g:if>

        <g:set var="report" value="${photo.report.id}"/>
        <legend>${photo.report.name} - ${photo.report.owner.username}</legend>
        <ul class="thumbnails">
        <g:set var="hasUlOpen" value="trues"/>
    </g:if>

    <li class="span3">
        <div class="thumbnail thumb-perso" id="photo${photo.id}">
            <g:if test="${photo.deleted}">
                <g:render template="deleted" model="[photo: photo]"/>
            </g:if><g:else>
                <g:render template="photo" model="[photo: photo]"/>
            </g:else>

        </div>
    </li>

</g:each>
<g:if test="${hasUlOpen}">
    </ul>
</g:if>

</body>
</html>