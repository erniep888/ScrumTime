<html>
<head>
    <title>Scrum Time - Organization Directory</title>
    <meta name="layout" content="main"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonSubWindow.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonTable.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonEdit.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'management.css')}"/>

</head>
<body>
<center>
    <div class="subWindow viewWindow">
        <div class="subWindowTitle">View Organization</div>
        <table cellpadding="0" cellspacing="0" border="1" class="paddingTop5">
            <tr>
                <td class="fontSize12 width130">Name</td>
                <td class="fontSize12 width300">${selectedOrganization.name}</td>
            </tr>
            <tr>
                <td class="fontSize12 width130">Description</td>
                <td class="fontSize12 width300">${selectedOrganization?.description}</td>
            </tr>
            <tr>
                <td class="fontSize12 width130">Members</td>
                <td class="fontSize12 width300">${selectedOrganization?.members?.size()}</td>
            </tr>
            <tr>
                <td class="fontSize12 width130">Administrators</td>
                <td class="fontSize12 width300">${selectedOrganization?.admins?.size()}</td>
            </tr>
            <tr>
                <td class="fontSize12 width130">Products</td>
                <td class="fontSize12 width300">${selectedOrganization?.products?.size()}</td>
            </tr>            
            <tr>
                <td colspan="2" class="findButtonTd">
                    <g:hiddenField name="organizationId" value="${selectedOrganization.id}"/>
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