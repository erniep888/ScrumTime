package scrumtime.product

class ProductService {

    boolean transactional = true

    def create(def name, def description, def authenticationToken) {
        Product product = new Product(name:name,description:description,creator:authenticationToken.systemUser)
        if (product.validate())
            product.save(flush:true)
        return product
    }
}
