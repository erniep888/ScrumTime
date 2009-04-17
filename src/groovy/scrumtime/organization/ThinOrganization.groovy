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
package scrumtime.organization

import scrumtime.product.ThinProduct

public class ThinOrganization implements Comparable{
    String id
    String name
    SortedSet<ThinProduct> thinProducts

    def int compareTo(obj) {
        def result = 0
        if (obj instanceof ThinOrganization) {
            def thinOrganization = (ThinOrganization) obj
            if (thinOrganization && thinOrganization.name && this.name)
                result = this.name.compareTo(thinOrganization.name)
        }
        return result
    }
}