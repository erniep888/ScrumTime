package org.scrumtime.domain

class Story {

    Date dateCreated
    Date lastUpdated

    String title
    String narrative

    Integer storyPoints

    Story parent

    static constraints = {
        narrative maxSize: 1000, blank: false
    }

    static mapping = {

    }
}
