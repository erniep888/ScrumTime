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
package scrumtime.backlog

import scrumtime.backlog.BacklogItem
import scrumtime.backlog.BacklogPriority
import scrumtime.user.UserInformation
import scrumtime.user.SystemUser
import scrumtime.backlog.BacklogInformation
import scrumtime.backlog.BacklogViewSettings
import scrumtime.product.Product
import scrumtime.release.Release
import scrumtime.sprint.Sprint

class BacklogController {
    def backlogService
    def userSessionService

    def beforeInterceptor = {
        if (!session.userIdentity) {
            redirect(controller: "home", action: "index")
        }

        if (session.userSettings == null ||
            session.userSettings.currentProduct == null ||
            session.userSettings.currentRelease == null ||
            session.userSettings.currentSprint == null){
            redirect(controller:"settings", action:"requiresSettings")
        }
    }
    def afterInterceptor = {model ->
        model.products = Product.findAll()
        model.releases = Release.findAll()
        model.sprints = Sprint.findAllByRelease(Release.get(1))
    }

    def index = {
        //        render(view: '/backlog/testDraggable')
        render "${backlogService.findProductBacklogInformation().workRemaining}"
    }

    def saveToProduct = {
        params.target = 'product'
        chain(action: 'viewBacklogItem', params: params)
    }
    def saveToRelease = {
        params.target = 'release'
        chain(action: 'viewBacklogItem', params: params)
    }
    def saveToSprint = {
        params.target = 'sprint'
        chain(action: 'viewBacklogItem', params: params)
    }

    def viewBacklogItem = {
        BacklogItem backlogItem
        def viewMode = params.viewMode
        def backlogType = params.backlogType

        if (params.id) {  // this is an edit condition
            // TODO: Handle backlog item not found and no id sent
            backlogItem = BacklogItem.get(params.id)
        }
        else {
            backlogItem = new BacklogItem(workRemaining: 0, workCompleted: 0)
        }
        backlogItem.properties = params
        if (params.submitted) {
            if (params.target == 'release') {
                backlogItem.assignedProduct = session?.userSettings?.currentProduct
                backlogItem.assignedRelease = session?.userSettings?.currentRelease
                backlogItem.assignedSprint = null
            } else if (params.target == 'sprint') {
                backlogItem.assignedProduct = session?.userSettings?.currentProduct
                backlogItem.assignedRelease = session?.userSettings?.currentRelease
                backlogItem.assignedSprint = session?.userSettings?.currentSprint
            }
            else {
                backlogItem.assignedProduct = session?.userSettings?.currentProduct
                backlogItem.assignedRelease = null
                backlogItem.assignedSprint = null
            }

            if (params.selectedAssignedTo)
                backlogItem.assignedTo = UserInformation.get(params.selectedAssignedTo)

            if (params.selectedEstimatedBy) {
                backlogItem.estimatedBy = UserInformation.get(params.selectedEstimatedBy)
            }
            if (params.selectedPriority) {
                backlogItem.productPriority = BacklogPriority.get(params.selectedPriority)
            }
            backlogItem.save(flush: true)
            if (!backlogItem.hasErrors())
                redirect(action: 'viewBacklog', params: [backlogType: params.target])
        }

        def availableUsers = findAvailableUsers()
        def priorities = BacklogPriority.findAll()

        render(view: '/backlog/addToBacklog',
                model: [breadCrumbTrail: 'Backlog > Add To Backlog',
                        priorities: priorities, backlogItem: backlogItem,
                        availableUsers: availableUsers,
                        viewMode: viewMode,
                        backlogType: backlogType])
    }

    def viewBacklog = {
        def backlogViewSettings = session.backlogViewSettings
        if (!backlogViewSettings)
            backlogViewSettings = new BacklogViewSettings()
        
        if (params.filterSubmit) {
            backlogViewSettings.filterName = params?.filterName
            backlogViewSettings.filterUserId = Integer.parseInt(params?.filterUserId)
        }
        if (params.backlogType)
            backlogViewSettings.backlogType = params.backlogType          

        def backlog
        if (backlogViewSettings.backlogType && backlogViewSettings.backlogType == 'release') {
            backlog = backlogService.findReleaseBacklog(
                    session?.userSettings?.currentRelease, backlogViewSettings)
            backlogViewSettings.backlogType = 'release'
        } else if (backlogViewSettings.backlogType && backlogViewSettings.backlogType == 'sprint') {
            backlog = backlogService.findSprintBacklog(
                    session?.userSettings?.currentSprint, backlogViewSettings)
            backlogViewSettings.backlogType = 'sprint'
        } else {
            backlog = backlogService.findProductBacklog(
                    session?.userSettings?.currentProduct, backlogViewSettings)
            backlogViewSettings.backlogType = 'product'
        }
        session.backlogViewSettings = backlogViewSettings

        def productBacklogInformation = backlogService.findProductBacklogInformation(session?.userSettings?.currentProduct)
        def releaseBacklogInformation = backlogService.findReleaseBacklogInformation(session?.userSettings?.currentRelease)
        def sprintBacklogInformation = backlogService.findSprintBacklogInformation(session?.userSettings?.currentSprint)
        def availableUsers = findAvailableUsers()
        render(view: '/backlog/viewBacklog',
                model: [breadCrumbTrail: 'Backlog > Product Backlog',
                        backlog: backlog,
                        availableUsers: availableUsers,
                        backlogViewSettings: backlogViewSettings,
                        productBacklogInformation: productBacklogInformation,
                        releaseBacklogInformation: releaseBacklogInformation,
                        sprintBacklogInformation: sprintBacklogInformation])
    }

    def deleteFromBacklog = {
        backlogService.deleteFromBacklog(params.id)
        redirect(action: 'viewBacklog')
    }


    def dragToProductBacklog = {
        backlogService.addToProductBacklog(params['id'],
                session?.userSettings?.currentProduct)
        redirect(action: 'viewBacklog')
    }

    def dragToReleaseBacklog = {
        backlogService.addToReleaseBacklog(params['id'],
                session?.userSettings?.currentRelease)
        redirect(action: 'viewBacklog')
    }

    def dragToSprintBacklog = {
        backlogService.addToSprintBacklog(params['id'],
                session?.userSettings?.currentSprint)
        redirect(action: 'viewBacklog')
    }

    private def findAvailableUsers() {
        // TODO: Replace findAll with an organization limited search (members only)
        def availableUserInformations = UserInformation.findAll()
//        def availableSessionUserInformations = userSessionService.
//                convertUserListToSessionUserList(availableUserInformations)
        return availableUserInformations
    }

}
