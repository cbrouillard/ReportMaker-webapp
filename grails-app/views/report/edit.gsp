<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
</head>

<body>
<g:formRemote name="updateReport${report.id}" url="[controller: 'report', action: 'aj_update']"
              method="POST" update="updateResult"><g:hiddenField name="id" value="${report.id}"/>

    <div class="row">

        <div class="span3">
            <div class="container" id="navbarSpy" style="width: auto;">
                <ul class="nav sidenav" data-spy="affix">

                    <li><a href="#before-game"><i class="icon-chevron-right"></i> <g:message
                            code="before.game"/></a>
                    </li>
                    <li><a href="#t1"><i class="icon-chevron-right"></i> <g:message code="t1"/></a></li>
                    <li><a href="#t2"><i class="icon-chevron-right"></i> <g:message code="t2"/></a></li>
                    <li><a href="#t3"><i class="icon-chevron-right"></i> <g:message code="t3"/></a></li>
                    <li><a href="#t4"><i class="icon-chevron-right"></i> <g:message code="t4"/></a></li>
                    <li><a href="#t5"><i class="icon-chevron-right"></i> <g:message code="t5"/></a></li>
                    <li><a href="#t6"><i class="icon-chevron-right"></i> <g:message code="t6"/></a></li>
                    <li><a href="#t7"><i class="icon-chevron-right"></i> <g:message code="t7"/></a></li>
                    <li><span><g:submitButton name="submit" class="btn btn-primary" value="${message(code: 'save')}"/>
                        <span id="updateResult"></span>
                    </span></li>
                </ul>
            </div>
        </div>

        <div class="span9">
            %{--<div data-spy="scroll" data-target="#navbarSpy" style="position: relative;height: 1000px; overflow: auto;">--}%
            <table class="table table-striped">
                <tr>
                    <g:render template="onereport" model="[report: report]"/>
                </tr>
            </table>

            <g:render template="/common/flashmessage"/>

            <table class="table table-striped table-spy-nav">
                <tr><td>
                    <section id="before-game">
                        <g:render template="gameinfos" model="[report: report]"/>
                    </section>
                </td></tr>
                <g:each in="${(1..7)}" var="turnNum">
                    <tr><td>
                        <section id="t${turnNum}">
                            <g:render template="oneturn"
                                      model="[num: turnNum, report: report, turn: report.getTurn(turnNum)]"/>
                    </td></tr>
                </g:each>
            </table>
            %{--</div>--}%
        </div>
    </div>
</g:formRemote>


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

                        <div class="pull-left">
                            <a class="btn btn-warning"
                               onclick="$('input[id=lefile]').click();"><g:message code="browse"/></a>
                        </div>

                        <div class="pull-right">
                            <button class="btn btn-primary" data-dismiss="modal"
                                    aria-hidden="true"><g:message code="dialog.changephoto.terminate"/></button>
                        </div>
                    </div>

                    <script type="text/javascript">
                        $('input[id=lefile]').change(function () {
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
        $("#myModal").modal({remote: "${createLink(action:'changePhoto', id:report.id)}?name=" + photoName});
    }
</script>
%{--</div>--}%
</body>
</html>