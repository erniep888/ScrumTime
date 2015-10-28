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

import org.scrumtime.domain.backlog.BacklogPriority
import org.scrumtime.domain.common.PrioritizedTimeZone
import org.scrumtime.domain.common.PrioritizedLanguage
import org.scrumtime.domain.user.SystemUser
import org.scrumtime.domain.user.UserInformation
import org.scrumtime.domain.product.Product
import org.scrumtime.domain.release.Release
import org.scrumtime.domain.sprint.Sprint
import org.scrumtime.domain.user.SystemUserCredential
import org.scrumtime.domain.user.UserSettings


class BootStrap {
    def authenticationService

    def init = {servletContext ->
        createTimeZones()
        createLanguages()
        createBacklogPriorities()
        createUserX()
        createDemoProduct()
        createUserSettings()
    }
    def destroy = {
    }

    private void createTimeZones() {
        if (PrioritizedTimeZone.count() == 0) {
            def priorizedTimeZone = new PrioritizedTimeZone(
                    shortForm: "EST",
                    longForm: "Eastern Standard Time",
                    timeZoneId: "est",
                    displayOrder: 1000
            )
            priorizedTimeZone.save()
        }
    }

    private void createLanguages() {
        if (PrioritizedLanguage.count() == 0) {
            def prioritizedLanguage = new PrioritizedLanguage(
                    threeLetterCountrySymbol: "USA",
                    threeLetterLanguageSymbol: "ENG",
                    displayName: "United States",
                    displayLanguage: "English",
                    displayOrder: 1000
            )
            prioritizedLanguage.save()
        }
    }

    private void createBacklogPriorities() {
        if (BacklogPriority.count() == 0) {
            for (int i = 1; i <= 10; i++) {
                def priority = new BacklogPriority(name: i, value: i)
                priority.save()
            }
        }
    }

    private void createUserX() {
        def userx = SystemUser.findByUsername("userx@demo.com")
        if (!userx) {
            userx = new SystemUser(username: "userx@demo.com", enabled: true)
            userx.save(flush: true)
            def userxInfo = new UserInformation(systemUser: userx, firstName: "User",
                    lastName: "X", nickName: "userx", emailVerified: true)
            userxInfo.save(flush: true)
            userxInfo.errors.allErrors.each {
                println it
            }

            def userxCredential = new SystemUserCredential(systemUser: userx,
                    password: authenticationService.hashPassword("userx"))
            userxCredential.save(flush: true)
        }
    }

    private void createDemoProduct() {
        def product = Product.findByName("Demo Product")
        if (!product) {
            product = new Product(name: "Demo Product",
                    description: "A fictious product to be used as an example.",
                    visibility: "all")
            product.owners = new TreeSet()
            product.owners.add(SystemUser.findByUsername("userx@demo.com"))
            product.save(flush: true)
        }
        createDemoReleases(product)
    }

    private void createDemoReleases(def product) {
        def release05 = Release.findByNameAndProduct("0.5", product)
        if (!release05) {
            def expectedStartCal = new GregorianCalendar(2008, 10, 15, 8, 0)
            def expectedCompletionCal = new GregorianCalendar(2009, 1, 15, 8, 0)
            def actualStartCal = new GregorianCalendar(2008, 11, 3, 8, 0)
            release05 = new Release(name: "0.5", description: "The 0.5 release.",
                    expectedStartDate: expectedStartCal.getGregorianChange(),
                    expectedCompletionDate: expectedCompletionCal.getGregorianChange(),
                    actualStartDate: actualStartCal.getGregorianChange(),
                    product: product, visibility: "all")
            release05.save(flush: true)
            create05ReleaseDemoSprints(release05)
        }

        def release1 = Release.findByNameAndProduct("1.0", product)
        if (!release1) {
            def expectedStartCal = new GregorianCalendar(2009, 1, 20, 8, 0)
            def expectedCompletionCal = new GregorianCalendar(2009, 5, 15, 8, 0)
            release1 = new Release(name: "1.0", description: "The 1.0 release.",
                    expectedStartDate: expectedStartCal.getGregorianChange(),
                    expectedCompletionDate: expectedCompletionCal.getGregorianChange(),
                    product: product, visibility: "all")
            release1.save(flush: true)
            create1ReleaseDemoSprints(release1)
        }
    }

