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
package scrumtime.management

import scrumtime.release.Release
import scrumtime.product.Product
import scrumtime.user.UserSettings
import scrumtime.management.ReleaseViewSettings

class ReleaseController {
    def releaseService

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
        def releaseViewSettings = session.releaseViewSettings
        if (!releaseViewSettings)
            releaseViewSettings = new ReleaseViewSettings(filterProductId:
                    session.userSettings.currentProduct.id)
        if (params.filterSubmit) {
            releaseViewSettings.filterName = params?.filterName
            releaseViewSettings.filterProductId = Integer.parseInt(params?.filterProductId)
        }
        session.releaseViewSettings = releaseViewSettings

        def availableProducts = Product.findAllByOrganization(session.userSettings.currentOrganization)
        def releases = findReleases(releaseViewSettings)
        render(view: '/management/release/view',
                model: [breadCrumbTrail: 'Management > Find > Release',
                        releases: releases,
                        releaseViewSettings:releaseViewSettings,
                        availableProducts:availableProducts])
    }

    def edit = {
        Release selectedRelease
        if (params.id) {  // this is an edit condition
            // TODO: Handle release not found and no id sent
            selectedRelease = Release.get(params.id)
        }
        else {
            selectedRelease = new Release(product:session.userSettings.currentProduct,
                    createdBy:session.userSettings.systemUser.username)
        }

        if (params.submitted) {
            selectedRelease.properties = params
            selectedRelease.save(flush: true)
            if (!selectedRelease.hasErrors()) {
                session.userSettings = UserSettings.findBySystemUser(session.userIdentity.authenticationToken.systemUser)
                redirect(action: 'view', params: [id: selectedRelease.id])
            }
        }
        render(view: '/management/release/edit',
                model: [breadCrumbTrail: 'Management > Find > Release > Edit',
                        selectedRelease: selectedRelease])

    }

    def delete = {
        if (params.id) {  // this is an edit condition
            // TODO: Handle product not found and no id sent
            def selectedRelease = Release.get(params.id)
            releaseService.deleteAndCleanUserSettings(selectedRelease)
            session.userSettings = UserSettings.findBySystemUser(session.userIdentity.authenticationToken.systemUser)
        }
        redirect(action:'view')
    }

    private def findReleases(def releaseViewSettings) {
        def criteria = Release.createCriteria()
        def results = criteria.list {
            if (releaseViewSettings) {
                if (releaseViewSettings.filterName)
                    ilike("name", "%" + releaseViewSettings.filterName + "%")
                if (releaseViewSettings.filterProductId) {
                    def product = Product.get(releaseViewSettings.filterProductId)
                    if (product)
                        eq("product", product)
                }
            } else {
                ilike("name", "%%")
            }
            order('name', 'asc')
        }
        return results
    }

}
