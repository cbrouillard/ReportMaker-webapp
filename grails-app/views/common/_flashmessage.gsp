<div class="row">
    <div class="span12">
        <g:if test='${flash.message}'>
            <div class="alert ${flash.level ? 'alert-' + flash.level : 'alert-warning'}">${flash.message}</div>
        </g:if>
    </div>
</div>