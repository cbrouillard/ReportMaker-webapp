/**
 * Copyright (C) 2013 Cyril Brouillard <cyril.brouillard@gmail.com>
 *
 * This file is part of reportmaker.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package reportmaker

import grails.plugins.springsecurity.Secured
import com.headbangers.reportmaker.MetadataPhoto
import com.headbangers.reportmaker.util.FileTool

@Secured(["ROLE_ADMIN"])
class MetadataPhotoController {

    def index() {
        redirect(action: 'list')
    }

    def list() {

        def max = params.max ?: 50
        def offset = params.offset ?: 0

        def photos = MetadataPhoto.createCriteria().list() {
            eq("valid", false)
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
