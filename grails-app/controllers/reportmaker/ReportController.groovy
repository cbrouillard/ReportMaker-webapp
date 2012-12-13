package reportmaker

import com.headbangers.reportmaker.Report

class ReportController {

    def springSecurityService

    def index() {redirect(action: 'list') }

    def list() {

        def person = springSecurityService.currentUser

        def report = new Report()
        report.owner = person

        def reports = Report.findAll(report)
//        def reports = Report.findAllByOwner(person)

        [reports: reports]
    }
}
