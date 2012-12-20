<legend><g:message code="report.photo.table"/></legend>

<div class="photo-display">
    <img src="${createLink(url: "/twr/${report.id}/table.jpg")}" alt="Table" title="Table"/>
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

<legend><g:message code="report.photo.deployment" args="${[report.one.name]}"/></legend>

<div class="photo-display">
    <img src="${createLink(url: "/twr/${report.id}/deployment_j1.jpg")}" alt="DpJ1"/>
    <button class="btn pull-right"><img src="${resource(dir: 'images', file: 'camera.png')}" alt="Change"/>
    </button>
</div>

<legend><g:message code="report.photo.deployment" args="${[report.two.name]}"/></legend>

<div class="photo-display">
    <img src="${createLink(url: "/twr/${report.id}/deployment_j2.jpg")}" alt="DpJ2"/>
    <button class="btn pull-right"><img src="${resource(dir: 'images', file: 'camera.png')}" alt="Change"/>
    </button>
</div>

<legend><g:message code="report.photo.infiltration" args="${[report.one.name]}"/></legend>

<div class="photo-display">
    <img src="${createLink(url: "/twr/${report.id}/infiltration_j1.jpg")}" alt="InfJ1"/>
    <button class="btn pull-right"><img src="${resource(dir: 'images', file: 'camera.png')}" alt="Change"/>
    </button>
</div>


<legend><g:message code="report.photo.infiltration" args="${[report.two.name]}"/></legend>

<div class="photo-display">
    <img src="${createLink(url: "/twr/${report.id}/infiltration_j2.jpg")}" alt="InfJ2"/>
    <button class="btn pull-right"><img src="${resource(dir: 'images', file: 'camera.png')}" alt="Change"/>
    </button>
</div>


<legend><g:message code="report.photo.scooting" args="${[report.one.name]}"/></legend>

<div class="photo-display">
    <img src="${createLink(url: "/twr/${report.id}/scoot_j1.jpg")}" alt="ScoJ1"/>
    <button class="btn pull-right"><img src="${resource(dir: 'images', file: 'camera.png')}" alt="Change"/>
    </button>
</div>

<legend><g:message code="report.photo.scooting" args="${[report.two.name]}"/></legend>

<div class="photo-display">
    <img src="${createLink(url: "/twr/${report.id}/scoot_j2.jpg")}" alt="ScoJ2"/>
    <button class="btn pull-right"><img src="${resource(dir: 'images', file: 'camera.png')}" alt="Change"/>
    </button>
</div>


<legend><g:message code="report.infos.comments"/></legend>

<g:textArea name="comments" rows="5" class="span12" cols=""
            value="${report.comments}"/>