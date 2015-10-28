<html>
<head>
    <title>Scrum Time - Sprint Directory</title>
    <meta name="layout" content="main"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonSubWindow.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonTable.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonEdit.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'management.css')}"/>

</head>
<body>
<center>
    <div class="subWindow viewWindow">
        <div class="subWindowTitle">View Sprint</div>
        <table cellpadding="0" cellspacing="0" border="1" class="paddingTop5">
            <tr>
                <td class="fontSize12 width130">Name</td>
                <td class="fontSize12 width300">${selectedSprint.name}</td>
            </tr>
            <tr>
                <td class="fontSize12 width130">Description</td>
                <td class="fontSize12 width300">${selectedSprint?.description}</td>
            </tr>
            <tr>
                <td class="fontSize12 width130">Release</td>
                <td class="fontSize12 width300">${selectedSprint?.release?.name}</td>
            </tr>
            <tr>
                <td class="fontSize12 width130">Scrums</td>
                <td class="fontSize12 width300">${selectedSprint?.scrums?.size()}</td>
            </tr>
            <tr>
                <td class="fontSize12 width130">Expected Start</td>
                <td class="fontSize12 width300">${selectedSprint?.expectedStartDate}</td>
            </tr>
            <tr>
                <td colspan="2" class="findButtonTd">
                    <g:hiddenField name="sprintId" value="${selectedSprint.id}"/>
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