<table align="right">
    <tr>
        <td class="loginStatus">
            <span class="userName">userx@demo.com</span> |
            <g:message code="common.header.logout"/>
        </td>
    </tr>
    <tr>
        <td class="loginStatus">
            <g:set var="today" value="${new Date()}" scope="page"/>
            <g:formatDate format="MMMMM dd, yyyy" date="${today}"/>
        </td>
    </tr>
</table>