package scrumtime

class Product {
    String name
    String description

    static hasMany = [artifacts : Artifact]

    static constraints = {
        name(nullable: false, blank: false)
        description(nullable: false)
    }
}
