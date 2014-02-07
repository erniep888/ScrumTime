package scrumtime

import grails.rest.Resource

class Story {

    Date dateCreated
    Date lastUpdated

    String title
    String narrative

    Integer storyPoints

    Story parent

    static constraints = {
        narrative maxSize: 1000, blank: false
        parent nullable: true
        title nullable: true
        storyPoints nullable: true
    }

    static mapping = {

    }
}
