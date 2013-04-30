<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
</head>

<body>
<div class="around-border">
    <g:form class="form-inline" action="create" style="margin:0;">

        <g:textField name="username" required="required" placeholder="Nom utilisateur"/>
        <g:textField name="email" required="required" placeholder="Email"/>
        <g:textField name="password" required="required" placeholder="Mot de passe"/>

        <button type="submit" class="btn btn-primary">Créer utilisateur</button>
    </g:form>
</div>

<div>
    <legend>Utilisateurs enregistrés</legend>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Nom</th>
            <th>Mail</th>
            <th>Date création</th>
            <th>Rôle</th>
            <th>Actif ?</th>
            <th>Bloqué ?</th>
            <th>Expiré ?</th>
        </tr>
        </thead>
        <g:each in="${persons}" var="person">

            <tr>
                <td>${person.username}</td>
                <td>${person.email}</td>
                <td><g:formatDate date="${person.dateCreated}" formatName="format.date.toDay"/></td>
                <td>${person.authorities*.authority}</td>
                <td>
                    <div id="active-${person.id}">
                        <g:render template="active" model="[enabled: person.enabled, id: person.id]"/>
                    </div>
                </td>
                <td>
                    <div id="lock-${person.id}">
                        <g:render template="lock" model="[accountLocked: person.accountLocked, id: person.id]"/>
                    </div>
                </td>
                <td>
                    <div id="expired-${person.id}">
                        <g:render template="expired" model="[accountExpired: person.accountExpired, id: person.id]"/>
                    </div>
                </td>
            </tr>

        </g:each>
    </table>
</div>

</body>
</html>