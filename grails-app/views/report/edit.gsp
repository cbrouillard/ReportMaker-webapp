<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
</head>

<body>

<g:form action="update" method="POST"><g:hiddenField name="id" value="${report.id}"/>

    <div class="row">

        <table class="table table-striped">
            <tr>
                <g:render template="onereport" model="[report: report]"/>
            </tr>
        </table>
    </div>

%{--<div class="row">--}%
%{--<div class="around-border">--}%
%{--<g:submitButton name="submit" class="btn btn-primary pull-right"--}%
%{--value="${message(code: 'save')}"/>--}%
%{--<div class="clearfix">&nbsp;</div>--}%
%{--</div>--}%
%{--</div>--}%


    <div class="row">
        <g:render template="/common/flashmessage"/>
    </div>

    <div class="row">
        <div class="pull-right">
            <div class="btn-group">
                <a href="#bottom" class="btn"><i class="icon-arrow-down"></i> <g:message code="page.down"/></a>
                <button type="submit" class="btn">
                    <i class="icon-ok"></i> ${message(code: 'save')}
                </button>

            </div>
        </div>
    </div>

    <div class="row">
        <div class="tabbable tabs-left"><!-- Only required for left/right tabs -->
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

%{--<div class="row">--}%
%{--<div class="around-border">--}%
%{--<g:submitButton name="submit" class="btn btn-primary pull-right" value="${message(code: 'save')}"/>--}%
%{--<div class="clearfix">&nbsp;</div>--}%
%{--</div>--}%
%{--</div>--}%

    <div class="row">
        <div class="pull-right">
            <a href="#top" class="btn"><i class="icon-arrow-up"></i> <g:message code="page.up"/></a>
            <button type="submit" class="btn">
                <i class="icon-ok"></i> ${message(code: 'save')}
            </button>
        </div>
    </div>
</g:form>


<form method="POST" enctype="multipart/form-data" id="form-photo-change">
    <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-header">
            <h3 id="myModalLabel"><g:message code="dialog.changephoto.title"/></h3>
        </div>

        <div class="modal-body">

        </div>

        <div class="modal-footer">

            <div id="fileupload">

                <div class="fileupload-buttonbar">
                    <input type="hidden" name="protocol" value="http"/>

                    <input id="lefile" type="file" style="visibility: hidden; display:none;" name="files[]">

                    <div class="fileupload-content" id="fileupload-content">
                        <div id="progress" class="progress progress-striped progress-warning">
                            <div class="bar" style="width: 0%;"></div>
                        </div>
                    </div>

                    <div>

                        <div class="input-append pull-left">
                            <input id="photoCover" class="input-large" type="text">
                            <a class="btn" onclick="$('input[id=lefile]').click();"><g:message code="browse"/></a>
                        </div>

                        <div class="pull-right">
                            <button class="btn btn-primary." data-dismiss="modal"
                                    aria-hidden="true"><g:message code="dialog.changephoto.terminate"/></button>
                        </div>
                    </div>

                    <script type="text/javascript">
                        $('input[id=lefile]').change(function () {
                            $('#photoCover').val($(this).val());
                        });
                    </script>
                </div>

            </div>

        </div>
    </div>

</form>


<script type="text/javascript">
    $(document).ready(function () {
        $(".change-photo").click(function () {
            showDialogChangePhoto($(this).attr("photoName"));
        });

        $(".delete-photo").click(function () {
            var name = $(this).attr("photoName");
            // 1x1 pixel
            $(".photo-tochange-" + name).attr('src', 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==');
            // post pour suppression
            $.ajax("${createLink(action:"deletePhoto", id:report.id)}?photo=" + name)
        });

    });

    var showDialogChangePhoto = function (photoName) {
        $('#progress .bar').css(
                'width', '0%'
        );
        $("#form-photo-change").attr("action",
                "${createLink(action: 'upload', controller: 'report', id: report.id)}?photo=" + photoName);
        $("#photoCover").val("");
        $("#myModal").modal({remote: "${createLink(action:'changePhoto', id:report.id)}?name=" + photoName});
    }
</script>
</body>
</html>