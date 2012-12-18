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
