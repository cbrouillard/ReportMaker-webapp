<a name="before-game"></a>
<legend><g:message code="before.game"/></legend>

<h3><g:message code="report.photo.table"/></h3>

<div class="around-border">
    <div class="photo-display">
        <img src="${createLink(absolute: true, url: "/twr/${report.id}/table.jpg")}" alt=""
             class="photo-tochange-table"/>
    </div>
    <g:render template="actionphotos" model="[photoName: 'table']"/>
</div>


<h3><g:message code="report.deployment.type"/></h3>
<g:textField name="deploymentType" value="${report.deploymentType?.decodeHTML()}" class="input-xxlarge"
             placeholder="${message(code: 'report.deployment.type.hint')}"/>

<h3><g:message code="report.scenario"/></h3>
<g:textField name="scenario" value="${report.scenario?.decodeHTML()}" class="input-xxlarge"
             placeholder="${message(code: 'report.scenario.hint')}"/>


<h3><g:message code="report.whostart"/></h3>
<g:select name="firstPlayer" from="${[report.one, report.two]}" optionValue="name" optionKey="num"
          value="${report.firstPlayer}"/>

<h3><g:message code="report.lordcapacity" args="${[report.one.name]}"/></h3>
<g:textField name="lordCapacity1" value="${report.lordCapacity1?.decodeHTML()}" class="input-xxlarge"
             placeholder="${message(code: 'report.lordcapacity.hint')}"/>

<h3><g:message code="report.lordcapacity" args="${[report.two.name]}"/></h3>
<g:textField name="lordCapacity2" value="${report.lordCapacity2?.decodeHTML()}" class="input-xxlarge"
             placeholder="${message(code: 'report.lordcapacity.hint')}"/>


<h3><g:message code="report.photo.deployment" args="${[report.one.name]}"/></h3>

<div class="around-border">
    <div class="photo-display">
        <img src="${createLink(absolute: true, url: "/twr/${report.id}/deployment_j1.jpg")}" alt=""
             class="photo-tochange-deployment_j1"/>
    </div>
    <g:render template="actionphotos" model="[photoName: 'deployment_j1']"/>
</div>

<h3><g:message code="report.photo.deployment" args="${[report.two.name]}"/></h3>

<div class="around-border">
    <div class="photo-display">
        <img src="${createLink(absolute: true, url: "/twr/${report.id}/deployment_j2.jpg")}" alt=""
             class="photo-tochange-deployment_j2"/>
    </div>
    <g:render template="actionphotos" model="[photoName: 'deployment_j2']"/>
</div>


<h3><g:message code="report.photo.infiltration" args="${[report.one.name]}"/></h3>

<div class="around-border">
    <div class="photo-display">
        <img src="${createLink(absolute: true, url: "/twr/${report.id}/infiltration_j1.jpg")}" alt=""
             class="photo-tochange-infiltration_j1"/>
    </div>
    <g:render template="actionphotos" model="[photoName: 'infiltration_j1']"/>
</div>

<h3><g:message code="report.photo.infiltration" args="${[report.two.name]}"/></h3>

<div class="around-border">
    <div class="photo-display">
        <img src="${createLink(absolute: true, url: "/twr/${report.id}/infiltration_j2.jpg")}" alt=""
             class="photo-tochange-infiltration_j2"/>
    </div>
    <g:render template="actionphotos" model="[photoName: 'infiltration_j2']"/>
</div>


<h3><g:message code="report.photo.scooting" args="${[report.one.name]}"/></h3>

<div class="around-border">
    <div class="photo-display">
        <img src="${createLink(absolute: true, url: "/twr/${report.id}/scoot_j1.jpg")}" alt=""
             class="photo-tochange-scoot_j1"/>
    </div>
    <g:render template="actionphotos" model="[photoName: 'scoot_j1']"/>
</div>


<h3><g:message code="report.photo.scooting" args="${[report.two.name]}"/></h3>

<div class="around-border">
    <div class="photo-display">
        <img src="${createLink(absolute: true, url: "/twr/${report.id}/scoot_j2.jpg")}" alt=""
             class="photo-tochange-scoot_j2"/>
    </div>
    <g:render template="actionphotos" model="[photoName: 'scoot_j2']"/>
</div>


<h3><g:message code="report.infos.comments"/></h3>

<g:textArea name="comments"
            value="${report.comments?.decodeHTML()}" class="editableArea"
            placeholder="${message(code: 'report.infos.comments.hint')}"/>