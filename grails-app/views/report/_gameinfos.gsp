<legend><g:message code="report.photo.table"/></legend>

<div class="photo-display">
    <img src="${createLink(absolute: true, url: "/twr/photos/${report.id}/table.jpg")}" alt="Table" title="Table"/>
    <button class="btn pull-right"><img src="${resource(dir: 'images', file: 'camera.png')}" alt="Change"/>
    </button>
</div>

<legend><g:message code="report.deployment.type"/></legend>
<g:textField name="deploymentType" value="${report.deploymentType}"/>

<legend><g:message code="report.scenario"/></legend>
<g:textField name="scenario" value="${report.scenario}"/>