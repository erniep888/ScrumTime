<html>
<head>
    <title>Scrum Time - Site Member Directory</title>
    <meta name="layout" content="main"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonSubWindow.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonTable.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonEdit.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'management.css')}"/>

</head>
<body>
<center>
    <div class="subWindow viewWindow">
        <div class="subWindowTitle">View Site Member</div>
        <table cellpadding="0" cellspacing="0" border="1" class="paddingTop5">
            <tr>
                <td class="fontSize12 width130">Public Nick Name</td>
                <td class="fontSize12 width300">${selectedUserInformation.nickName}</td>
            </tr>
            <tr>
                <td class="fontSize12 width130">First Name</td>
                <td class="fontSize12 width300">${selectedUserInformation?.firstName}</td>
            </tr>
            <tr>
                <td class="fontSize12 width130">Last Name</td>
                <td class="fontSize12 width300">${selectedUserInformation?.lastName}</td>
            </tr>
            <tr>
                <td class="fontSize12 width130">Time Zone</td>
                <td class="fontSize12 width300">${selectedUserInformation?.timeZone.shortForm}</td>
            </tr>
            <tr>
                <td class="fontSize12 width130">Language</td>
                <td class="fontSize12 width300">${selectedUserInformation?.language.displayLanguage}</td>
            </tr>
            <tr>
                <td class="fontSize12 width130">Visibility</td>
                <td class="fontSize12 width300">${selectedUserInformation?.visibilityType.name}</td>
            </tr>
            <tr>
                <td colspan="2" class="findButtonTd">
                    <g:hiddenField name="systemUserId" value="${selectedUserInformation.systemUser.id}"/>
                    <input class="fontSize12 width60" type=button value="Back" onClick="history.go(-1)">&nbsp;
                    <g:actionSubmit class="fontSize12 width60" action="edit" value="Edit"/>&nbsp;
                    <g:actionSubmit class="fontSize12 width60" action="delete" value="Delete"/>
                </td>
            </tr>
        </table>
    </div>

</center>
</body>
</html>