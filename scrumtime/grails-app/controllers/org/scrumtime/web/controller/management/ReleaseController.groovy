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

import org.scrumtime.domain.release.Release

class ReleaseController {
    def beforeInterceptor = {
        if (!session.userIdentity){
            redirect(controller: "home", action: "index")
        }
    }
    
    def afterInterceptor = {model ->
        //model.breadCrumbTrail = 'Management > Find > Release'
    }

    def index = {
        render(view: '/org/scrumtime/web/views/management/release/find',
               model:[breadCrumbTrail:'Management > Find > Release'])
    }

    def find = {
        def releases = findReleases(params)
        render(view: '/org/scrumtime/web/views/management/release/find',
               model:[breadCrumbTrail:'Management > Find > Release',
                       releases: releases])
    }

    def findAll = {
        def releases = findReleases(null)
        render(view: '/org/scrumtime/web/views/management/release/find',
               model:[breadCrumbTrail:'Management > Find > Release',
                       releases: releases])
    }

    def view = {
        Release selectedRelease = Release.get(params.id)
        render(view: '/org/scrumtime/web/views/management/release/view',
               model:[breadCrumbTrail:'Management > Find > Release > View',
                       selectedRelease:selectedRelease])
    }

    private def findReleases(def params) {
        def criteria = Release.createCriteria()
        def results = criteria.list {
            if (params){
                if (params.nameSearchField)
                    ilike("name", "%" + params.nameSearchField + "%")
            }
            if (session?.userSettings?.currentProduct){
                eq ("product", session?.userSettings?.currentProduct )
            }
            order('name', 'asc')
        }
        return results
    }

}
