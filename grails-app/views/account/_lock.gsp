<g:remoteLink action="lock" id="${id}" update="lock-${id}"
              class="btn ${!accountLocked ? "btn-success" : "btn-danger"}">
    ${accountLocked ? "Bloqué" : "Non bloqué"}
</g:remoteLink>