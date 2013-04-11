import com.headbangers.reportmaker.Person
import com.headbangers.reportmaker.PersonRole
import com.headbangers.reportmaker.Role

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
class BootStrap {

    def init = {servletContext ->

        def admin = Person.findByUsername("admin")
        if (!admin) {

            // Création de l'user admin
            admin = new Person()
            admin.accountExpired = false
            admin.accountLocked = false
            admin.email = "cyril.brouillard@gmail.com"
            admin.enabled = true
            admin.passwordExpired = false
            admin.username = "admin"
            admin.token = "VALIDATED_NOT_USED"

            admin.password = "admin"
            admin.save(flush: true)

            def roleAdmin = Role.findByAuthority("ROLE_ADMIN")
            if (!roleAdmin) {
                // Should not happen
                roleAdmin = new Role(authority: "ROLE_ADMIN").save(flush: true)
            }
            PersonRole.create(admin, roleAdmin, true)
        }
    }
    def destroy = {
    }
}
