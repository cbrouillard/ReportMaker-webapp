<div class="alert alert-info"><g:message code="report.photo.table"/></div>

<div class="photo-display">
    <img src="${createLink(absolute: true, url: "/twr/photos/${report.id}/table.jpg")}" alt="Table" title="Table"/>
    <button class="btn pull-right"><img src="${resource(dir: 'images', file: 'camera.png')}" alt="Change"/>
    </button>
</div>

<div class="alert alert-info"><g:message code="report.deployment.type"/></div>
<g:textField name="deploymentType" value="${report.deploymentType}"/>

<div class="alert alert-info"><g:message code="report.scenario"/></div>
<g:textField name="scenario" value="${report.scenario}"/>