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

import org.scrumtime.domain.user.UserInformation
import org.scrumtime.domain.user.AuthorizationDefinition
import org.scrumtime.domain.organization.Organization
import org.scrumtime.web.domain.management.SiteMemberSummary

class SiteMemberController {
    def beforeInterceptor = {
        if (!session.userIdentity){
            redirect(controller: "home", action: "index")
        }
    }
    
    def afterInterceptor = {model ->
        //model.breadCrumbTrail = 'Management > Find > Site Member'
    }
    
    def index = {
        render(view: '/org/scrumtime/web/views/management/sitemember/find',
               model:[breadCrumbTrail:'Management > Find > Site Member'])
    }
    
    def find = {
        def siteMemberSummaries = new Vector()
        def results = findUserInformationSiteMembers(params)
        results.each(){ userInformation ->
          def currentRoles = ''
          def authorizationDefs = AuthorizationDefinition.findBySystemUser(userInformation.systemUser)          
          if (authorizationDefs){
              authorizationDefs.assignedRoles.each(){ assignedRole ->
                if (currentRoles.length() > 0)
                  currentRoles += ', '
                currentRoles += assignedRole.toString()                   
              }
          }          
          if (currentRoles.length() > 20)
              currentRoles = currentRoles.substring(0,17) + '...'
//          def organizationCount = Organization.countByMembers(userInformation.systemUser)
          def organizationCount = countOrganizationsForSystemUser(userInformation.systemUser)
          def siteMemberSummary = new SiteMemberSummary(userInformation:userInformation,
              organizationCount:countOrganizationsForSystemUser(userInformation.systemUser),
                  currentRoles:currentRoles)
          siteMemberSummaries.add(siteMemberSummary)
        }
        render(view: '/org/scrumtime/web/views/management/sitemember/find',
               model:[breadCrumbTrail:'Management > Find > Site Member',
                       siteMemberSummaries:siteMemberSummaries])
    }
    
    def findAll = {
        def siteMemberSummaries = new Vector()
        def results = findUserInformationSiteMembers(null)
        results.each(){ userInformation ->
          def currentRoles = ''
          def authorizationDefs = AuthorizationDefinition.findBySystemUser(userInformation.systemUser)
          if (authorizationDefs){
              authorizationDefs.assignedRoles.each(){ assignedRole ->
                if (currentRoles.length() > 0)
                  currentRoles += ', '
                currentRoles += assignedRole.toString()
              }
          }
          if (currentRoles.length() > 20)
              currentRoles = currentRoles.substring(0,17) + '...'
//          def organizationCount = Organization.countByMembers(userInformation.systemUser)
          def organizationCount = countOrganizationsForSystemUser(userInformation.systemUser)
          def siteMemberSummary = new SiteMemberSummary(userInformation:userInformation,
              organizationCount: countOrganizationsForSystemUser(userInformation.systemUser),
                  currentRoles:currentRoles)
          siteMemberSummaries.add(siteMemberSummary)
        }
        render(view: '/org/scrumtime/web/views/management/sitemember/find',
               model:[breadCrumbTrail:'Management > Find > Site Member',
                       siteMemberSummaries:siteMemberSummaries])
    }

    def view = {
        UserInformation selectedUserInformation = UserInformation.get(params.id)
        render(view: '/org/scrumtime/web/views/management/sitemember/view',
               model:[breadCrumbTrail:'Management > Find > Site Member > View',
                       selectedUserInformation:selectedUserInformation])
    }

    private def findUserInformationSiteMembers(def params) {
        def criteria = UserInformation.createCriteria()
        def results = criteria.list {
            if (params){
                if (params.nickNameSearchField)
                    ilike("nickName", "%" + params.nickNameSearchField + "%")
                if (params.firstNameSearchField)
                    ilike("firstName", "%" + params.firstNameSearchField + "%")
                if (params.lastNameSearchField)
                    ilike("lastName", "%" + params.lastNameSearchField + "%")
            }
            order('nickName', 'asc')
        }
        return results
    }
    
    private def countOrganizationsForSystemUser(def systemUser){
        def size = 0
        def results = Organization.findAll()
        results.each { organization ->
            if (organization.members.contains(systemUser))
                size++
        }
        return size
    }
}
