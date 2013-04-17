<legend><g:message code="before.game"/></legend>

<h5><g:message code="report.photo.table"/></h5>

<div class="around-border">
    <div class="photo-display">
        <img src="${createLink(absolute: true, url: "/twr/${report.id}/table.jpg")}" alt=""
             class="photo-tochange-table"/>
    </div>
    <g:render template="/common/actionphotos" model="[photoName: 'table']"/>
</div>


<h5><g:message code="report.deployment.type"/></h5>
<g:textField name="deploymentType" value="${report.deploymentType?.decodeHTML()}" class="input-xxlarge"
             placeholder="${message(code: 'report.deployment.type.hint')}"/>

<h5><g:message code="report.scenario"/></h5>
<g:textField name="scenario" value="${report.scenario?.decodeHTML()}" class="input-xxlarge"
             placeholder="${message(code: 'report.scenario.hint')}"/>


<h5><g:message code="report.whostart"/></h5>
<g:select name="firstPlayer" from="${[report.one, report.two]}" optionValue="name" optionKey="num"
          value="${report.firstPlayer}"/>

<h5><g:message code="report.lordcapacity" args="${[report.one.name]}"/></h5>
<g:textField name="lordCapacity1" value="${report.lordCapacity1?.decodeHTML()}" class="input-xxlarge"
             placeholder="${message(code: 'report.lordcapacity.hint')}"/>

<h5><g:message code="report.lordcapacity" args="${[report.two.name]}"/></h5>
<g:textField name="lordCapacity2" value="${report.lordCapacity2?.decodeHTML()}" class="input-xxlarge"
             placeholder="${message(code: 'report.lordcapacity.hint')}"/>


<h5><g:message code="report.photo.deployment" args="${[report.one.name]}"/></h5>

<div class="around-border">
    <div class="photo-display">
        <img src="${createLink(absolute: true, url: "/twr/${report.id}/deploiement_j1.jpg")}" alt=""
             class="photo-tochange-deploiement_j1"/>
    </div>
    <g:render template="/common/actionphotos" model="[photoName: 'deploiement_j1']"/>
</div>

<h5><g:message code="report.photo.deployment" args="${[report.two.name]}"/></h5>

<div class="around-border">
    <div class="photo-display">
        <img src="${createLink(absolute: true, url: "/twr/${report.id}/deploiement_j2.jpg")}" alt=""
             class="photo-tochange-deploiement_j2"/>
    </div>
    <g:render template="/common/actionphotos" model="[photoName: 'deploiement_j2']"/>
</div>


<h5><g:message code="report.photo.infiltration" args="${[report.one.name]}"/></h5>

<div class="around-border">
    <div class="photo-display">
        <img src="${createLink(absolute: true, url: "/twr/${report.id}/infiltration_j1.jpg")}" alt=""
             class="photo-tochange-infiltration_j1"/>
    </div>
    <g:render template="/common/actionphotos" model="[photoName: 'infiltration_j1']"/>
</div>

<h5><g:message code="report.photo.infiltration" args="${[report.two.name]}"/></h5>

<div class="around-border">
    <div class="photo-display">
        <img src="${createLink(absolute: true, url: "/twr/${report.id}/infiltration_j2.jpg")}" alt=""
             class="photo-tochange-infiltration_j2"/>
    </div>
    <g:render template="/common/actionphotos" model="[photoName: 'infiltration_j2']"/>
</div>


<h5><g:message code="report.photo.scooting" args="${[report.one.name]}"/></h5>

<div class="around-border">
    <div class="photo-display">
        <img src="${createLink(absolute: true, url: "/twr/${report.id}/scoot_j1.jpg")}" alt=""
             class="photo-tochange-scoot_j1"/>
    </div>
    <g:render template="/common/actionphotos" model="[photoName: 'scoot_j1']"/>
</div>


<h5><g:message code="report.photo.scooting" args="${[report.two.name]}"/></h5>

<div class="around-border">
    <div class="photo-display">
        <img src="${createLink(absolute: true, url: "/twr/${report.id}/scoot_j2.jpg")}" alt=""
             class="photo-tochange-scoot_j2"/>
    </div>
    <g:render template="/common/actionphotos" model="[photoName: 'scoot_j2']"/>
</div>


<h5><g:message code="report.infos.comments"/></h5>

<g:textArea name="comments"
            value="${report.comments?.decodeHTML()}" class="editableArea"
            placeholder="${message(code: 'report.infos.comments.hint')}"/>
