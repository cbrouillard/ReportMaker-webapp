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

public class Informations {

    private String deploymentType;
    private String scenario;
    private Integer firstPlayer;
    private String lordCapacity1;
    private String lordCapacity2;
    private String comments;

    public Informations() {
    }


    public String getDeploymentType() {
        return deploymentType;
    }

    public void setDeploymentType(String deploymentType) {
        this.deploymentType = deploymentType;
    }

    public String getScenario() {
        return scenario;
    }

    public void setScenario(String scenario) {
        this.scenario = scenario;
    }

    public int getFirstPlayer() {
        return firstPlayer;
    }

    public void setFirstPlayer(Integer firstPlayer) {
        this.firstPlayer = firstPlayer;
    }

    public String getLordCapacity1() {
        return lordCapacity1;
    }

    public void setLordCapacity1(String lordCapacity1) {
        this.lordCapacity1 = lordCapacity1;
    }

    public String getLordCapacity2() {
        return lordCapacity2;
    }

    public void setLordCapacity2(String lordCapacity2) {
        this.lordCapacity2 = lordCapacity2;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }


}
