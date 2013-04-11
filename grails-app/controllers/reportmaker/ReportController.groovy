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

import com.headbangers.reportmaker.Report
import com.headbangers.reportmaker.Turn
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
        def reports = Report.findAllByOwner(person, [sort: 'date', order: 'desc'])

        [reports: reports]
    }

    def add() {
        def person = springSecurityService.currentUser
        def report = new Report()

        report.name = params.name
        report.owner = person
        report.date = new Date()
        report.firstPlayer = 1

        def playerOne = new Player()
        playerOne.name = params.player1 ?: "Joueur 1"
        playerOne.num = 1
        playerOne.owner = person

        def playerTwo = new Player()
        playerTwo.name = params.player2 ?: "Joueur 2"
        playerTwo.num = 2
        playerTwo.owner = person

        report.one = playerOne
        report.two = playerTwo

        (1..7).each {num ->
            Turn savedTurn = report.getTurn(num as Integer)
            if (!savedTurn) {
                savedTurn = new Turn()
                savedTurn.owner = person
                savedTurn.num = num
                report.addToTurns(savedTurn)
            }
            savedTurn.save()
        }

        if (report.validate() && report.save(flush: true)) {
            redirect(action: 'edit', id: report.id)
        } else {
            render "KO"
        }
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

    def admin() {

    }

    def update() {
        //println params
        def person = springSecurityService.currentUser
        def report = Report.findByIdAndOwner(params.id, person)

        if (report) {
            report.deploymentType = params.deploymentType.encodeAsHTML()
            report.scenario = params.scenario.encodeAsHTML()
            report.comments = params.comments.encodeAsHTML()
            report.firstPlayer = params.firstPlayer as Integer
            report.lordCapacity1 = params.lordCapacity1.encodeAsHTML()
            report.lordCapacity2 = params.lordCapacity2.encodeAsHTML()

            (1..7).each {num ->
                Turn savedTurn = report.getTurn(num as Integer)
                if (!savedTurn) {
                    savedTurn = new Turn()
                    savedTurn.owner = person
                    savedTurn.num = num
                    report.addToTurns(savedTurn)
                }

                savedTurn.comments1 = params["comments_p1_t$num"].encodeAsHTML()
                savedTurn.comments2 = params["comments_p2_t$num"].encodeAsHTML()
                savedTurn.lastOne = params["lastOne_t$num"] as Boolean
                savedTurn.nightFight = params["nightFight_t$num"] as Boolean
                savedTurn.save()
            }

            report.save(flush: true)
            flash.message = message(code: 'report.update.success')
            flash.level = "success"

            redirect(action: 'edit', id: report.id)

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
        } else {
            render "Erreur."
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

        render "<div class='alert alert-info'>OK</div>"
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

                log.info("Image type = " + type)
                if (!type.equalsIgnoreCase("image/jpeg")) {
                    println "Effacement de ${photo.name}"
                    FileTool.delete(photo)
                    // TODO envoyer un mail avertissement avec IP utilisateur et username pour futur blocage
                } else {

                    // Copie dans le répertoire de partage
                    String shareDir = grailsApplication.config.twr.photos.dir + File.separator + report.id
                    File shareDirFile = new File(shareDir)
                    shareDirFile.mkdirs();
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
