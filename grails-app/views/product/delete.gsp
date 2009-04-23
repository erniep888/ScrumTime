<html>
<head>
    <title><g:message code="scrumtime.title"/></title>
    <meta name="layout" content="managementProduct"/>
</head>
<body>
<g:render template="/product/list"/>
<div style="margin-top:8px;width:100%;text-align:left;height:200px;border:#999 solid 1px;">
    <div style="text-align:left;border-bottom:#999 solid 1px;background-color:#c6d5ec;">
        <span style="padding-left:6px;color:crimson">Delete - </span><span style="color:blue;font-style:italic;font-size:14px;letter-spacing:1px;">${selectedProduct?.name?.encodeAsHTML()}</span>
    </div>
    <table style="margin-left:40px;margin-top:60px" cellpadding="0" cellspacing="0" border="0">
        <g:form controller="product">
            <tr>
                <td colspan="2" style="font-size:16px;color:crimson">Are you sure you want to delete this product?</td>
            </tr>
            <tr>
                <td style="text-align:right;padding-top:16px;padding-right:10px;width:230px;"><g:hiddenField name="id" value="${selectedProduct?.id}"/><g:hiddenField name="deletePressed" value="true"/><g:actionSubmit value="Delete" action="delete" style="width:60px"/></td>
                <td style="text-align:right;padding-top:16px;"><g:actionSubmit value="Cancel" action="index" style="width:60px"/></td>
            </tr>
        </g:form>
    </table>
</div>
</body>
</html>
            