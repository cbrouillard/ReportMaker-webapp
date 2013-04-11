<legend>${report.name} - Photo "<g:message code="${name}"/>"</legend>

<div class="alert alert-info"><g:message code="dialog.changephoto.help"/></div>

<div class="thumbnail center">

    <a href="javascript:zoomOn();">
        <img src="${createLink(url: "/twr/${report.id}/${name}.jpg") + '?' + new Date().getTime()}" alt=""
             class="photo-tochange-${name} max-height" def="${resource(file: 'damier.png', dir: 'images')}"/>
    </a>

</div>


<script type="text/javascript">
    $(document).ready(function () {
        dealWithWrongPhotos();

        $('#fileupload').fileupload({
            dataType: 'json',
            done: function (e, data) {
                $('#progress .bar').css(
                        'width', '100%'
                );
                var imgSrc = '${createLink(url: "/twr/${report.id}/${name}.jpg")}?' + (new Date().getTime())
                $(".photo-tochange-${name}").attr('src', imgSrc);
                $("#dialog-photo").dialog("close");
            },
            progressall: function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress .bar').css(
                        'width',
                        progress + '%'
                );
            }
        });
    });
</script>