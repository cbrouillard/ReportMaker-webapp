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

    @Secured(["ROLE_ADMIN", "ROLE_USER"])
    def changePassForm (){
        if (!params['pass'] || !params["passCheck"] || !params.pass.equals(params.passCheck)){
            // error
            flash.message = message(code:"person.changepass.invalid.pass")
            flash.level = 'error'
            render template: '/common/flashmessage'
            return
        }

        def person = springSecurityService.currentUser
        person.password = params.pass
        person.save(flush:true)

        flash.message = message(code:"person.changepass.valid")
        flash.level = 'success'

        render template:  '/common/closemodal'
    }

    @Secured(["ROLE_ADMIN", "ROLE_USER"])
    def updateInfos (){

    }
}
