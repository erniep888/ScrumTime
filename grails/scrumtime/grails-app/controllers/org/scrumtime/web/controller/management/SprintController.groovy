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

import org.scrumtime.domain.sprint.Sprint

class SprintController {
    def beforeInterceptor = {
        if (!session.userIdentity){
            redirect(controller: "home", action: "index")
        }
    }
    
    def afterInterceptor = {model ->
        //model.breadCrumbTrail = 'Management > Find > Sprint'
    }

    def index = {
        render(view: '/org/scrumtime/web/views/management/sprint/find',
               model:[breadCrumbTrail:'Management > Find > Sprint'])
    }

    def find = {
        def sprints = findSprints(params)
        render(view: '/org/scrumtime/web/views/management/sprint/find',
               model:[breadCrumbTrail:'Management > Find > Sprint',
                       sprints: sprints])
    }

    def findAll = {
        def sprints = findSprints(null)
        render(view: '/org/scrumtime/web/views/management/sprint/find',
               model:[breadCrumbTrail:'Management > Find > Sprint',
                       sprints: sprints])
    }

    def view = {
        Sprint selectedSprint = Sprint.get(params.id)
        render(view: '/org/scrumtime/web/views/management/sprint/view',
               model:[breadCrumbTrail:'Management > Find > Sprint > View',
                       selectedSprint: selectedSprint])
    }

    private def findSprints(def params) {
        def criteria = Sprint.createCriteria()
        def results = criteria.list {
            if (params){
                if (params.nameSearchField)
                    ilike("name", "%" + params.nameSearchField + "%")
            }
            if (session?.userSettings?.currentRelease){
                eq ("release", session?.userSettings?.currentRelease )
            }
            order('name', 'asc')
        }
        return results
    }

}
