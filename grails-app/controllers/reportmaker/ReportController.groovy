package reportmaker

import com.headbangers.reportmaker.Report
import grails.plugins.springsecurity.Secured

@Secured(["ROLE_USER", "ROLE_ADMIN"])
class ReportController {

    def springSecurityService

    def index() {redirect(action: 'list') }

    def list() {

        def person = springSecurityService.currentUser

        def report = new Report()
        report.owner = person

        def reports = Report.findAll(report, [sort: 'date', order: 'desc'])

        [reports: reports]
    }
}
