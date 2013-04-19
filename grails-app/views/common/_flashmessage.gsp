<g:if test='${flash.message}'>
    <div class="alert ${flash.level ? 'alert-' + flash.level : 'alert-warning'}">${flash.message}</div>
    <g:set var="flash.message" value="${null}"/>
</g:if>