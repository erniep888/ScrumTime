<g:def var="totalWorkEstimate" value="${0}"/>
<div style="font-size:10px;color:#999;position:absolute;left:30px;top:198px">Product Backlog</div>
<div style="text-align:left;border-left:#999 solid 1px;border-right:#999 solid 1px;border-bottom:#999 solid 1px;">
    <div style="background-color:#c8dbe6;border-bottom:#fff solid 2px;" align="center">
        <table cellpadding="0" cellspacing="0" border="0" style="padding-top:4px;padding-bottom:4px;">
            <g:form name="filterBacklogItems" url="[controller:'backlog']">
                <tr>
                    <td style="font-size:13px;padding-right:6px">Id #:</td>
                    <td><input style="font-size:12px" type="text" name="filterScriptNum" value="${testScenarioViewSettings?.filterScriptNum}" maxlength="200" size="30"/></td>
                    <td style="font-size:13px;padding-left:20px;padding-right:6px">Title:</td>
                    <td><input style="font-size:12px" type="text" name="filterTitle" value="${testScenarioViewSettings?.filterTitle}" maxlength="200" size="30"/></td>
                    <td style="font-size:13px;padding-left:20px;padding-right:6px">Estimated By:</td>
                    <td>
                        <g:select style="font-size:12px" name="filterAssignedToId" value=""
                            from="${users}" optionKey="nickName" optionValue="nickName"
                            noSelection="['-1':'----------------------']"/></td>
                    <td><g:actionSubmit style="font-size:12px;margin-left:20px;" value="Filter" action="filter"/></td>
                    <td></td>
                </tr>
            </g:form>
        </table>
    </div>
    <div style="width:100%;background-color:#c6d5ec;border-bottom:#fff solid 2px;" align="center">
        <table style="width:100%" cellpadding="0" cellspacing="0">
            <tr style="font-size:12px;height:20px;">
                <td style="width:60px;border-right:#fff solid 2px;background-color:#c6d5ec;text-align:center;vertical-align:middle;font-weight:bold;">Priority Index</td>
                <td style="width:50px;border-right:#fff solid 2px;background-color:#c6d5ec;text-align:center;vertical-align:middle;font-weight:bold;">Id</td>
                <td style="border-right:#fff solid 2px;background-color:#c6d5ec;text-align:center;vertical-align:middle;font-weight:bold;">Title</td>
                <td style="width:70px;border-right:#fff solid 2px;background-color:#c6d5ec;text-align:center;vertical-align:middle;font-weight:bold;">Work Est (hrs)</td>
                <td style="width:140px;border-right:#fff solid 2px;background-color:#c6d5ec;text-align:center;vertical-align:middle;font-weight:bold;">Estimate By</td>
                <td style="width:350px;background-color:#c6d5ec;text-align:center;vertical-align:middle;font-weight:bold;">Actions</td>
                <td style="width:18px;background-color:#c6d5ec;"></td>
            </tr>
        </table>
    </div>
    <div style="text-align:left;width:100%;height:220px;overflow-y:scroll;background-color:#eee;" align="center">
        <table style="width:100%" cellpadding="0" cellspacing="0" border="0">
            <g:form name="reprioritize" url="[controller:'backlog']">
            <g:each var="productBacklogItem" in="${productBacklogItems}">
                <g:set var="totalWorkEstimate" value="${totalWorkEstimate+=productBacklogItem?.backlogItem?.workEstimate}"/>
                <tr style="font-size:13px;height:24px">
                    <td style="width:60px;border-right:#fff solid 2px;border-bottom:#fff solid 2px;background-color:#eee;text-align:center;vertical-align:middle;">${productBacklogItem?.priorityIndex}</td>
                    <td style="width:50px;border-right:#fff solid 2px;border-bottom:#fff solid 2px;background-color:#eee;text-align:center;vertical-align:middle;">${productBacklogItem?.backlogItem?.id}</td>
                    <td style="border-right:#fff solid 2px;border-bottom:#fff solid 2px;background-color:#eee;text-align:left;vertical-align:middle;padding-left:5px">${productBacklogItem?.backlogItem?.title}</td>
                    <td style="width:70px;border-right:#fff solid 2px;border-bottom:#fff solid 2px;background-color:#eee;text-align:center;vertical-align:middle;">${productBacklogItem?.backlogItem?.workEstimate}</td>
                    <td style="width:140px;border-right:#fff solid 2px;border-bottom:#fff solid 2px;background-color:#eee;text-align:center;vertical-align:middle;">${
                        ((productBacklogItem?.backlogItem?.estimatedBy&&productBacklogItem?.backlogItem?.estimatedBy?.trim().length()>0)?productBacklogItem?.backlogItem?.estimatedBy:'&nbsp;')}</td>
                    <td style="width:351px;border-bottom:#fff solid 2px;background-color:#eee;text-align:center;vertical-align:middle;">
                        <table cellpadding="0" cellspacing="0" style="font-size:13px" align="center">
                            <tr>
                                <td style="padding-right:5px;">
                                    <table cellpadding="0" cellspacing="0" style="font-size:10px;color:#777">
                                        <tr><td style="text-align:center">Adjust</td></tr>
                                        <tr><td style="text-align:center">Priority</td></tr>
                                    </table>
                                </td>
                                <td style="padding-right:3px"><img id="up${productBacklogItem?.priorityIndex}" src="${createLinkTo(dir: 'images/menu', file: 'arrow_up.png')}"  alt="up" onmouseover="onMouseOverImg(up${productBacklogItem?.priorityIndex})" onmouseout="onMouseOutImg('up${productBacklogItem?.priorityIndex}')" onclick="changeURL('${createLink(controller: 'backlog',action:'move',params:[from:productBacklogItem?.priorityIndex,to:productBacklogItem?.priorityIndex - 1])}')"/></td>
                                <td style="padding-right:5px"><img id="down${productBacklogItem?.priorityIndex}" src="${createLinkTo(dir: 'images/menu', file: 'arrow_down.png')}" alt="down" onmouseover="onMouseOverImg('down${productBacklogItem?.priorityIndex}')" onmouseout="onMouseOutImg('down${productBacklogItem?.priorityIndex}')" onclick="changeURL('${createLink(controller: 'backlog',action:'move',params:[from:productBacklogItem?.priorityIndex,to:productBacklogItem?.priorityIndex + 1])}')"/></td>
                                <g:form id="prioritySet${productBacklogItem?.priorityIndex}"><td style="padding-right:3px"><input style="font-size:10px;width:30px;text-align:center;" type="text" name="to" value="" maxlength="4" size="4"/></td>
                                <td style="padding-right:20px"><g:hiddenField name="from" value="${productBacklogItem?.priorityIndex}"/><g:actionSubmit style="font-size:10px;vertical-align:middle;width:30px" value="set" action="move"/></td></g:form>
                                <td style="padding-right:20px">|</td>
                                <td style="padding-right:10px"><a href="${createLink(controller: 'backlog', action: 'edit', id: productBacklogItem?.backlogItem?.id)}">Edit</a></td>
                                <td><a href="${createLink(controller: 'backlog', action: 'delete', id: productBacklogItem?.id)}">Delete</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </g:each>
            </g:form>
        </table>
    </div>
    <div style="width:100%;background-color:#c6d5ec;border-top:#fff solid 2px;">
        <table style="width:100%" cellpadding="0" cellspacing="0">
            <tr style="font-size:12px;height:20px;">
                <td style="width:60px;border-right:#fff solid 2px;background-color:#c6d5ec;text-align:center;vertical-align:middle;font-weight:bold;"></td>
                <td style="width:50px;border-right:#fff solid 2px;background-color:#c6d5ec;text-align:center;vertical-align:middle;font-weight:bold;"></td>
                <td style="padding-right:4px;border-right:#fff solid 2px;background-color:#c6d5ec;text-align:right;vertical-align:middle;font-weight:bold;">Total Work Estimate (hrs)</td>
                <td style="width:70px;border-right:#fff solid 2px;background-color:#c6d5ec;text-align:center;vertical-align:middle;font-weight:bold;">${totalWorkEstimate}</td>
                <td style="width:140px;border-right:#fff solid 2px;background-color:#c6d5ec;text-align:center;vertical-align:middle;font-weight:bold;"></td>
                <td style="width:350px;background-color:#c6d5ec;text-align:center;vertical-align:middle;font-weight:bold;"></td>
                <td style="width:18px;background-color:#c6d5ec;"></td>
            </tr>
        </table>
    </div>
</div>
