<table cellpadding="0" cellspacing="4px">
    <tr>
        <td class="levelOne">Organization</td>
    </tr>
    <tr>
        <g:if test="${session?.userSettings?.currentOrganization}">
            <td class="levelTwo"><img src="${createLinkTo(dir: 'images/menu', file: 'rightarrow.gif')}" alt="Right Arrow"/>&nbsp;&nbsp;<g:link controller="siteMember" action="index">${session?.userSettings?.currentOrganization.name}</g:link></td>
        </g:if>
        <g:else>
            <td class="levelTwo"><img src="${createLinkTo(dir: 'images/menu', file: 'rightarrow.gif')}" alt="Right Arrow"/>&nbsp;&nbsp;<g:link controller="siteMember" action="index">Not Set</g:link></td>
        </g:else>
    </tr>
    <tr>
        <td class="levelOne">Product</td>
    </tr>
    <tr>
        <g:if test="${session?.userSettings?.currentProduct}">
            <td class="levelTwo"><img src="${createLinkTo(dir: 'images/menu', file: 'rightarrow.gif')}" alt="Right Arrow"/>&nbsp;&nbsp;<g:link controller="siteMember" action="index">${session?.userSettings?.currentProduct.name}</g:link></td>
        </g:if>
        <g:else>
            <td class="levelTwo"><img src="${createLinkTo(dir: 'images/menu', file: 'rightarrow.gif')}" alt="Right Arrow"/>&nbsp;&nbsp;<g:link controller="siteMember" action="index">Not Set</g:link></td>
        </g:else>
    </tr>
    <tr>
        <td class="levelOne">Release</td>
    </tr>
    <tr>
        <g:if test="${session?.userSettings?.currentRelease}">
            <td class="levelTwo"><img src="${createLinkTo(dir: 'images/menu', file: 'rightarrow.gif')}" alt="Right Arrow"/>&nbsp;&nbsp;<g:link controller="siteMember" action="index">${session?.userSettings?.currentRelease.name}</g:link></td>
        </g:if>
        <g:else>
            <td class="levelTwo"><img src="${createLinkTo(dir: 'images/menu', file: 'rightarrow.gif')}" alt="Right Arrow"/>&nbsp;&nbsp;<g:link controller="siteMember" action="index">Not Set</g:link></td>
        </g:else>
    </tr>
    <tr>
        <td class="levelOne">Sprint</td>
    </tr>
    <tr>
        <g:if test="${session?.userSettings?.currentSprint}">
            <td class="levelTwo"><img src="${createLinkTo(dir: 'images/menu', file: 'rightarrow.gif')}" alt="Right Arrow"/>&nbsp;&nbsp;<g:link controller="siteMember" action="index">${session?.userSettings?.currentSprint.name}</g:link></td>
        </g:if>
        <g:else>
            <td class="levelTwo"><img src="${createLinkTo(dir: 'images/menu', file: 'rightarrow.gif')}" alt="Right Arrow"/>&nbsp;&nbsp;<g:link controller="siteMember" action="index">Not Set</g:link></td>
        </g:else>
    </tr>
    <tr>
        <td class="levelOne">Scrum Team</td>
    </tr>
    <tr>
        <g:if test="${session?.userSettings?.currentScrumTeam}">
            <td class="levelTwo"><img src="${createLinkTo(dir: 'images/menu', file: 'rightarrow.gif')}" alt="Right Arrow"/>&nbsp;&nbsp;<g:link controller="siteMember" action="index">${session?.userSettings?.currentScrumTeam.name}</g:link></td>
        </g:if>
        <g:else>
            <td class="levelTwo"><img src="${createLinkTo(dir: 'images/menu', file: 'rightarrow.gif')}" alt="Right Arrow"/>&nbsp;&nbsp;<g:link controller="siteMember" action="index">Not Set</g:link></td>
        </g:else>
    </tr>
</table>