    private void create05ReleaseDemoSprints(def release) {
        def sprint1 = Sprint.findByNameAndRelease("1", release)
        if (!sprint1) {
            def expectedStartCal = new GregorianCalendar(2008, 10, 15, 8, 0)
            def expectedCompletionCal = new GregorianCalendar(2008, 11, 15, 8, 0)
            def actualStartCal = new GregorianCalendar(2008, 11, 3, 8, 0)
            def actualCompletionCal = new GregorianCalendar(2008, 12, 2, 8, 0)
            sprint1 = new Sprint(name: "1", description: "The 1st sprint.",
                    expectedStartDate: expectedStartCal.getGregorianChange(),
                    expectedCompletionDate: expectedCompletionCal.getGregorianChange(),
                    actualStartDate: actualStartCal.getGregorianChange(),
                    actualCompletionDate: actualCompletionCal.getGregorianChange(),
                    release: release, visibility: "all")
            sprint1.save(flush: true)
        }
        def sprint2 = Sprint.findByNameAndRelease("2", release)
        if (!sprint2) {
            def expectedStartCal = new GregorianCalendar(2008, 11, 15, 8, 0)
            def expectedCompletionCal = new GregorianCalendar(2008, 12, 15, 8, 0)
            def actualStartCal = new GregorianCalendar(2008, 12, 3, 8, 0)
            def actualCompletionCal = new GregorianCalendar(2008, 12, 28, 8, 0)
            sprint2 = new Sprint(name: "2", description: "The 2nd sprint.",
                    expectedStartDate: expectedStartCal.getGregorianChange(),
                    expectedCompletionDate: expectedCompletionCal.getGregorianChange(),
                    actualStartDate: actualStartCal.getGregorianChange(),
                    actualCompletionDate: actualCompletionCal.getGregorianChange(),
                    release: release, visibility: "all")
            sprint2.save(flush: true)
        }
    }

    private void create1ReleaseDemoSprints(def release) {
        def sprint1 = Sprint.findByNameAndRelease("1", release)
        if (!sprint1) {
            def expectedStartCal = new GregorianCalendar(2009, 1, 20, 8, 0)
            def expectedCompletionCal = new GregorianCalendar(2009, 2, 25, 8, 0)
            sprint1 = new Sprint(name: "1", description: "The 1st sprint.",
                    expectedStartDate: expectedStartCal.getGregorianChange(),
                    expectedCompletionDate: expectedCompletionCal.getGregorianChange(),
                    release: release, visibility: "all")
            sprint1.save(flush: true)
        }
        def sprint2 = Sprint.findByNameAndRelease("2", release)
        if (!sprint2) {
            def expectedStartCal = new GregorianCalendar(2009, 2, 28, 8, 0)
            def expectedCompletionCal = new GregorianCalendar(2009, 4, 3, 8, 0)
            sprint2 = new Sprint(name: "2", description: "The 2nd sprint.",
                    expectedStartDate: expectedStartCal.getGregorianChange(),
                    expectedCompletionDate: expectedCompletionCal.getGregorianChange(),
                    release: release, visibility: "all")
            sprint2.save(flush: true)
        }
        def sprint3 = Sprint.findByNameAndRelease("3", release)
        if (!sprint3) {
            def expectedStartCal = new GregorianCalendar(2009, 4, 10, 8, 0)
            def expectedCompletionCal = new GregorianCalendar(2009, 5, 15, 8, 0)
            sprint3 = new Sprint(name: "3", description: "The 3rd sprint.",
                    expectedStartDate: expectedStartCal.getGregorianChange(),
                    expectedCompletionDate: expectedCompletionCal.getGregorianChange(),
                    release: release, visibility: "all")
            sprint3.save(flush: true)
        }
    }

    private void createUserSettings() {
        def systemUser = SystemUser.findByUsername("userx@demo.com")
        def userSettings = UserSettings.findBySystemUser(systemUser)
        if (!userSettings) {
            def product = Product.findByName("Demo Product")
            def release = Release.findByName("0.5")
            def sprint = Sprint.findByName("1")
            userSettings = new UserSettings(systemUser: systemUser,
                    currentProduct: product, currentRelease: release, currentSprint: sprint)
            userSettings.save(flush: true)
        }
    }


} 