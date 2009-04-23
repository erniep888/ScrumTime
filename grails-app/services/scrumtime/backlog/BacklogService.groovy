package scrumtime.backlog

import scrumtime.product.Product

class BacklogService {

    boolean transactional = true

    def createProductBacklogItem(Product product, def title, def description,
                                 String workEstimate, String estimatedBy) {
        // todo: handle null product
        def backlogItem = new BacklogItem(title: title, description: description,
            workEstimate: (workEstimate ? Integer.parseInt(workEstimate):null),
            estimatedBy: (estimatedBy&&estimatedBy == '-1' ? null:estimatedBy))  // Todo: handle invalid number inputs
        backlogItem.validate()
        def productBacklogItem = new ProductBacklogItem(product: product, backlogItem: backlogItem)
        if (!backlogItem.hasErrors()) {
            def nextPriorityIndex = ProductBacklogItem.countByProduct(product) + 1
            productBacklogItem.priorityIndex = nextPriorityIndex
            backlogItem.save()
            if (productBacklogItem.validate()) {
                productBacklogItem.save()
            }
        }
        return productBacklogItem
    }

    def deleteItem(def productBacklogItem){
        assert productBacklogItem
        def currentMaxSize = ProductBacklogItem.countByProduct(productBacklogItem.product)
        if (productBacklogItem.priorityIndex < currentMaxSize){
            moveFromTo(productBacklogItem.priorityIndex,currentMaxSize,productBacklogItem.product)
        }
        // todo: delete any sprint backlog references
        productBacklogItem.delete()
        productBacklogItem.backlogItem.delete()
        return true  // todo: make a more meaningful return status
    }
    
    def moveFromTo(int from, int to, def product) {
        assert product
        def maxSize = ProductBacklogItem.countByProduct(product)
        if (from <= 0) from = 1
        if (from > maxSize) from = maxSize
        if (to <= 0) to = 1
        if (to > maxSize) to = maxSize
        def target = ProductBacklogItem.findByPriorityIndexAndProduct(from, product)
        if (target) {
            if (from < to){
                def prodBacklogList = ProductBacklogItem.findAll("from scrumtime.backlog.ProductBacklogItem as pbi where pbi.priorityIndex > :from and pbi.priorityIndex <= :to and pbi.product = :product", [from: from, to: to, product: product])
                prodBacklogList.each {productBacklogItem ->
                    productBacklogItem.priorityIndex--;
                    productBacklogItem.save()
                }
            } else if (from > to){
                def prodBacklogList = ProductBacklogItem.findAll("from scrumtime.backlog.ProductBacklogItem as pbi where pbi.priorityIndex < :from and pbi.priorityIndex >= :to and pbi.product = :product", [from: from, to: to, product: product])
                prodBacklogList.each {productBacklogItem ->
                    productBacklogItem.priorityIndex++;
                    productBacklogItem.save()
                }
            }
            target.priorityIndex = to
            target = target.save()
        }
        return target
    }

}
