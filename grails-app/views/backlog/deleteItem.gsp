<html>
<head>
    <title><g:message code="scrumtime.title"/></title>
    <meta name="layout" content="backlogProduct"/>
</head>
<body>
<div style="margin-top:8px;padding-bottom:16px;width:100%;text-align:left;border:#999 solid 1px;">
    <div style="text-align:left;border-bottom:#999 solid 1px;background-color:#c6d5ec;">
        <span style="padding-left:6px;color:crimson">Delete Item - <span style="color:blue">Product Backlog</span></span>
    </div>
    <table style="margin-left:40px;margin-top:20px;width:350px" cellpadding="0" cellspacing="0" border="0">
        <g:form controller="backlog">
            <tr>
                <td colspan="2" style="font-size:16px;color:crimson">Are you sure you want to delete this backlog item?</td>
            </tr>
            <tr>
                <td colspan="2" style="font-size:14px;text-align:center">"${productBacklogItem?.backlogItem?.title}"</td>
            </tr>
            <tr>
                <td style="text-align:right;padding-top:16px;width:270px"><g:hiddenField name="id" value="${productBacklogItem?.id}"/><g:hiddenField name="deletePressed" value="true"/><g:actionSubmit value="Delete" action="delete" style="width:60px"/></td>
                <td style="text-align:right;padding-top:16px;"><g:actionSubmit value="Cancel" action="index" style="width:60px"/></td>
            </tr>
        </g:form>
    </table>
</div>
</body>
</html>

            