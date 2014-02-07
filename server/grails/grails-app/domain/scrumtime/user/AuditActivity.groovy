package scrumtime.user

class AuditActivity {
    Date dateCreated
    Date lastUpdated
    String type
    String description
    String username
    // static hasMany = []
    // static belongsTo = []
    // static constraints = {}

    String toString()
    {
        return "${id}"
    }
}