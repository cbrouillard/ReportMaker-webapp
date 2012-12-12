package com.headbangers.reportmaker

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

    static constraints = {
        name blank: false, nullable: false
        date nullable: false
        format nullable: true
        deploymentType blank: true
        scenario blank: true
        firstPlayer nullable: false
        lordCapacity1 blank: true
        lordCapacity2 blank: true
        comments blank: true
    }

    static mapping = {
        id generator: 'uuid'
        comments type: 'text'
    }
}
