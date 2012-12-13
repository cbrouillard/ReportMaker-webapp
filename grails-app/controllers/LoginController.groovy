import org.springframework.security.core.context.SecurityContextHolder as SCH

import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.web.WebAttributes
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter

import javax.servlet.http.HttpServletResponse
import com.headbangers.reportmaker.Person
import com.headbangers.reportmaker.Role
import com.headbangers.reportmaker.PersonRole
import com.headbangers.reportmaker.util.Md5

class LoginController {

    /**
     * Dependency injection for the authenticationTrustResolver.
     */
    def authenticationTrustResolver

    /**
     * Dependency injection for the springSecurityService.
     */
    def springSecurityService

    def mailService

    /**
     * Default action; redirects to 'defaultTargetUrl' if logged in, /login/auth otherwise.
     */
    def index = {
        if (springSecurityService.isLoggedIn()) {
            redirect uri: SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl
        }
        else {
            redirect action: 'auth', params: params
        }
    }

    def register = {[personInstance: new Person()]}

    // Création de l'utilisateur
    def apply = {
        def person = new Person(params)

        person.enabled = false
        person.accountExpired = false
        person.passwordExpired = false
        person.accountLocked = false

        // Génération du token
        def token = Md5.encode("${person.username}${person.password}${person.email}")
        person.token = token

        if (!person.save(flush: true)) {
            render(view: "register", model: [personInstance: person])
            return
        }

        // Attachement du role global
        def roleUser = Role.findByAuthority("ROLE_USER")
        if (!roleUser) {
            // Should not happen
            roleUser = new Role(authority: "ROLE_USER").save(flush: true)
        }
        PersonRole.create(person, roleUser, true)

        // Attachement d'un role perso
        def roleSpecial = new Role(authority: "ROLE_${person.username.toUpperCase().trim().replaceAll(" ", "_")}").save(flush: true)
        PersonRole.create(person, roleSpecial, true)

        // Envoi d'un email avec un token de confirmation
        sendRegistrationMail(person)

        // Retour à la vue de login avec un message
        flash.message = message(code: 'registration.look.at.your.mail')
        redirect(action: 'auth')
    }

    private sendRegistrationMail(Person person) {

        def token = person.token

        try {
            mailService.sendMail {
                to person.email
                from "noreply@tacticalwarreport.com"
                subject message(code: 'mail.registration.subject')
                html(view: '/mail/registration', model: [token: token, person: person])
            }
            return true
        } catch (Exception e) {
            log.info("Pour information voici le token généré -> ${token} pour la personne -> ${person.username}");
            log.fatal("Impossible d'envoyer le mail", e)
            return false
        }

    }

    // Validation de l'enregistrement
    def validate = {
        def person = Person.findByToken(params.id)
        if (person) {
            person.enabled = true
            person.token = "VALIDATED"
            person.save(flush: true)


            flash.message = message(code: 'registration.complete')
        } else {
            flash.message = message(code: "springSecurity.errors.login.disabled")
        }

        redirect(action: 'auth')
    }

    /**
     * Show the login page.
     */
    def auth = {

        def config = SpringSecurityUtils.securityConfig

        if (springSecurityService.isLoggedIn()) {
            redirect uri: config.successHandler.defaultTargetUrl
            return
        }

        String view = 'auth'
        String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
        render view: view, model: [postUrl: postUrl,
                rememberMeParameter: config.rememberMe.parameter]
    }

    /**
     * The redirect action for Ajax requests.
     */
    def authAjax = {
        response.setHeader 'Location', SpringSecurityUtils.securityConfig.auth.ajaxLoginFormUrl
        response.sendError HttpServletResponse.SC_UNAUTHORIZED
    }

    /**
     * Show denied page.
     */
    def denied = {
        if (springSecurityService.isLoggedIn() &&
                authenticationTrustResolver.isRememberMe(SCH.context?.authentication)) {
            // have cookie but the page is guarded with IS_AUTHENTICATED_FULLY
            redirect action: 'full', params: params
        }
    }

    /**
     * Login page for users with a remember-me cookie but accessing a IS_AUTHENTICATED_FULLY page.
     */
    def full = {
        def config = SpringSecurityUtils.securityConfig
        render view: 'auth', params: params,
                model: [hasCookie: authenticationTrustResolver.isRememberMe(SCH.context?.authentication),
                        postUrl: "${request.contextPath}${config.apf.filterProcessesUrl}"]
    }

    /**
     * Callback after a failed login. Redirects to the auth page with a warning message.
     */
    def authfail = {

        def username = session[UsernamePasswordAuthenticationFilter.SPRING_SECURITY_LAST_USERNAME_KEY]
        String msg = ''
        def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]
        if (exception) {
            if (exception instanceof AccountExpiredException) {
                msg = g.message(code: "springSecurity.errors.login.expired")
            }
            else if (exception instanceof CredentialsExpiredException) {
                msg = g.message(code: "springSecurity.errors.login.passwordExpired")
            }
            else if (exception instanceof DisabledException) {
                msg = g.message(code: "springSecurity.errors.login.disabled")
            }
            else if (exception instanceof LockedException) {
                msg = g.message(code: "springSecurity.errors.login.locked")
            }
            else {
                msg = g.message(code: "springSecurity.errors.login.fail")
            }
        }

        if (springSecurityService.isAjax(request)) {
            render([error: msg] as JSON)
        }
        else {
            flash.message = msg
            redirect action: 'auth', params: params
        }
    }

    /**
     * The Ajax success redirect url.
     */
    def ajaxSuccess = {
        render([success: true, username: springSecurityService.authentication.name] as JSON)
    }

    /**
     * The Ajax denied redirect url.
     */
    def ajaxDenied = {
        render([error: 'access denied'] as JSON)
    }
}
