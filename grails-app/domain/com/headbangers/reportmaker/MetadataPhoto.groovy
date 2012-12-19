package com.headbangers.reportmaker

class MetadataPhoto {

    String id

    String path

    Report report
    Person owner

    Date dateCreated

    static constraints = {
        path nullable: false, blank: false
    }

    static mapping = {
        id generator: 'uuid'
        autoTimestamp true
    }
}
