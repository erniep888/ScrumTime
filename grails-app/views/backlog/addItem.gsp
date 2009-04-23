<html>
<head>
    <title><g:message code="scrumtime.title"/></title>
    <meta name="layout" content="backlogProduct"/>
</head>
<body>
<div style="margin-top:8px;padding-bottom:16px;width:100%;text-align:left;border:#999 solid 1px;">
    <div style="text-align:left;border-bottom:#999 solid 1px;background-color:#c6d5ec;">
        <span style="padding-left:6px">Add Item - <span style="color:blue">Product Backlog</span></span>
    </div>
    <g:hasErrors bean="${productBacklogItem?.backlogItem}">
        <div class="errors">
            <g:renderErrors bean="${productBacklogItem?.backlogItem}" field="title" as="list"/>
            <g:renderErrors bean="${productBacklogItem?.backlogItem}" field="description" as="list"/>
            <g:renderErrors bean="${productBacklogItem?.backlogItem}" field="workEstimate" as="list"/>
            <g:renderErrors bean="${productBacklogItem?.backlogItem}" field="estimatedBy" as="list"/>
        </div>
    </g:hasErrors>
    <table style="margin-left:40px;margin-top:20px" cellpadding="0" cellspacing="0" border="0">
        <g:form controller="backlog">
            <tr>
                <td colspan="2" style="font-size:12px">Title</td>
            </tr>
            <tr>
                <td colspan="2"><input name='title' maxlength="256"
                    style="width:500px;color:#333;"
                    value="${productBacklogItem?.backlogItem?.title?.encodeAsHTML()}"/></td>
            </tr>
            <tr>
                <td colspan="2" style="vertical-align:top;width:100px;font-size:12px;padding-top:8px">Description</td>
            </tr>
            <tr>
                <td colspan="2"><textarea  name='description' cols="30" rows="5"
                    style="width:500px;height:50px;font-family:arial;font-size:13px">${productBacklogItem?.backlogItem?.description?.encodeAsHTML()}</textarea></td>
            </tr>
            <tr>
                <td colspan="2" style="vertical-align:top;width:100px;font-size:12px;padding-top:8px">Work Estimate (hours)</td>
            </tr>
            <tr>
                <td colspan="2"><input style="font-size:13px;width:30px;text-align:center;" type="text" name="workEstimate" value="${productBacklogItem?.backlogItem?.workEstimate}" maxlength="4" size="4"/></td>
            </tr>
            <tr>
                <td colspan="2" style="vertical-align:top;width:100px;font-size:12px;padding-top:8px">Estimate By</td>
            </tr>
            <tr>
                <td colspan="2"><g:select style="font-size:12px" name="estimatedBy" value="${productBacklogItem?.backlogItem?.estimatedBy?.encodeAsHTML()}"
                            from="${users}" optionKey="nickName" optionValue="nickName"
                            noSelection="['-1':'----------------------']"/></td>
            </tr>
            <tr>
                <td style="text-align:right;padding-top:6px;padding-right:16px;width:425px"><g:hiddenField name="savePressed" value="true"/><g:actionSubmit value="Save" action="addItem" style="width:60px"/></td>
                <td style="text-align:right;padding-top:6px;"><g:actionSubmit value="Cancel" action="index" style="width:60px"/></td>
            </tr>
        </g:form>
    </table>
</div>
</body>
</html>

            