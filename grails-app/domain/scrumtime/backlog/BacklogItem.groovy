package scrumtime.backlog

class BacklogItem {
    Date dateCreated
    Date lastUpdated

    String title
    String description
    int workRemaining  // in hours
    int workCompleted // in hours
    String assignedTo
    String estimatedBy

    static constraints = {
        title(blank: false, nullable: false, size: 1..80)
        description(nullable: true, size: 0..512)
        assignedTo(nullable: true)
        assignedTo(nullable: true)
        estimatedBy(nullable: true)
    }
}
