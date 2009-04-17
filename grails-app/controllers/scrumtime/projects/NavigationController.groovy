package scrumtime.projects

import scrumtime.product.Product
import scrumtime.backlog.BacklogItem
import scrumtime.backlog.ProductBacklogItem
import scrumtime.user.SystemUser
import scrumtime.backlog.ProductBacklogItem

class NavigationController {

    def index = {
        render(view: '/projects/navigation/index',
            model: [menuSelection: 'projects'])
    }

    def fill = {
        SystemUser su = new SystemUser(username: 'erniep888@acme.org',
            retypedUsername: 'erniep888@acme.org')
        su = su.save(flush: true)
        Product p = new Product(name: 'test', description: "Blah, Blah",
            creator: su)
        p.save(flush: true)
        for (int i = 1; i < 1001; i++) {
            addAsProductBacklogItem(p, "Test " + i)
        }
        render "done"
    }

    def move = {
        def from = params.from
        def to = params.to
        to = (to)?Integer.valueOf(to):2
        from = (from)?Integer.valueOf(from):1
        Product p = Product.get(1)
        def productBacklogItem = moveFromTo(from, to, p)
        render "done"
    }

    private def addAsProductBacklogItem(Product product, String title) {
        BacklogItem item = new BacklogItem(title: title)
        item = item.save(flush: true)
        def largestIndex = ProductBacklogItem.countByProduct(product)
        ProductBacklogItem productBacklogItem = new ProductBacklogItem(product: product,
            priorityIndex: largestIndex + 1, backlogItem: item)
        productBacklogItem = productBacklogItem.save(flush: true)
        return productBacklogItem
    }

    private def moveFromTo(def from, def to, def product) {
        def target = ProductBacklogItem.findByPriorityIndex(from)
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
            target = target.save(flush: true)
        }


        return target
    }
}
