<g:if test="${backlogViewSettings?.backlogType =='sprint'}">
    <div class="subWindowTitle sprintBacklogViewWindow fontSize12"><span class="fontSize9 fontGray">
        Sprint Backlog - </span>${session?.userSettings?.currentSprint?.name}</div>
</g:if>
<g:elseif test="${backlogViewSettings?.backlogType =='release'}">
    <div class="subWindowTitle releaseBacklogViewWindow fontSize12"><span class="fontSize9 fontGray">
        Release Backlog - </span>${session?.userSettings?.currentRelease?.name}</div>
</g:elseif>
<g:else>
    <div class="subWindowTitle productBacklogViewWindow fontSize12"><span class="fontSize9 fontGray">
        Product Backlog - </span>${session?.userSettings?.currentProduct?.name}</div>
</g:else>
<div class="backlogFilterDiv">
    <g:form name="searchForm" url="[controller:'backlog']">
    <table>
        <tr>
            <scrumtime:editfield fieldName="filterName" labelValue="Name"
                    labelClass="editFieldSmall"
                    fieldTdClass="filterTrEdit
                                  ${hasErrors(field:'filterName',' errors')}"
                    fieldClass="editFieldSmall"
                    fieldSize="45"
                    fieldMaxLength="200"
                    fieldValue="${backlogViewSettings?.filterName}"
                    useSemiColon="true"/>
            <td>&nbsp;&nbsp;&nbsp;</td>
            <td class="editFieldSmall">
                <label for="selectedAssignedTo">Assigned To:</label>
            </td>
            <td valign="middle" class="editFieldSmall">
                <g:select name="filterUserId" value="${backlogViewSettings?.filterUserId}"
                                from="${availableUsers}" optionKey="id" optionValue="nickName"
                                noSelection="${['-1':'---------------']}" class="editFieldSmall" />
            </td>
            <td>&nbsp;&nbsp;&nbsp;</td>
            <td>
                <g:hiddenField name="filterSubmit" value="true"/>
                <g:actionSubmit class="fontSize12" action="viewBacklog" value="Filter"/>&nbsp;
            </td>
        </tr>
        </g:form>   <!-- There is a bug in ie 7 that prevents me from putting this after the table-->
    </table>
</div>
<div class="backlogViewDivHeader fontSize10">
    <table class="width100Percent" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td class="viewHeader width65 rightBorder">Id</td>
            <td class="viewHeader width65 rightBorder">Priority</td>
            <td class="viewHeader width300 rightBorder">Title</td>
            <td class="viewHeader width50 rightBorder">Work Rem</td>
            <td class="viewHeader width50 rightBorder">Work Comp</td>
            <td class="viewHeader width85 rightBorder">Assigned To</td>
            <td class="viewHeader">Actions&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
    </table>
</div>
<g:each var="backlogItem" in="${backlog}">
    <div class="draggableBacklogItem" id="draggable_${backlogItem?.id}" onmouseover="createDraggable('${backlogItem?.id}');">
        <table cellpadding="0" cellspacing="0" border="0" class="width100Percent">

            <tr>
                <td class="width65 fontSize11 horiAlignCenter">${backlogItem?.id}</td>
                <td class="width65 fontSize11 horiAlignCenter">${backlogItem?.productPriority.value}</td>
                <td class="width300 fontSize11 horiAlignCenter">${backlogItem?.name}</td>
                <td class="width50 fontSize11 horiAlignCenter">${backlogItem?.workRemaining}</td>
                <td class="width50 fontSize11 horiAlignCenter">${backlogItem?.workCompleted}</td>
                <td class="width85 fontSize11 horiAlignCenter">${backlogItem?.assignedTo?.nickName}</td>
                <td class="fontSize11 horiAlignCenter">
                    <g:link controller="backlog" action="viewBacklogItem" id="${backlogItem?.id}"
                            params="[viewMode:'edit',backlogType:backlogViewSettings?.backlogType]">Edit</g:link> |
                    <g:link controller="backlog" action="deleteFromBacklog" id="${backlogItem?.id}">Delete</g:link>
                    | <span id="dragHandle_${backlogItem?.id}" class="dragHandle">DRAG ></span>
                </td>
            </tr>
        </table>
    </div>
</g:each>