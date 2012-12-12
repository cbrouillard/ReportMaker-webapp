package com.headbangers.reportmaker

class Player {

    static belongsTo = [Report, Person]

    String id

    String name
    String race
    Integer num

    Person owner

    static constraints = {
        name blank: false, nullable: false
        race blank: true
        num nullable: false
    }

    static mapping = {
        id generator: 'uuid'
    }
}
