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
package org.scrumtime.web.taglibs

class SharedTagLib {
    static namespace = 'scrumtime'
    def header = {attrs ->
        out << render(template: "/org/scrumtime/web/views/shared/header")
    }

    def footer = {attrs ->
        out << render(template: "/org/scrumtime/web/views/shared/footer")
    }

    def mainmenu = {attrs ->
        out << render(template: "/org/scrumtime/web/views/shared/mainMenu")
    }

    def messagepane = {attrs ->
        out << render(template: "/org/scrumtime/web/views/shared/appMessagePane",
                      model:[messageCode:attrs.messageCode])
    }

    def editfield = {attrs ->
        out << render(template: "/org/scrumtime/web/views/shared/formEditField",
                      model:[useSemiColon:attrs.useSemiColon,
                             labelClassValue:attrs.labelClass,
                             fieldClassValue:attrs.fieldClass,
                             fieldTdClassValue:attrs.fieldTdClass,
                             fieldName:attrs.fieldName,
                             fieldSize:attrs.fieldSize,
                             fieldMaxLenth:attrs.fieldMaxLenth,
                             fieldValue:attrs.fieldValue,
                             labelValue:attrs.labelValue,
                             passwordType:attrs.passwordType,
                             postHtml:attrs.postHtml,
                             id:attrs.id])
    }

    def textareafield = {attrs ->
        out << render(template: "/org/scrumtime/web/views/shared/formTextAreaField",
                      model:[useSemiColon:attrs.useSemiColon,
                             labelClassValue:attrs.labelClass,
                             fieldClassValue:attrs.fieldClass,
                             fieldName:attrs.fieldName,
                             fieldValue:attrs.fieldValue,
                             labelValue:attrs.labelValue,
                             textAreaClassValue:attrs.textAreaClass,
                             rowCount:attrs.rowCount,
                             colCount:attrs.colCount,
                             onkeyup:attrs.onkeyup,
                             id:attrs.id])
    }
}
