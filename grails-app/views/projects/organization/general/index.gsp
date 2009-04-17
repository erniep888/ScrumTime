<html>
<head>
    <title><g:message code="scrumtime.title"/></title>
    <meta name="layout" content="projects"/>
</head>
<body>
<div>
    <g:if test="${organization}">
        <g:render template="/projects/organization/orgHeader"/>
    </g:if>
    <table cellpadding="0" cellspacing="0">
        <tr>
            <g:render template="/projects/organization/orgMenu"/>
        </tr>
        <tr>
            <td colspan="4">
                <g:if test="${isEditable}">
                    <g:render template="/projects/organization/general/edit"/>
                </g:if>
                <g:else>
                    <g:render template="/projects/organization/general/view"/>
                </g:else>
            </td>
        </tr>
    </table>
</div>
</body>
</html>