<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
</head>

<body>
<g:render template="/common/flashmessage"/>

<div class="row">
    <table class="table table-striped">
        <tr>
            <g:render template="onereport" model="[report: report]"/>
        </tr>
    </table>
</div>

<div class="row">
    <div class="tabbable"><!-- Only required for left/right tabs -->
        <ul class="nav nav-tabs">
            <li class="active"><a href="#tabbefore" data-toggle="tab">•</a></li>
            <li><a href="#t1" data-toggle="tab"><g:message code="t1"/></a></li>
            <li><a href="#t2" data-toggle="tab"><g:message code="t2"/></a></li>
            <li><a href="#t3" data-toggle="tab"><g:message code="t3"/></a></li>
            <li><a href="#t4" data-toggle="tab"><g:message code="t4"/></a></li>
            <li><a href="#t5" data-toggle="tab"><g:message code="t5"/></a></li>
            <li><a href="#t6" data-toggle="tab"><g:message code="t6"/></a></li>
            <li><a href="#t7" data-toggle="tab"><g:message code="t7"/></a></li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane active" id="tabbefore">
                <g:render template="gameinfos" model="[report: report]"/>
            </div>

            <div class="tab-pane" id="t1">
                <g:render template="oneturn" model="[num: 1, report: report, turn: report.getTurn(1)]"/>
            </div>

            <div class="tab-pane" id="t2">
                <g:render template="oneturn" model="[num: 2, report: report, turn: report.getTurn(2)]"/>
            </div>

            <div class="tab-pane" id="t3">
                <g:render template="oneturn" model="[num: 3, report: report, turn: report.getTurn(3)]"/>
            </div>

            <div class="tab-pane" id="t4">
                <g:render template="oneturn" model="[num: 4, report: report, turn: report.getTurn(4)]"/>
            </div>

            <div class="tab-pane" id="t5">
                <g:render template="oneturn" model="[num: 5, report: report, turn: report.getTurn(5)]"/>
            </div>

            <div class="tab-pane" id="t6">
                <g:render template="oneturn" model="[num: 6, report: report, turn: report.getTurn(6)]"/>
            </div>

            <div class="tab-pane" id="t7">
                <g:render template="oneturn" model="[num: 7, report: report, turn: report.getTurn(7)]"/>
            </div>
        </div>
    </div>
</div>

</body>
</html>