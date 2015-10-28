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

import org.scrumtime.domain.scrum.ScrumTeam

class ScrumTeamController {
    def beforeInterceptor = {
        if (!session.userIdentity){
            redirect(controller: "home", action: "index")
        }
    }
    
    def afterInterceptor = {model ->
        //model.breadCrumbTrail = 'Management > Find > Scrum Team'
    }

    def index = {
        render(view: '/org/scrumtime/web/views/management/scrumteam/find',
               model:[breadCrumbTrail:'Management > Find > Scrum Team'])
    }

    def find = {
        def scrumTeams = findScrumTeams(params)
        render(view: '/org/scrumtime/web/views/management/scrumteam/find',
               model:[breadCrumbTrail:'Management > Find > Scrum Team',
                       scrumTeams: scrumTeams])
    }

    def findAll = {
        def scrumTeams = findScrumTeams(null)
        render(view: '/org/scrumtime/web/views/management/scrumteam/find',
               model:[breadCrumbTrail:'Management > Find > Scrum Team',
                       scrumTeams: scrumTeams])
    }

    def view = {
        ScrumTeam selectedScrumTeam = ScrumTeam.get(params.id)
        render(view: '/org/scrumtime/web/views/management/scrumteam/view',
               model:[breadCrumbTrail:'Management > Find > Scrum Team > View',
                       selectedScrumTeam:selectedScrumTeam])
    }

    private def findScrumTeams(def params) {
        def criteria = ScrumTeam.createCriteria()
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
