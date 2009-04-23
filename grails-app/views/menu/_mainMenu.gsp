<table cellpadding="0" cellspacing="0" style="width:100%">
    <tr>
        <td class="tabBottomBorder" style="width:20px;">&nbsp;</td>
        <td style="width:772px">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <g:if test="${!mainMenuSelection || mainMenuSelection == '' || mainMenuSelection == 'home'}">
                        <g:render template="/menu/mainMenuTab"
                            model="['tabStatus':'ON','tabLabel':'Home','tabLink':grailsApplication.config.grails.webAppPath]"/>
                    </g:if>
                    <g:else>
                        <g:render template="/menu/mainMenuTab"
                            model="['tabStatus':'OFF','tabLabel':'Home','tabLink':grailsApplication.config.grails.webAppPath]"/>
                    </g:else>
                    <td class="tabBottomBorder" style="width:20px"></td>
                    <g:if test="${mainMenuSelection == 'scrum'}">
                        <g:render template="/menu/mainMenuTab"
                            model="['tabStatus':'ON','tabLabel':'Scrum']"/>
                    </g:if>
                    <g:else>
                        <g:render template="/menu/mainMenuTab"
                            model="['tabStatus':'OFF','tabLabel':'Scrum','tabLink':createLink(controller:'scrum',action:'index')]"/>
                    </g:else>
                    <td class="tabBottomBorder" style="width:20px"></td>
                    <g:if test="${mainMenuSelection == 'backlog'}">
                        <g:render template="/menu/mainMenuTab"
                            model="['tabStatus':'ON','tabLabel':'Backlog']"/>
                    </g:if>
                    <g:else>
                        <g:render template="/menu/mainMenuTab"
                            model="['tabStatus':'OFF','tabLabel':'Backlog','tabLink':createLink(controller:'backlog',action:'index')]"/>
                    </g:else>
                    <td class="tabBottomBorder" style="width:20px"></td>
                    <g:if test="${mainMenuSelection == 'management'}">
                        <g:render template="/menu/mainMenuTab"
                            model="['tabStatus':'ON','tabLabel':
                  'Management','tabLink': createLink(controller:'management', action:'index')]"/>
                    </g:if>
                    <g:else>
                        <g:render template="/menu/mainMenuTab"
                            model="['tabStatus':'OFF','tabLabel':
                  'Management','tabLink': createLink(controller:'management', action:'index')]"/>
                    </g:else>
                    <td class="tabBottomBorder" style="width:20px"></td>
                    <g:if test="${mainMenuSelection == 'search'}">
                        <g:render template="/menu/mainMenuTab"
                            model="['tabStatus':'ON','tabLabel':
                  'Search','tabLink': createLink(controller:'search', action:'list')]"/>
                    </g:if>
                    <g:else>
                        <g:render template="/menu/mainMenuTab"
                            model="['tabStatus':'OFF','tabLabel':
                  'Search','tabLink': createLink(controller:'search', action:'list')]"/>
                    </g:else>

                    <td class="tabBottomBorder" style="width:20px"></td>
                    <g:if test="${mainMenuSelection == 'help'}">
                        <g:render template="/menu/mainMenuTab"
                            model="['tabStatus':'ON','tabLabel':
                  'Help','tabLink': createLink(controller:'help', action:'list')]"/>
                    </g:if>
                    <g:else>
                        <g:render template="/menu/mainMenuTab"
                            model="['tabStatus':'OFF','tabLabel':
                  'Help','tabLink': createLink(controller:'help', action:'list')]"/>
                    </g:else>
                </tr>
            </table>
        </td>
        <td class="tabBottomBorder" style="width:auto;">&nbsp;</td>
    </tr>
</table>
