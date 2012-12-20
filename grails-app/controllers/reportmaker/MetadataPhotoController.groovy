package reportmaker

import grails.plugins.springsecurity.Secured
import com.headbangers.reportmaker.MetadataPhoto
import com.headbangers.reportmaker.util.FileTool

//@Secured(["ROLE_ADMIN"])
class MetadataPhotoController {

    def index() {
        redirect(action: 'list')
    }

    def list() {

        def max = params.max ?: 50
        def offset = params.offset ?: 0

        def photos = MetadataPhoto.createCriteria().list() {
            maxResults max
            firstResult offset

            order("valid", "asc")
            order("dateCreated", "desc")
        }

        [photos: photos]
    }

    def ok() {

        def photo = MetadataPhoto.get(params.id)
        photo.valid = true
        photo.save(flush: true)

        render(template: 'photo', model: [photo: photo])

    }

    def delete() {

        def photo = MetadataPhoto.get(params.id)
        photo.valid = false
        photo.deleted = true
        photo.save(flush: true)

        // Effacement du fichier
        String rootDir = grailsApplication.config.twr.photos.dir + File.separator + photo.report.id
        FileTool.delete(new File(rootDir, photo.path.split("/").last()))

        render(template: "deleted", model: [photo: photo])
    }
}
