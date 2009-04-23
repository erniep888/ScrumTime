package scrumtime.scrum

import scrumtime.backlog.BacklogItem

class ScrumItem {
    Date dateCreated
    Date lastUpdated

    BacklogItem backlogItem
    int workRemaining  // in hours
    int workCompleted // in hours

    static constraints = {
        backlogItem(nullable:true)
    }
}
