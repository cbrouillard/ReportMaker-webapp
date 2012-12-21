<legend>${report.name} - Photo "${name}"</legend>
<ul class="thumbnails">
    <li class="span12">
        <div class="thumbnail">

            <a href="javascript:zoomOn();">
                <img src="${createLink(url: "/twr/${report.id}/${name}.jpg")}" alt="" class="photo-tochange"/>
            </a>

            <div id="fileupload">
                <form action="${createLink(action: 'upload', controller: 'report', id: report.id, params: [photo: name])}"
                      method="POST" enctype="multipart/form-data">
                    <div class="fileupload-buttonbar">
                        <input type="hidden" name="protocol" value="http"/>
                        <label class="fileinput-button">
                            <input type="file" name="files[]" value="Selectionnez"/>
                        </label>
                    </div>
                </form>

                <div class="fileupload-content" id="fileupload-content">
                    <div id="progress" class="progress progress-striped progress-warning">
                        <div class="bar" style="width: 0%;"></div>
                    </div>
                </div>
            </div>

        </div>
    </li>
</ul>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#fileupload').fileupload({
            dataType:'json',
            done:function (e, data) {
//                $.each(data.result.files, function (index, file) {
//                    $('<p/>').text(file.name).appendTo(document.body);
//                });
                $('#progress .bar').css(
                        'width', '100%'
                );
                var imgSrc = '${createLink(url: "/twr/${report.id}/${name}.jpg")}?' + (new Date().getTime())
                $(".photo-tochange").attr('src', imgSrc);
            },
            progressall:function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress .bar').css(
                        'width',
                        progress + '%'
                );
            }
        });
    });
</script>