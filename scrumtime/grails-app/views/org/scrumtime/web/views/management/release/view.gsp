<html>
<head>
    <title>Scrum Time - Release Directory</title>
    <meta name="layout" content="main"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonSubWindow.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonTable.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonEdit.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'management.css')}"/>

</head>
<body>
<center>
    <div class="subWindow viewWindow">
        <div class="subWindowTitle">View Release</div>
        <table cellpadding="0" cellspacing="0" border="1" class="paddingTop5">
            <tr>
                <td class="fontSize12 width130">Name</td>
                <td class="fontSize12 width300">${selectedRelease.name}</td>
            </tr>
            <tr>
                <td class="fontSize12 width130">Description</td>
                <td class="fontSize12 width300">${selectedRelease?.description}</td>
            </tr>
            <tr>
                <td class="fontSize12 width130">Product</td>
                <td class="fontSize12 width300">${selectedRelease?.product?.name}</td>
            </tr>
            <tr>
                <td class="fontSize12 width130">Sprints</td>
                <td class="fontSize12 width300">${selectedRelease?.sprints?.size()}</td>
            </tr>
            <tr>
                <td class="fontSize12 width130">Expected Start</td>
                <td class="fontSize12 width300">${selectedRelease?.expectedStartDate}</td>
            </tr>
            <tr>
                <td colspan="2" class="findButtonTd">
                    <g:hiddenField name="releaseId" value="${selectedRelease.id}"/>
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