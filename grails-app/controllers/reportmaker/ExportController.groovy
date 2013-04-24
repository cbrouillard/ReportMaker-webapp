package reportmaker

import com.headbangers.reportmaker.Report

class ExportController {

    def html() {
        def report = Report.get(params.id)

        if (report) {
            render view: '/export/html', model: [report: report]
            return
        }

        redirect(action: 'list', controller: "report")
    }

    def bbcode() {
        def report = Report.get(params.id)

        if (report) {
            render view: '/export/bbcode', model: [report: report]
            return
        }

        redirect(action: 'list', controller: "report")

    }

    def pdf() {
        def report = Report.get(params.id)

        if (report) {

        }

        redirect(action: 'list', controller: "report")
    }
}
