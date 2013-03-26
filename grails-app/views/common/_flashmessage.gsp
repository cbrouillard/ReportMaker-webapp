<div class="row">
    <g:if test='${flash.message}'>
        <div class="alert ${flash.level ? 'alert-' + flash.level : 'alert-warning'}">${flash.message}</div>
    </g:if>
</div>