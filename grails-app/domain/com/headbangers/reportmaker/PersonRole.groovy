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

import org.apache.commons.lang.builder.HashCodeBuilder

class PersonRole implements Serializable {

	Person person
	Role role

	boolean equals(other) {
		if (!(other instanceof PersonRole)) {
			return false
		}

		other.person?.id == person?.id &&
			other.role?.id == role?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (person) builder.append(person.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static PersonRole get(long personId, long roleId) {
		find 'from PersonRole where person.id=:personId and role.id=:roleId',
			[personId: personId, roleId: roleId]
	}

	static PersonRole create(Person person, Role role, boolean flush = false) {
		new PersonRole(person: person, role: role).save(flush: flush, insert: true)
	}

	static boolean remove(Person person, Role role, boolean flush = false) {
		PersonRole instance = PersonRole.findByPersonAndRole(person, role)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(Person person) {
		executeUpdate 'DELETE FROM PersonRole WHERE person=:person', [person: person]
	}

	static void removeAll(Role role) {
		executeUpdate 'DELETE FROM PersonRole WHERE role=:role', [role: role]
	}

	static mapping = {
		id composite: ['role', 'person']
		version false
	}
}
