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
            <g:form name="addToBacklogForm" url="[controller:'backlog']">
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
                    <scrumtime:editfield fieldName="workRemaining" labelValue="Work Remaining"
                            labelClass="editLabel"
                            fieldTdClass="${hasErrors(bean:backlogItem, field:'workRemaining',' errors')}"
                            fieldClass="editField"
                            fieldValue="${backlogItem.workRemaining}"
                            fieldSize="6"
                            useSemiColon="true"
                            postHtml="&nbsp;hrs"
                            id="workRemaining"/>
                </tr>
                <g:if test="${viewMode == 'edit'}">
                    <tr>
                        <scrumtime:editfield fieldName="workCompleted" labelValue="Work Completed"
                                labelClass="editLabel"
                                fieldTdClass="${hasErrors(bean:backlogItem, field:'workCompleted',' errors')}"
                                fieldClass="editField"
                                fieldValue="${backlogItem.workCompleted}"
                                fieldSize="6"
                                useSemiColon="true"
                                postHtml="&nbsp;hrs"
                                id="workCompleted"/>
                    </tr>
                </g:if>
                <tr>
                    <td class="editLabel">
                        <label for="selectedEstimatedBy">Estimated By:</label>
                    </td>
                    <td valign="top" class="editField">
                        <g:select name="selectedEstimatedBy" value="${backlogItem?.estimatedBy?.id}"
                                from="${availableUsers}" optionKey="id" optionValue="nickName"
                                noSelection="${['-1':'---------------']}" />
                    </td>
                </tr>
                <tr>
                    <td class="editLabel">
                        <label for="selectedAssignedTo">Assigned To:</label>
                    </td>
                    <td valign="top" class="editField">
                        <g:select name="selectedAssignedTo" value="${backlogItem?.assignedTo?.id}"
                                from="${availableUsers}" optionKey="id" optionValue="nickName" 
                                noSelection="${['-1':'---------------']}"/>
                    </td>
                </tr>
                <tr>
                    <td class="editLabel">
                        <label for="selectedPriority">Priority:</label>
                    </td>
                    <td valign="top" class="editField">
                        <g:select name="selectedPriority" value="${backlogItem?.productPriority?.id}"
                                from="${priorities}" optionKey="id" optionValue="name"  />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td class="findButtonTd">
                        <g:hiddenField name="submitted" value="true"/>
                        <g:hiddenField name="id" value="${backlogItem?.id}"/>
                        <g:if test="${viewMode == 'edit'}">
                            <g:if test="${backlogType == 'product'}">
                                <g:actionSubmit class="fontSize12 width110" action="saveToProduct" value="Save"/>&nbsp;
                            </g:if>
                            <g:if test="${backlogType == 'release'}">
                                <g:actionSubmit class="fontSize12 width110" action="saveToRelease" value="Save"/>&nbsp;
                            </g:if>
                            <g:if test="${backlogType == 'sprint'}">
                                <g:actionSubmit class="fontSize12 width110" action="saveToSprint" value="Save"/>&nbsp;
                            </g:if>
                        </g:if>
                        <g:else>
                            <g:actionSubmit class="fontSize12 width110" action="saveToProduct" value="Save To Product"/>&nbsp;
                            <g:actionSubmit class="fontSize12 width110" action="saveToRelease" value="Save To Release"/>&nbsp;
                            <g:actionSubmit class="fontSize12 width110" action="saveToSprint" value="Save To Sprint"/>&nbsp;
                        </g:else>
                        <g:actionSubmit class="fontSize12 width110" action="viewBacklog" value="Cancel"/>
                    </td>
                </tr>
            </g:form>   <!-- There is a bug in ie 7 that prevents me from putting this after the table-->
        </table>
        </div>
    </div>

</center>
</body>
</html>


