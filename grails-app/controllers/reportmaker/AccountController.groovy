package reportmaker

import com.headbangers.reportmaker.Person
import com.headbangers.reportmaker.PersonRole
import com.headbangers.reportmaker.Role
import grails.plugins.springsecurity.Secured

@Secured(["ROLE_ADMIN"])
class AccountController {

    def springSecurityService

    def index() {
        redirect(action: 'list')
    }

    def list() {
        //        def max = params.max ?: 50
        //        def offset = params.offset ?: 0

        def persons = Person.createCriteria().list() {
            //            maxResults max
            //            firstResult offset

            order("dateCreated", "desc")
        }

        [persons: persons]
    }

    def create() {
        def person = new Person(params)
        person.enabled = true
        person.accountExpired = false
        person.accountLocked = false
        person.passwordExpired = false
        person.token = "ADMIN CREATED"

        person.save(flush: true)

        def roleUser = Role.findByAuthority("ROLE_USER")
        if (!roleUser) {
            // Should not happen
            roleUser = new Role(authority: "ROLE_USER").save(flush: true)
        }
        PersonRole.create(person, roleUser, true)
        redirect(action: 'list')
    }

    def active() {
        def person = Person.get(params.id)

        if (person) {
            person.enabled = !person.enabled
            person.save(flush: true)
            render(template: "active", model: [id: person.id, enabled: person.enabled])
            return
        }

        render "Erreur"
    }

    def lock() {
        def person = Person.get(params.id)

        if (person) {
            person.accountLocked = !person.accountLocked
            person.save(flush: true)
            render(template: "lock", model: [id: person.id, accountLocked: person.accountLocked])
            return
        }

        render "Erreur"
    }

    def expire() {
        def person = Person.get(params.id)

        if (person) {
            person.accountExpired = !person.accountExpired
            person.save(flush: true)
            render(template: "expired", model: [id: person.id, accountExpired: person.accountExpired])
            return
        }

        render "Erreur"
    }
}
