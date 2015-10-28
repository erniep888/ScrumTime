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
**/
package org.scrumtime.web.controller.management

import org.scrumtime.domain.product.Product

class ProductController {
    def beforeInterceptor = {
        if (!session.userIdentity){
            redirect(controller: "home", action: "index")
        }
    }
    def afterInterceptor = {model ->
        //model.breadCrumbTrail = 'Management > Find > Organization'
    }

    def index = {
        render(view: '/org/scrumtime/web/views/management/product/find',
               model:[breadCrumbTrail:'Management > Find > Product'])
    }

    def find = {
        def products = findProducts(params)
        render(view: '/org/scrumtime/web/views/management/product/find',
               model:[breadCrumbTrail:'Management > Find > Product',
                       products: products])
    }

    def findAll = {
        def products = findProducts(null)
        render(view: '/org/scrumtime/web/views/management/product/find',
               model:[breadCrumbTrail:'Management > Find > Product',
                       products: products])
    }

    def view = {
        Product selectedProduct = Product.get(params.id)
        render(view: '/org/scrumtime/web/views/management/product/view',
               model:[breadCrumbTrail:'Management > Find > Product > View',
                       selectedProduct:selectedProduct])
    }

    private def findProducts(def params) {
        def criteria = Product.createCriteria()
        def results = criteria.list {
            if (params){
                if (params.nameSearchField)
                    ilike("name", "%" + params.nameSearchField + "%")
            }
            order('name', 'asc')
        }
        return results
    }

}
