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
package org.scrumtime.web.controller.backlog

import org.scrumtime.domain.backlog.BacklogItem
import org.scrumtime.domain.backlog.BacklogPriority
import org.scrumtime.domain.user.UserInformation
import org.scrumtime.service.user.SessionUserInformation

class BacklogController {
    def beforeInterceptor = {
        if (!session.userIdentity){
            redirect(controller: "home", action: "index")
        }
    }

    def addToBacklog = {
        BacklogItem backlogItem = new BacklogItem(workRemaining: 0, workCompleted: 0)
        backlogItem.properties = params
        if (params.selectedPriority) {
            backlogItem.productPriority = BacklogPriority.get(params.selectedPriority)
        }
        def priorities = BacklogPriority.findAll()
        if (params.submitted){
            backlogItem.assignedProduct = session?.userSettings?.currentProduct
            if (params.selectedAssignedTo) {
                def assignedTo = UserInformation.get(params.selectedAssignedTo)
                backlogItem.assignedTo = assignedTo?.nickName
            }
            if (params.selectedEstimatedBy) {
                def estimatedBy = UserInformation.get(params.selectedEstimatedBy)
                backlogItem.estimatedBy = estimatedBy?.nickName
            }
            backlogItem.save()
            if (!backlogItem.hasErrors())
                redirect(action: 'viewProductBacklog')
        }
        // TODO: Replace findAll with an organization limited search (members only)
        def availableUserInformation = UserInformation.findAll()
        def availableUsers = convertUserInformationToSessionUserInformation(availableUserInformation)

        render(view: '/org/scrumtime/web/views/backlog/addToBacklog',
                model: [breadCrumbTrail: 'Backlog > Add To Backlog',
                        priorities: priorities, backlogItem: backlogItem,
                        availableUsers: availableUsers])
    }

    private List convertUserInformationToSessionUserInformation(def availableUserInformation) {
        def availableUsers = new Vector<SessionUserInformation>()
        def sessionUserInformation = new SessionUserInformation(id:-1,
                    displayName:"-----------")
        availableUsers.add(sessionUserInformation)
        availableUserInformation.each {userInformation ->
            sessionUserInformation = new SessionUserInformation(id:userInformation.id,
                    displayName:userInformation.nickName)
            availableUsers.add(sessionUserInformation)
        }
        return availableUsers
    }

    def addToProductBacklog = {
        redirect(action: 'addToBacklog')
    }

    def viewProductBacklog = {
        def productBacklog = findProductBacklog()
        render(view: '/org/scrumtime/web/views/backlog/viewProductBacklog',
                model: [breadCrumbTrail: 'Backlog > Product Backlog',
                        productBacklog: productBacklog])
    }

    def deleteFromBacklog = {
        if (params.id) {
            def backlogItem = BacklogItem.get(params.id)
            backlogItem.delete()
        }
        redirect(action: 'viewProductBacklog')
    }

    private def findProductBacklog() {
        def criteria = BacklogItem.createCriteria()
        def results = criteria.list {
            if (session?.userSettings?.currentProduct)
                eq("assignedProduct", session?.userSettings?.currentProduct)
        }
        return results
    }
}
