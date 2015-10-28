<html>
<head>
    <title>Scrum Time - Add To Backlog</title>
    <meta name="layout" content="main"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonSubWindow.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonTable.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonEdit.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'backlog.css')}"/>
</head>
<body>
<center>
    <div class="subWindow addToBacklogWindow">
        <div class="subWindowTitle">Add To Backlog</div>
            <div class="addToBacklogEditDiv">
                <g:hasErrors>
                    <div class="errors">
                        <g:renderErrors bean="${backlogItem}" field="name" as="list"/>
                        <g:renderErrors bean="${backlogItem}" field="description" as="list"/>
                        <g:renderErrors bean="${backlogItem}" field="workRemaining" as="list"/>
                        <g:renderErrors bean="${backlogItem}" field="productPriority" as="list"/>
                    </div>
                </g:hasErrors>
                <g:form name="searchForm" url="[controller:'backlog']">
                <table align="left" cellpadding="0" cellspacing="7" border="0" class="">
                <tr>
                    <scrumtime:editfield fieldName="name" labelValue="Name"
                            labelClass="editLabel"
                            fieldTdClass="${hasErrors(bean:backlogItem, field:'name',' errors')}"
                            fieldClass="editField"
                            fieldSize="96"
                            fieldValue="${backlogItem.name}"
                            useSemiColon="true"
                            id="name"/>
                </tr>
                <tr>
                    <scrumtime:textareafield fieldName="description" labelValue="Description"
                            labelClass="editLabel"
                            fieldTdClass="${hasErrors(bean:backlogItem, field:'description',' errors')}"
                            fieldClass="editField"
                            fieldValue="${backlogItem.description}"
                            useSemiColon="true"
                            id="description"/>
                </tr>
                <tr>
                    <scrumtime:editfield fieldName="workRemaining" labelValue="Work Estimate"
                            labelClass="editLabel"
                            fieldTdClass="${hasErrors(bean:backlogItem, field:'workRemaining',' errors')}"
                            fieldClass="editField"
                            fieldValue="${backlogItem.workRemaining}"
                            fieldSize="6"
                            useSemiColon="true"
                            postHtml="&nbsp;hrs"
                            id="workRemaining"/>
                </tr>
                <tr>
                    <td class="editLabel">
                        <label for="selectedEstimatedBy">Estimated By:</label>
                    </td>
                    <td valign="top" class="editField">
                        <g:select name="selectedEstimatedBy" optionKey="id"
                                optionValue="displayName" from="${availableUsers}" value="${selectedEstimatedBy}"/>
                    </td>
                </tr>
                <tr>
                    <td class="editLabel">
                        <label for="selectedAssignedTo">Assigned To:</label>
                    </td>
                    <td valign="top" class="editField">
                        <g:select name="selectedAssignedTo" optionKey="id"
                                optionValue="displayName" from="${availableUsers}" value="${selectedAssignedTo}"/>
                    </td>
                </tr>
                <tr>
                    <td class="editLabel">
                        <label for="selectedPriority">Priority:</label>
                    </td>
                    <td valign="top" class="editField">
                        <g:select name="selectedPriority" optionKey="id"
                                optionValue="name" from="${priorities}" value="${selectedPriority}"/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td class="findButtonTd">
                        <g:hiddenField name="submitted" value="true"/>
                        <g:actionSubmit class="fontSize12 width110" action="addToBacklog" value="Add To Product"/>&nbsp;
                        <g:actionSubmit class="fontSize12 width110" action="find" value="Add To Release"/>&nbsp;
                        <g:actionSubmit class="fontSize12 width110" action="find" value="Add To Sprint"/>&nbsp;
                        <g:actionSubmit class="fontSize12 width110" action="findAll" value="Cancel"/>
                    </td>
                </tr>
            </g:form>   <!-- There is a bug in ie 7 that prevents me from putting this after the table-->
            </table>
        </div>
        <g:render template="/org/scrumtime/web/views/backlog/currentSettings"/>
    </div>

</center>
</body>
</html>


