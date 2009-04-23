package scrumtime.product

import scrumtime.user.SystemUser

class ProductController {
    def productService

    def beforeInterceptor = {
        if (!session.authenticationToken) {
            redirect(controller: "userAuthentication", action: "index")
        }
    }

    def index = {
        def products = Product.findAllByCreator(session.authenticationToken?.systemUser, [sort:"name",order: "asc"])
        render(view: '/product/index',
            model: [products: products])
    }

    def edit = {
        def products = Product.findAllByCreator(session.authenticationToken?.systemUser, [sort:"name",order: "asc"])
        def selectedProduct = Product.get(params.id)
        if (params.savePressed && selectedProduct) {
            selectedProduct.name = params.name
            selectedProduct.description = params.description
            selectedProduct.save(flush: true)
        }
        if (params.savePressed && !selectedProduct?.hasErrors()) {
            redirect(action: 'index')
        } else {
            render(view: '/product/edit',
                model: [products: products, selectedProduct: selectedProduct])
        }
    }

    def delete = {
        def selectedProduct = Product.get(params.id)
        if (params.deletePressed && selectedProduct) {
            selectedProduct.delete()
            redirect(action: 'index')
        } else {
            def products = Product.findAllByCreator(session.authenticationToken?.systemUser, [sort:"name",order: "asc"])
            render(view: '/product/delete',
                model: [products: products, selectedProduct: selectedProduct])
        }
    }

    def members = {
        def products = Product.findAllByCreator(session.authenticationToken?.systemUser, [sort:"name",order: "asc"])
        def selectedProduct = Product.get(params.id)
        render(view: '/product/members/index',
            model: [products: products, selectedProduct: selectedProduct])
    }


    def createNew = {
        def product
        if (params.savePressed) {
            product = productService.create(params.name, params.description, session.authenticationToken)
        }
        if (product && !product.hasErrors()) {
            redirect(action: 'index')
        } else {
            render(view: '/product/new',
                model: [managementProductMenuSelection: 'new', product: product])
        }
    }
    

}
