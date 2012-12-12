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
        comments1 blank: true
        comments2 blank: true
        lastOne nullable: true
        nightFight nullable: true
    }

    static mapping = {
        id generator: 'uuid'
        comments1 type: 'text'
        comments2 type: 'text'
    }
}
