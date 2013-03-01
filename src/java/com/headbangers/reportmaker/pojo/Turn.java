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

public class Turn {

    private Integer num;

    // private String commentsMove1;
    // private String commentsMove2;
    //
    // private String commentsShoot1;
    // private String commentsShoot2;
    //
    // private String commentsAssault1;
    // private String commentsAssault2;

    private String comments1;
    private String comments2;

    private Boolean lastOne;
    private Boolean nightFight;

    public Turn() {
    }

    public void setLastOne(Boolean isLastOne) {
        this.lastOne = isLastOne;
    }

    public void setNightFight(Boolean nightFight) {
        this.nightFight = nightFight;
    }

    public Boolean isNightFight() {
        return nightFight;
    }

    public Boolean isLastOne() {
        return lastOne;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getComments1() {
        return comments1;
    }

    public String getComments2() {
        return comments2;
    }

    public void setComments1(String comments1) {
        this.comments1 = comments1;
    }

    public void setComments2(String comments2) {
        this.comments2 = comments2;
    }

    public String getComments(int numPlayer) {
        return numPlayer == 1 ? getComments1() : getComments2();
    }

    // public String getCommentsMove(int numPlayer) {
    // return numPlayer == 1 ? getCommentsMove1() : getCommentsMove2();
    // }
    //
    // public String getCommentsShoot(int numPlayer) {
    // return numPlayer == 1 ? getCommentsShoot1() : getCommentsShoot2();
    // }
    //
    // public String getCommentsAssault(int numPlayer) {
    // return numPlayer == 1 ? getCommentsAssault1() : getCommentsAssault2();
    // }

}
