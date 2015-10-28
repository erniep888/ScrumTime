<html>
<head>
    <title>Scrum Time - Product Backlog</title>
    <meta name="layout" content="main"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonSubWindow.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonTable.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonEdit.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'backlog.css')}"/>
</head>
<body>
<center>
    <div class="subWindow addToBacklogWindow">
        <div class="subWindowTitle">Product Backlog</div>
        <div class="backlogViewDiv">
            <div class="backlogViewDivHeader">
                <table cellpadding="0" cellspacing="4" border="0" class="">
                    <tr>
                        <td class="currentHeader width65">Priority</td>
                        <td class="currentHeader width200">Name</td>
                        <td class="currentHeader width75">Work Remaining</td>
                        <td class="currentHeader width75">Work Completed</td>
                        <td class="currentHeader width215">Actions</td>
                    </tr>
                </table>
            </div>
            <div class="backlogViewDivScrollable">
                <table cellpadding="1" cellspacing="0" border="0" class="">
                    <g:each var="backlogItem" in="${productBacklog}">
                        <tr>
                            <td class="width65 fontSize11 horiAlignCenter">${backlogItem?.productPriority.value}</td>
                            <td class="width200 fontSize11 horiAlignCenter">${backlogItem?.name}</td>
                            <td class="width80 fontSize11 horiAlignCenter">${backlogItem?.workRemaining}</td>
                            <td class="width75 fontSize11 horiAlignCenter">${backlogItem?.workCompleted}</td>
                            <td class="width215 fontSize11 horiAlignCenter">
                                Details | Edit |
                                <g:link controller="backlog" action="deleteFromBacklog" id="${backlogItem.id}">Delete</g:link>
                                | Reassign
                            </td>
                        </tr>
                    </g:each>
                </table>
            </div>
        </div>
        <g:render template="/org/scrumtime/web/views/backlog/currentSettings"/>
    </div>

</center>
</body>
</html>


