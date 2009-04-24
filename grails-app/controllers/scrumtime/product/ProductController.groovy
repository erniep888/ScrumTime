/**
 *  Copyright 2009   scrumtime.org
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 * */
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
