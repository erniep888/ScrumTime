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
package scrumtime.backlog

import scrumtime.user.SystemUser
import scrumtime.product.Product

class BacklogController {

    def backlogService

    def beforeInterceptor = {
        if (!session.authenticationToken) {
            redirect(controller: "userAuthentication", action: "index")
        }
    }

    def afterInterceptor = {model ->
        model.currentProduct = session.currentProduct
        def products = Product.findAll()  // Todo: limit this list of products to ones user is a member of 
        model.products = products
    }
    
    def index = {
        def productBacklogItems
        def users = SystemUser.findAll()
        if (session.currentProduct){
            productBacklogItems = ProductBacklogItem.findAllByProduct(session.currentProduct, [sort:"priorityIndex",order: "asc"])
        }
        render(view: '/backlog/index',
            model: [mainMenuSelection: 'backlog',productBacklogItems:productBacklogItems,
                users:users])
    }

    def addItem = {
        def productBacklogItem
        def users = SystemUser.findAll()
        // todo: force user to select a product if one is not already selected
        if (params.savePressed) {
            productBacklogItem = backlogService.createProductBacklogItem(session.currentProduct, params.title, params.description,
                                 params.workEstimate, params.estimatedBy)
        }
        if (productBacklogItem && !productBacklogItem?.hasErrors() && !productBacklogItem?.backlogItem?.hasErrors()) {
            redirect(action: 'index')
        } else {
            render(view: '/backlog/addItem',
                model: [productBacklogMenuSelection: 'addItem',productBacklogItem:productBacklogItem,
                        users:users])
        }
    }

    def edit = {
        def users = SystemUser.findAll()
        def selectedBacklogItem = BacklogItem.get(params.id)
        def saved = params.savePressed
        if (params.savePressed && selectedBacklogItem) {
            selectedBacklogItem.title = params.title
            selectedBacklogItem.description = params.description
            selectedBacklogItem.workEstimate = params.workEstimate ? Integer.parseInt(params.workEstimate):null
            selectedBacklogItem.estimatedBy = params.estimatedBy&&params.estimatedBy == '-1' ? null:params.estimatedBy
            selectedBacklogItem.save(flush: true)
        }
        if (params.savePressed && !selectedBacklogItem?.hasErrors()) {
            redirect(action: 'index')
        } else {
            render(view: '/backlog/editItem',
                model: [users: users, backlogItem: selectedBacklogItem])
        }
    }

    def delete = {
        def selectedProductBacklogItem = ProductBacklogItem.get(params.id)
        if (params.deletePressed && selectedProductBacklogItem) {
            backlogService.deleteItem(selectedProductBacklogItem)
            redirect(action: 'index')
        } else {
            // todo: handle scenario in which another user removed this backlog item already
            render(view: '/backlog/deleteItem',
                model: [productBacklogItem: selectedProductBacklogItem])
        }
    }
    
    def setCurrentProduct = {
        def productId = params.id
        if (productId && session.authenticationToken.systemUser != productId &&
            session.authenticationToken.systemUser){
            def product = Product.get(productId)
            // Todo: secure the list of products by verifying user is within memberlist
            if (product)
                session.currentProduct = product
        }
        redirect(action: "index")
    }

    def move = {
        def from = params.from
        def to = params.to
        to = (to)?Integer.valueOf(to):0
        from = (from)?Integer.valueOf(from):0
        if (to != from && session.currentProduct){
            backlogService.moveFromTo(from, to, session.currentProduct)
        }
        redirect(action: "index")
    }
}
