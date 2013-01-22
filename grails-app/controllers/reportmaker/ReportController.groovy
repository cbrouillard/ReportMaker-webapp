package reportmaker

import com.headbangers.reportmaker.Report
import grails.plugins.springsecurity.Secured
import grails.converters.JSON
import org.springframework.web.multipart.commons.CommonsMultipartFile
import org.codehaus.jackson.map.ObjectMapper
import javax.activation.FileDataSource
import com.headbangers.reportmaker.util.FileTool
import com.headbangers.reportmaker.MetadataPhoto
import com.headbangers.reportmaker.Player

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

//    def create() {}

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
        def person = springSecurityService.currentUser
        def report = Report.findByIdAndOwner(params.id, person)

        if (report) {
            report.deploymentType = params.deploymentType.encodeAsHTML()
            report.scenario = params.scenario.encodeAsHTML()
            report.comments = params.comments.encodeAsHTML()
            report.firstPlayer = params.firstPlayer
            report.lordCapacity1 = params.lordCapacity1.encodeAsHTML()
            report.lordCapacity2 = params.lordCapacity2.encodeAsHTML()

            Player p1 = report.getFirst()
            Player p2 = report.getSecond()

            report.turns.each {turn ->
            }

            report.save(flush: true)
            flash.message = message(code: 'report.update.success')
            render(view: 'edit', model: [report: report])

        } else {
            redirect(action: 'list')
        }
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

        def type = params.type ?: "html"

        if (report) {

            if (type.equals("html")) {
                render view: 'html', model: [report: report]
                return
            }

            if (type.equals("bbcode")) {
                render view: 'bbcode', model: [report: report]
                return
            }
        }

        redirect(action: 'list')
    }

    def changePhoto() {
        def person = springSecurityService.currentUser
        def report = Report.findByIdAndOwner(params.id, person)

        if (report) {
            render(template: "changePhoto", model: [name: params.name, report: report])
        }
    }

    def deletePhoto() {
        def person = springSecurityService.currentUser
        def report = Report.findByIdAndOwner(params.id, person)

        if (report) {
            MetadataPhoto meta = MetadataPhoto.findByReportAndOwnerAndPath(report, person, "/twr/${report.id}/${params.photo}.jpg")
            if (meta) {
                String shareDir = grailsApplication.config.twr.photos.dir + File.separator + report.id
                FileTool.delete(new File(shareDir, "${params.photo}.jpg"))

                meta.deleted = true
                meta.save(flush: true)
            }
        }

        render "OK"
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
                    // TODO envoyer un mail avertissement avec IP utilisateur pour futur blocage
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

                    }

                    meta.valid = false
                    meta.deleted = false
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
