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

    Date dateCreated

    static constraints = {
        username blank: false, unique: true
        password blank: false
        token blank: false, nullable: false
        email email: true, nullable: false, blank: false

        dateCreated nullable: true
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
