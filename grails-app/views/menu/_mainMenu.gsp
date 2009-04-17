<table cellpadding="0" cellspacing="0" style="width:100%">
    <tr>
        <td class="tabBottomBorder" style="width:auto;">&nbsp;</td>
        <td style="width:620px">
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
                    <g:if test="${mainMenuSelection == 'projects'}">
                        <g:render template="/menu/mainMenuTab"
                            model="['tabStatus':'ON','tabLabel':'Projects']"/>
                    </g:if>
                    <g:else>
                        <g:render template="/menu/mainMenuTab"
                            model="['tabStatus':'OFF','tabLabel':'Projects','tabLink':createLink(controller:'navigation',action:'index')]"/>
                    </g:else>
                    <td class="tabBottomBorder" style="width:20px"></td>
                    <g:if test="${mainMenuSelection == 'community'}">
                        <g:render template="/menu/mainMenuTab"
                            model="['tabStatus':'ON','tabLabel':
                  'Community','tabLink': createLink(controller:'community', action:'list')]"/>
                    </g:if>
                    <g:else>
                        <g:render template="/menu/mainMenuTab"
                            model="['tabStatus':'OFF','tabLabel':
                  'Community','tabLink': createLink(controller:'community', action:'list')]"/>
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
