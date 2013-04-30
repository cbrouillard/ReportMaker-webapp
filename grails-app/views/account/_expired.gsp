<g:remoteLink action="expire" id="${id}" update="expired-${id}"
              class="btn ${!accountExpired ? "btn-success" : "btn-danger"}">
    ${accountExpired ?"Expiré" : "Non expiré"}
</g:remoteLink>