/**
 *  Copyright 2008   scrumtime.org owners
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
package org.scrumtime.web.controller.management

import org.scrumtime.domain.product.Product
import org.scrumtime.domain.user.UserSettings
import org.scrumtime.web.domain.management.ProductViewSettings

class ProductController {
    def productService

    def beforeInterceptor = {
        if (!session.userIdentity) {
            redirect(controller: "home", action: "index")
        }
    }
    def afterInterceptor = {model ->
        
    }

    def index = {
        chain(action: 'view', params: params)
    }

    def view = {
        def productViewSettings = session.productViewSettings
        if (!productViewSettings)
            productViewSettings = new ProductViewSettings(filterOrganizationId:
                    session.userSettings.currentOrganization.id)
        if (params.filterSubmit) {
            productViewSettings.filterName = params?.filterName
            productViewSettings.filterOrganizationId = Integer.parseInt(params?.filterOrganizationId)
        }
        session.productViewSettings = productViewSettings

        def products = findProducts(productViewSettings)
        render(view: '/org/scrumtime/web/views/management/product/view',
                model: [breadCrumbTrail: 'Management > Find > Product',
                        products: products,
                        productViewSettings:productViewSettings])
    }

    def edit = {
        Product selectedProduct
        if (params.id) {  // this is an edit condition
            // TODO: Handle product not found and no id sent
            selectedProduct = Product.get(params.id)
        }
        else {
            selectedProduct = new Product(organization:session.userSettings.currentOrganization,
                    createdBy:session.userSettings.systemUser.username)
        }

        if (params.submitted) {
            selectedProduct.properties = params
            selectedProduct.save(flush: true)
            if (!selectedProduct.hasErrors()) {
                session.userSettings = UserSettings.findBySystemUser(session.userIdentity.authenticationToken.systemUser)
                redirect(action: 'view', params: [id: selectedProduct.id])
            }
        }
        render(view: '/org/scrumtime/web/views/management/product/edit',
                model: [breadCrumbTrail: 'Management > Find > Product > Edit',
                        selectedProduct: selectedProduct])

    }

    def delete = {
        if (params.id) {  // this is an edit condition
            // TODO: Handle product not found and no id sent
            def selectedProduct = Product.get(params.id)
            productService.deleteAndCleanUserSettings(selectedProduct)
            session.userSettings = UserSettings.findBySystemUser(session.userIdentity.authenticationToken.systemUser)
        }
        redirect(action:'view')
    }

    private def findProducts(def productViewSettings) {
        def criteria = Product.createCriteria()
        def results = criteria.list {
            if (productViewSettings) {
                if (productViewSettings.filterName)
                    ilike("name", "%" + productViewSettings.filterName + "%")
            } else {
                ilike("name", "%%")
            }

            order('name', 'asc')
        }
        return results
    }

}
