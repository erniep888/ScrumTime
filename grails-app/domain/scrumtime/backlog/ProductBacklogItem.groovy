package scrumtime.backlog

import scrumtime.product.Product

class ProductBacklogItem {
    static belongsTo = [product: Product]
    Product product

    BacklogItem backlogItem
    int priorityIndex

    static constraints = {
        product(nullable:false)
        backlogItem(nullable:false)
        priorityIndex(nullable:false)
    }
}
