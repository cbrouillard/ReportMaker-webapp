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
package com.headbangers.reportmaker.pojo;

public class Player {

    private String name;
    private String race;
    private String armyComments;

    public String getName() {
        return name;
    }

    public String getRace() {
        return race;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setRace(String race) {
        this.race = race;
    }

    public String getArmyComments() {
        return armyComments;
    }

    public void setArmyComments(String armyComments) {
        this.armyComments = armyComments;
    }
}
