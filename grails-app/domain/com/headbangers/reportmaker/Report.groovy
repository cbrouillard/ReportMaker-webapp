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

import com.headbangers.reportmaker.pojo.Battle

class Report {

    static hasMany = [turns: Turn]
    static belongsTo = [Person]

    String id

    String name
    Date date
    Integer format

    String deploymentType
    String scenario
    Integer firstPlayer
    String lordCapacity1
    String lordCapacity2
    String comments

    Player one
    Player two

    Person owner
    List<Turn> turns;

    static constraints = {
        name blank: false, nullable: false
        date nullable: false
        format nullable: true
        deploymentType blank: true, nullable: true
        scenario blank: true, nullable: true
        firstPlayer nullable: false
        lordCapacity1 blank: true, nullable: true
        lordCapacity2 blank: true, nullable: true
        comments blank: true, nullable: true
    }

    static mapping = {
        id generator: 'uuid'
        comments type: 'text'
    }

    Turn getTurn(int num) {
        turns.each {t ->
            if (t.num.equals(num)) {
                return t
            }
        }
        return null
    }

    Player getFirst() {
        return one.num == 1 ? one : two;
    }

    Player getSecond() {
        return one.num == 1 ? two : one;
    }

    public void buildFromBattle(Battle battle, Person owner) {
        // Informations
        this.name = battle.name
        this.date = battle.date
        this.format = battle.format
        this.deploymentType = battle.infos?.deploymentType
        this.scenario = battle.infos?.scenario
        this.firstPlayer = battle.infos?.firstPlayer
        this.lordCapacity1 = battle.infos?.lordCapacity1
        this.lordCapacity2 = battle.infos?.lordCapacity2
        this.comments = battle.infos?.comments
        this.owner = owner

        // Joueurs
        this.one = new Player()
        this.one.name = battle.one?.name
        this.one.race = battle.one?.race
        this.one.num = firstPlayer == 1 ? 1 : 2;
        this.one.owner = owner

        this.two = new Player()
        this.two.name = battle.two?.name
        this.two.race = battle.two?.race
        this.two.num = firstPlayer == 1 ? 2 : 1;
        this.two.owner = owner

        // Tours
        this.turns = new ArrayList<Turn>()
        (1..7).each {nt ->

            com.headbangers.reportmaker.pojo.Turn tData = battle.getTurn(nt)
            if (tData) {
                Turn turn = new Turn()
                turn.owner = owner
                turn.comments1 = tData.comments1
                turn.comments2 = tData.comments2
                turn.lastOne = tData.lastOne
                turn.nightFight = tData.nightFight
                turn.num = nt

                this.turns.add(turn)
            }
        }
    }
}
