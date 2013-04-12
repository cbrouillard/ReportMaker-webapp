<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
</head>

<body>
<div class="well">
    <h1><g:message code="person.profile"/></h1>

    <p><g:message code="person.profile.help"/></p>

</div>
<g:render template="/common/flashmessage"/>

<div class="row">
    <div class="span4">

        <span class="label label-info"><i
                class="icon-user icon-white"></i> <g:message code="person.profile.photo"/></span>

        <div class="around-border">

            <div class="photo-display">
                <img src="${createLink(absolute: true, url:
                        "/twr/persons/${person.id}/photo.jpg")}"
                     alt="" title="Profil" class="photo-tochange-person${person.id}_photo"/>
            </div>
            <g:render template="/common/actionphotos"
                      model="[photoName: 'photo']"/>
        </div>

        <div class="clearfix">&nbsp;</div>

        <span class="label label-info"><i
                class="icon-user icon-white"></i> <g:message code="person.profile.infos"/></span>

        <div class="around-border">
            <g:form controller="person" action="updateInfos">
                <legend>${person.username}</legend>

                <label><g:message code="person.email"/></label>
                <g:textField name="email" value="${person.email}"/>

                <hr/>
                <button type="submit" class="btn btn-primary"><g:message code="person.infos.submit"/></button>
                <a data-toggle="modal" href="#changepass" class="btn btn-success"><g:message
                        code="person.infos.changepass"/></a>

            </g:form>
        </div>
    </div>

    <div class="span8">
        %{--Amis<br/>--}%

        <span class="label label-info"><i
                class="icon-picture icon-white"></i> <g:message code="person.profile.lastfivereports"/></span>

        <div>
            <g:if test="${reports}">
                <table class="table table-striped table-hover">
                    <g:each in="${reports}" var="report" status="i">
                        <tr class="clickable"
                            link="${createLink(controller: 'report', action: 'edit', id: report.id)}">
                            <g:render template="/report/onereport" model="[report: report, editAction: true]"/>
                        </tr>
                    </g:each>
                </table>
            </g:if>
            <g:else>
                <div class="alert alert-info">
                    <g:message code="report.list.noreports"/>
                    <g:link class="btn btn-primary" action="create"
                            controller="report"><g:message code="report.howto.create"/></g:link>
                </div>
            </g:else>
        </div>

    </div>

</div>

<g:formRemote method="post" name="changePassForm" url="[controller: 'person', action: 'changePass']" update="message">
    <div id="changepass" class="modal hide fade">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

            <h3><g:message
                    code="person.infos.changepass"/></h3>
        </div>

        <div class="modal-body">
            <div id="message"></div>

            <label><g:message code="person.change.pass"/></label>
            <g:passwordField name="pass" required="true"/>
            <label><g:message code="person.change.pass.check"/></label>
            <g:passwordField name="passCheck" required="true"/>
        </div>

        <div class="modal-footer">
            <g:actionSubmit value="${message(code:'change')}" class="btn btn-primary"/>
        </div>
    </div>
</g:formRemote>

</body>
</html>