<html>
<head>
    <title><g:message code="scrumtime.title"/></title>
    <meta name="layout" content="managementProduct"/>
</head>
<body>
<g:render template="/product/list"/>
<div style="margin-top:8px;width:100%;text-align:left;height:200px;border:#999 solid 1px;">
    <div style="text-align:left;border-bottom:#999 solid 1px;background-color:#c6d5ec;">
        <span style="padding-left:6px">Members - </span><span style="color:blue;font-style:italic;font-size:14px;letter-spacing:1px;">${selectedProduct?.name?.encodeAsHTML()}</span>
    </div>
    <g:render template="/menu/managementProductMembersMenu"/>
    <table style="margin-left:40px;margin-top:46px" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td colspan="2" style="font-size:14px;">The product creator is:</td>
            <td style="text-align:right;padding-left:10px;font-size:16px;color:blue;">${selectedProduct?.creator?.nickName}</td>
        </tr>
    </table>
</div>
</body>
</html>

            