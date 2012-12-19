package reportmaker

import grails.plugins.springsecurity.Secured
import com.headbangers.reportmaker.MetadataPhoto

//@Secured(["ROLE_ADMIN"])
class MetadataPhotoController {

    def index() {
        redirect(action: 'list')
    }

    def list() {
        def photos = MetadataPhoto.list(offset: params.offset, max: params.max, order: "desc", sort: "dateCreated")
        [photos: photos]
    }
}
