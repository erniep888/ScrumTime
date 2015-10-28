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
import org.scrumtime.domain.organization.Organization
import org.scrumtime.domain.backlog.BacklogPriority
import org.scrumtime.domain.product.Product
import org.scrumtime.domain.sprint.Sprint
import org.scrumtime.domain.common.PrioritizedTimeZone
import org.scrumtime.domain.common.PrioritizedLanguage
import org.scrumtime.domain.common.VisibilityType
import org.scrumtime.domain.user.SystemRole
import org.scrumtime.domain.user.Permission
import org.scrumtime.domain.scrum.ScrumRole


class BootStrap {

    def init = {servletContext ->
//         def organization = createOrganization("Scrum Time.org")
//         def scramble = createProduct(organization, "Scramble")
//         for (int x = 1; x <= 2; x++){
//            def sprint = createSprint(scramble, "Sprint " + x, x)
//            scramble.addToSprints(sprint)
//         }
//         organization.addToProducts(scramble)
//         def scrumtime = createProduct(organization, "Scrum Time")
//         for (int x = 1; x <= 27; x++){
//            def sprint = createSprint(scrumtime, "Sprint " + x, x)
//            scrumtime.addToSprints(sprint)
//         }
//         organization.addToProducts(scrumtime)
//         organization.save(flush:true)

        createVisibilityTypes()
        createTimeZones()
        createLanguages()
        createPermissions()
        createRoles()
        createScrumRoles()
        createScrumtimeOrg()
        createBacklogPriorities()
        
    }
    def destroy = {
    }

    private Organization createOrganization(String name) {
        def organization = new Organization(name: name, description: 'Testing purposes');
        organization.save(flush: true);
        return organization;
    }

    private Product createProduct(Organization organization, String name) {
        def product = new Product(organization: organization,
                name: name, description: 'Testing purposes')
        product.save(flush: true)
        return product
    }

    private Sprint createSprint(Product product, String name, int completionOrder) {
        def sprint = new Sprint(product: product, name: name,
                completionOrder: completionOrder)
        sprint.save(flush: true)
        return sprint
    }

    private void createVisibilityTypes() {
        def publicType = new VisibilityType(
                name: 'Listed in Scrum Time directory');
        publicType.save();
        def notListedType = new VisibilityType(
                name: 'Not listed');
        notListedType.save();

    }

    private void createTimeZones() {
        def priorizedTimeZone = new PrioritizedTimeZone(
                shortForm: "EST",
                longForm: "Eastern Standard Time",
                timeZoneId: "est",
                displayOrder: 1000
        )
        priorizedTimeZone.save()
    }

    private void createLanguages() {
        def prioritizedLanguage = new PrioritizedLanguage(
                threeLetterCountrySymbol: "USA",
                threeLetterLanguageSymbol: "ENG",
                displayName: "United States",
                displayLanguage: "English",
                displayOrder: 1000
        )
        prioritizedLanguage.save()
    }

    private void createRoles(){
        def organizationPermission = Permission.findByName('organization_rw')
        def generalUserRole = new SystemRole(name:'GENERAL USER',
                permissions:[organizationPermission])
        generalUserRole.save()
        def sitePermission = Permission.findByName('site_rw')
        def siteOwnerRole = new SystemRole(name:'SITE OWNER',
                permissions:[organizationPermission,sitePermission])
        siteOwnerRole.save()


    }

    private void createPermissions(){
        def site = new Permission(name:'site_rw')
        def organization = new Permission(name:'organization_rw')
        def organization_r = new Permission(name:'organization_r')
        def sprint = new Permission(name:'sprint_rw')
        def sprint_r = new Permission(name:'sprint_r')
        site.save()
        organization.save()
        organization_r.save()
        sprint.save()
        sprint_r.save()
    }

    private void createScrumRoles(){
        def sprintRWPermission = Permission.findByName('sprint_rw')
        def sprintRPermission = Permission.findByName('sprint_r')

        def scrumMaster = new ScrumRole(name:'Scrum Master',
                    permissions:[sprintRWPermission])
        scrumMaster.save()
        def scribe = new ScrumRole(name:'Scribe',
                    permissions:[sprintRWPermission])
        scribe.save()
        def pig = new ScrumRole(name:'Pig',
                    permissions:[sprintRWPermission])
        pig.save()
        def chicken = new ScrumRole(name:'Chicken',
                    permissions:[sprintRPermission])
        chicken.save()
    }

    private Organization createScrumtimeOrg(){
        def organization = new Organization(name: 'scrumtime.org',
                description: 'An open source community that is responsible for creating ' +
                              'and maintaining the Scrum Time web application.',
                createdBy: 'erniep')
        organization.save(flush: true)
        return organization
    }

    private void createBacklogPriorities(){
        for (int i=1; i <= 10; i++ ){
            def priority = new BacklogPriority(name: i, value:i)
            priority.save()
        }
    }
} 