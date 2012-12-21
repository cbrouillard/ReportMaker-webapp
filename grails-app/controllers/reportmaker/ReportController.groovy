package reportmaker

import com.headbangers.reportmaker.Report
import grails.plugins.springsecurity.Secured
import grails.converters.JSON
import org.springframework.web.multipart.commons.CommonsMultipartFile
import org.codehaus.jackson.map.ObjectMapper
import javax.activation.FileDataSource
import com.headbangers.reportmaker.util.FileTool
import com.headbangers.reportmaker.MetadataPhoto

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
            render(view: 'edit', model: [report: report])
            return
        }

        redirect(action: 'list')
    }

    def update() {
        println params
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

    def changePhoto() {
        def person = springSecurityService.currentUser
        def report = Report.findByIdAndOwner(params.id, person)

        if (report) {
            render(template: "changePhoto", model: [name: params.name, report: report])
        }
    }

    def upload() {
        def person = springSecurityService.currentUser
        def report = Report.findByIdAndOwner(params.id, person)

        if (report) {
            Collection result = []
            request.fileNames.each {
                CommonsMultipartFile file = request.getFile(it)
                result << [name: file.originalFilename, size: file.size]

                // Copie du fichier dans /tmp
                File photo = new File("/tmp/" + params.photo + ".jpg")
                file.transferTo(photo)

                // Si ce n'est pas image, c'est supprimé
                FileDataSource ds = new FileDataSource(photo)
                String type = ds.contentType

                if (!type.equalsIgnoreCase("image/jpeg")) {
                    println "Effacement de ${photo.name}"
                    FileTool.delete(photo)
                } else {

                    // Copie dans le répertoire de partage
                    String shareDir = grailsApplication.config.twr.photos.dir + File.separator + report.id
                    FileTool.copyFile(photo, new File(shareDir, photo.name))
                    FileTool.delete(photo)

                    // Ajout/modification de la metadata
                    MetadataPhoto meta = MetadataPhoto.findByReportAndOwnerAndPath(report, person, "/twr/${report.id}/${photo.name}")
                    if (!meta) {
                        meta = new MetadataPhoto()
                        meta.report = report
                        meta.owner = person
                        meta.path = "/twr/${report.id}/${photo.name}"

                    } else {
                        meta.valid = false
                    }

                    meta.save(flush: true)

                    // OK

                }
            }

            ObjectMapper mapper = new ObjectMapper()
            render(contentType: 'text/json') {
                files = result
            }
        } else {
            redirect action: 'list'
        }


    }
}
