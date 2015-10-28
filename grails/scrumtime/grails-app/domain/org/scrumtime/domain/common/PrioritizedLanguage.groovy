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
package org.scrumtime.domain.common
/**
 * Created by IntelliJ IDEA.
 * User: epaschall
 * Date: Jun 10, 2008
 * Time: 9:58:04 PM
 * To change this template use File | Settings | File Templates.
 */
class PrioritizedLanguage {
    String threeLetterCountrySymbol
    String threeLetterLanguageSymbol
    String displayName
    String displayLanguage
    Integer displayOrder

    static constraints = {
        threeLetterCountrySymbol (nullable: false, unique: true, maxLength: 3)
        threeLetterLanguageSymbol (nullable: false, maxLength: 3)
        displayName (nullable:false, blank:false)
        displayLanguage (nullable:false, blank:false)
    }
}