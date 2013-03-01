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

import java.util.Date;
import java.util.List;

public class Battle {

    private Long id;

    private String name;
    private Integer format;
    private Date date;
    private String dateFormated;

    private Player one;
    private Player two;

    private Informations infos;
    private List<Turn> turns;

    public Battle() {
        this.one = new Player();
        this.two = new Player();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getFormat() {
        return format;
    }

    public void setFormat(Integer format) {
        this.format = format;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getDate() {
        return date;
    }

    public Long getId() {
        return id;
    }

    public String getDateFormated() {
        return this.dateFormated;
    }

    public void setOne(Player one) {
        this.one = one;
    }

    public void setTwo(Player two) {
        this.two = two;
    }

    public Player getOne() {
        return one;
    }

    public Player getTwo() {
        return two;
    }

    public Informations getInfos() {
        return infos;
    }

    public void setInfos(Informations infos) {
        this.infos = infos;
    }

    public List<Turn> getTurns() {
        return turns;
    }

    public void setTurns(List<Turn> turns) {
        this.turns = turns;
    }

    public Turn getTurn(int numTurn) {

        for (Turn turn : turns) {
            if (turn.getNum().equals(numTurn)) {
                return turn;
            }
        }

        return new Turn();

    }

    public Player getPlayer(int firstPlayer) {

        if (firstPlayer == 0) {
            return one;
        }

        return two;
    }

    public Player getOtherPlayer(int firstPlayer) {
        if (firstPlayer == 0) {
            return two;
        }
        return one;
    }


    public String toString() {
        return this.name;
    }
}
