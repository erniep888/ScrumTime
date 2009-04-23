package scrumtime.backlog

class BacklogItem {
    Date dateCreated
    Date lastUpdated

    String title
    String description
    int workEstimate  // in hours
    String assignedTo
    String estimatedBy

    static constraints = {
        title(blank: false, nullable: false, size: 1..256)
        description(nullable: true, size: 0..512)
        workEstimate(nullable:false)
        assignedTo(nullable: true)
        estimatedBy(nullable: true)
    }
}
