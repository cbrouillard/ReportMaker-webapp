<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
</head>

<body>

<div>
    <legend>Rapports enregistrés</legend>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Nom</th>
            <th>Propriétaire</th>
            <th>Date création</th>
            <th>Joueurs</th>
            <th class="actions">Actions</th>
        </tr>
        </thead>
        <g:each in="${reports}" var="report">

            <tr>
                <td>${report.name}</td>
                <td>${report.owner.username}</td>
                <td><g:formatDate date="${report.dateCreated}" formatName="format.date.toDay"/></td>
                <td>${report.one.name} VS ${report.two.name}</td>
                <td>
                    <div id="action-result" class="text-right"></div>
                    <div class="pull-right">
                        <g:remoteLink action="thumbnailsReport" id="${report.id}"
                                      update="action-result" class="btn">Convertir les images</g:remoteLink>
                        <g:remoteLink action="deleteReport" id="${report.id}"
                                      class="btn btn-danger">Effacer</g:remoteLink>

                    </div>


                </td>
            </tr>

        </g:each>
    </table>
</div>

</body>
</html>