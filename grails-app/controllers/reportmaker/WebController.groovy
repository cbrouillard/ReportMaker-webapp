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

import com.headbangers.reportmaker.util.ResizeTool
import org.codehaus.jackson.map.ObjectMapper
import com.headbangers.reportmaker.pojo.Battle
import org.springframework.web.multipart.commons.CommonsMultipartFile
import com.headbangers.reportmaker.Report
import com.headbangers.reportmaker.Person
import java.util.zip.ZipInputStream
import java.util.zip.ZipEntry

import com.headbangers.reportmaker.util.FileTool
import com.headbangers.reportmaker.MetadataPhoto

// CF. Config.groovy
// Toutes les actions de ce controller sont HTTPS.
class WebController {

    def grailsApplication

    def createReport() {
        // user: login de l'utilisateur
        // pass: hash de son password
        // reportData: json avec les données du rapport
        // photos: fichier zip contenant toutes les photos

        // Vérification de l'utilisateur
        Person owner = checkUser(params.user, params.pass)

        if (owner) {

            // Récupération de la bataille
            if (!params.reportData) {
                render status: 500, message: "Error"
                return
            }
            ObjectMapper mapper = new ObjectMapper()
            Battle battle = mapper.readValue(params.reportData, Battle.class)

            // Vérification des données de bataille
            Report report = new Report()
            report.buildFromBattle(battle, owner)
            if (report.validate() && report.save(flush: true)) {

                // Rapport enregistré. On peut traiter les photos
                // Récupération du fichier zip
                CommonsMultipartFile photos = request.getFile('photos')
                if (photos) {
                    println photos.contentType

                    // Décompression du fichier zip
                    File zipFile = new File("/tmp", report.id + ".zip")
                    photos.transferTo(zipFile)
                    unZipIt(zipFile, "/tmp/${report.id}")

                    // Vérification du contenu. Tout ce qui n'est pas image saute.
                    File rootZip = new File("/tmp/${report.id}")
                    for (File fileToCheck : rootZip.listFiles()) {
                        if (!FileTool.isFileAnImage(fileToCheck)) {
                            println "Effacement de ${fileToCheck.name}"
                            fileToCheck.delete();
                        }
                    }

                    // Déplacement du dossier dans l'emplacement géré par Apache.
                    String finalDirName = grailsApplication.config.twr.photos.dir + File.separator + report.id
                    File finalDir = new File(finalDirName)
                    FileTool.copyDirectory(rootZip, finalDir)
                    FileTool.delete(rootZip)

                    // Redimmensionnement
                    ResizeTool.resizeAllReportImages(report.id)

                    // Ajout des paths des photos dans la table de gestion
                    for (File file : finalDir.listFiles()) {
                        MetadataPhoto metaPhoto = new MetadataPhoto()
                        metaPhoto.path = "/twr/${report.id}/${file.name}"
                        metaPhoto.owner = owner
                        metaPhoto.report = report
                        metaPhoto.save(flush: true)
                    }
                }

                render status: 200, message: "Ok"

            } else {

                render status: 500, message: "Error"
            }

        } else {

            render status: 403, message: "Error"
        }
    }

    private Person checkUser(String username, String pass) {
        def person = Person.findByUsernameAndPasswordAndEnabled(username, pass, true);
        return person
    }

    private void unZipIt(File zipFile, String outputFolder) {

        byte[] buffer = new byte[1024];

        try {

            //create output directory is not exists
            File folder = new File(outputFolder);
            if (!folder.exists()) {
                folder.mkdir();
            }

            //get the zip file content
            ZipInputStream zis =
                new ZipInputStream(new FileInputStream(zipFile));
            //get the zipped file list entry
            ZipEntry ze = zis.getNextEntry();

            while (ze != null) {

                String fileName = ze.getName();
                File newFile = new File(outputFolder + File.separator + fileName);

                //create all non exists folders
                //else you will hit FileNotFoundException for compressed folder
                new File(newFile.getParent()).mkdirs();

                FileOutputStream fos = new FileOutputStream(newFile);

                int len;
                while ((len = zis.read(buffer)) > 0) {
                    fos.write(buffer, 0, len);
                }

                fos.close();
                ze = zis.getNextEntry();
            }

            zis.closeEntry();
            zis.close();

        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

}
