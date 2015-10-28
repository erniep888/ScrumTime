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

import org.scrumtime.domain.organization.Organization

class OrganizationController {
    def beforeInterceptor = {
        if (!session.userIdentity){
            redirect(controller: "home", action: "index")
        }
    }
    
    def afterInterceptor = {model ->
        //model.breadCrumbTrail = 'Management > Find > Organization'
    }


    def index = {
        render(view: '/org/scrumtime/web/views/management/organization/find',
               model:[breadCrumbTrail:'Management > Find > Organization'])
    }

    def find = {
        def organizations = findOrganizations(params)
        render(view: '/org/scrumtime/web/views/management/organization/find',
               model:[breadCrumbTrail:'Management > Find > Organization',
                       organizations:organizations])
    }

    def findAll = {
        def organizations = findOrganizations(null)
        render(view: '/org/scrumtime/web/views/management/organization/find',
               model:[breadCrumbTrail:'Management > Find > Organization',
                       organizations:organizations])
    }

    def view = {
        Organization selectedOrganization = Organization.get(params.id)
        render(view: '/org/scrumtime/web/views/management/organization/view',
               model:[breadCrumbTrail:'Management > Find > Organization > View',
                       selectedOrganization:selectedOrganization])
    }

    private def findOrganizations(def params) {
        def criteria = Organization.createCriteria()
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
