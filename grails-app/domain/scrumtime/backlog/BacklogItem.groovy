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
package scrumtime.backlog

class BacklogItem {
    Date dateCreated
    Date lastUpdated

    String title
    String description
    int workEstimate  // in hours
    String assignedTo
    String estimatedBy

    static constraints = {
        title(blank: false, nullable: false, size: 1..256)
        description(nullable: true, size: 0..512)
        workEstimate(nullable:false)
        assignedTo(nullable: true)
        estimatedBy(nullable: true)
    }
}
