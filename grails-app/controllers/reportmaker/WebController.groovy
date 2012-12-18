package reportmaker

import org.codehaus.jackson.map.ObjectMapper
import com.headbangers.reportmaker.pojo.Battle

// CF. Config.groovy
// Toutes les actions de ce controller sont HTTPS.
class WebController {


    def createReport() {
        // user: login de l'utilisateur
        // pass: hash de son password
        // reportData: json avec les données du rapport
        // photos: fichier zip contenant toutes les photos

        // Vérification de l'utilisateur

        // Récupération de la bataille
        ObjectMapper mapper = new ObjectMapper()
        Battle battle = mapper.readValue(params.reportData, Battle.class)

        // Récupération du fichier zip

        // Décompression du fichier zip

        render battle.toString()
    }

    private def checkUser(String username, String pass) {
    }

}
