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

    def create() {}

    def edit() {
        def person = springSecurityService.currentUser
        def report = Report.findByIdAndOwner(params.id, person)

        if (report) {
            render(view: 'edit', [report: report])
            return
        }

        redirect(action: 'list')
    }

    def update() {

    }

    def pdf() {
        def person = springSecurityService.currentUser
        def report = Report.findByIdAndOwner(params.id, person)

        if (report) {

        }
    }

    def code() {
        def person = springSecurityService.currentUser
        def report = Report.findByIdAndOwner(params.id, person)

        if (report) {

        }
    }
}
