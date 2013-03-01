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

class Turn {

    static belongsTo = [Report, Person]

    String id

    Integer num
    String comments1
    String comments2

    Boolean lastOne
    Boolean nightFight

    Person owner

    static constraints = {
        num nullable: false
        comments1 blank: true, nullable: true
        comments2 blank: true, nullable: true
        lastOne nullable: true
        nightFight nullable: true
    }

    static mapping = {
        id generator: 'uuid'
        comments1 type: 'text'
        comments2 type: 'text'
    }

    String getComments(int num) {
        return num == 1 ? comments1 : comments2;
    }
}
