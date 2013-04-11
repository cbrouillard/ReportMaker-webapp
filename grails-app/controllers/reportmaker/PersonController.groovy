package reportmaker

import com.headbangers.reportmaker.Person
import com.headbangers.reportmaker.Report
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class PersonController {

    def springSecurityService
    static allowedMethods = [save: "POST", update: "POST"]

    @Secured(["ROLE_ADMIN"])
    def index() {
        redirect(action: "list", params: params)
    }

    @Secured(["ROLE_ADMIN"])
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [personInstanceList: Person.list(params), personInstanceTotal: Person.count()]
    }

    @Secured(["ROLE_ADMIN", "ROLE_USER"])
    def profile() {
        def person = springSecurityService.currentUser
        def fiveLastReports = Report.findAllByOwner(person, [sort: 'date', order: 'desc', max: 5])

        [person: person, reports:fiveLastReports]
    }
}
