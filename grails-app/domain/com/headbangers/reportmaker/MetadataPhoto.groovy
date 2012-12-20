package com.headbangers.reportmaker

class MetadataPhoto {

    String id

    String path

    Report report
    Person owner

    Date dateCreated

    boolean valid = false
    boolean deleted = false

    static constraints = {
        path nullable: false, blank: false
    }

    static mapping = {
        id generator: 'uuid'
        autoTimestamp true
    }
}
