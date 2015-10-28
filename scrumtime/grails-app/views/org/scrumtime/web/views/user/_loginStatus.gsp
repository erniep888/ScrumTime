<table align="right">
    <tr>
        <td class="loginStatus">
            <span class="userName">${session?.userIdentity?.authenticationToken?.systemUser?.username}</span> |
            <a href="${createLink(controller: 'userAuthentication', action:'logout')}"><g:message code="common.header.logout"/></a>
        </td>
    </tr>
    <tr>
        <td class="loginStatus">
            <g:set var="today" value="${new Date()}" scope="page"/>
            <g:formatDate format="MMMMM dd, yyyy" date="${today}"/>
        </td>
    </tr>
</table>