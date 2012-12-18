package reportmaker

// CF. Config.groovy
// Toutes les actions de ce controller sont HTTPS.
class WebController {

    def springSecurityService

    def createReport() {
        // user: login de l'utilisateur
        // pass: hash de son password
        // reportData: json avec les données du rapport
        // photos: fichier zip contenant toutes les photos
        println params
        render "test"
    }

    private def checkUser(String username, String pass) {
        springSecurityService.reauthenticate(username, pass);
    }

}
