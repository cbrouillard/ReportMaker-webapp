package reportmaker

import grails.plugins.springsecurity.Secured

@Secured(["ROLE_ADMIN"])
class AdministrationController {
    def index() {}
}
