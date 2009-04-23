/**
 *  Copyright 2009   scrumtime.org
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
package scrumtime.lookup

import grails.converters.XML

class TimeZoneController {

    def fillTimeZones = {
        def timeZoneLookup
        def availableIds = TimeZone.getAvailableIDs()
        for (id in availableIds) {
            def timeZone = TimeZone.getTimeZone(id)
            timeZoneLookup = new TimeZoneLookup(timeZoneId: id,
                shortName: timeZone.getDisplayName(false, TimeZone.SHORT),
                longName: timeZone.getDisplayName(false, TimeZone.LONG),
                supported: true)
            timeZoneLookup.save()
        }

        render TimeZoneLookup.listOrderByShortName() as XML
    }

    def init = {
        def timeZoneLookup
        def availableIds = TimeZone.getAvailableIDs()
        for (id in availableIds) {
            def timeZone = TimeZone.getTimeZone(id)
            timeZoneLookup = new TimeZoneLookup(timeZoneId: id,
                shortName: timeZone.getDisplayName(false, TimeZone.SHORT),
                longName: timeZone.getDisplayName(false, TimeZone.LONG),
                supported: true)
            timeZoneLookup.save()
        }
        redirect (controller:'home',action:'index')
    }
}