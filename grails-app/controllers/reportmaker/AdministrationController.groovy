package reportmaker

import com.headbangers.reportmaker.Person
import com.headbangers.reportmaker.Report
import com.headbangers.reportmaker.util.ResizeTool
import grails.plugins.springsecurity.Secured

@Secured(["ROLE_ADMIN"])
class AdministrationController {
    def index() {}

    def reports() {
        params.max = Math.min(params.max ?: 10, 100)
        [reports: Report.list(params), total: Report.count()]
    }

    def thumbnailsReport(){
        render ResizeTool.resizeAllReportImages(params.id)
    }
}
