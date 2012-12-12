package com.headbangers.reportmaker

class Person {

    transient springSecurityService

    String id

    String username
    String password
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    String token
    String email

    static constraints = {
        username blank: false, unique: true
        password blank: false
        token blank: false, nullable: false
        email email: true, nullable: false, blank: false
    }

    static mapping = {
        id generator: 'uuid'
        password column: '`password`'
    }

    Set<Role> getAuthorities() {
        PersonRole.findAllByPerson(this).collect { it.role } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }
}
