<legend><g:message code="report.photo.table"/></legend>

<div class="photo-display">
    <img src="${createLink(absolute: true, url: "/twr/photos/${report.id}/table.jpg")}" alt="Table" title="Table"/>
    <button class="btn pull-right"><img src="${resource(dir: 'images', file: 'camera.png')}" alt="Change"/>
    </button>
</div>

<legend><g:message code="report.deployment.type"/></legend>
<g:textField name="deploymentType" value="${report.deploymentType}" class="input-xxlarge"/>

<legend><g:message code="report.scenario"/></legend>
<g:textField name="scenario" value="${report.scenario}" class="input-xxlarge"/>

<legend><g:message code="report.whostart"/></legend>
<g:select name="firstPlayer" from="${[report.one, report.two]}" optionValue="name" optionKey="num"
          value="${report.firstPlayer}"/>

<legend><g:message code="report.lordcapacity" args="${[report.one.name]}"/></legend>
<g:textField name="lordCapacity1" value="${report.lordCapacity1}" class="input-xxlarge"/>

<legend><g:message code="report.lordcapacity" args="${[report.two.name]}"/></legend>
<g:textField name="lordCapacity2" value="${report.lordCapacity2}" class="input-xxlarge"/>