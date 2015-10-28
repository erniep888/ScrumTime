<html>
<head>
    <title>Scrum Time - Product Directory</title>
    <meta name="layout" content="main"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonSubWindow.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonTable.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonEdit.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'management.css')}"/>

</head>
<body>
<center>
    <div class="subWindow viewWindow">
        <div class="subWindowTitle">View Product</div>
        <table cellpadding="0" cellspacing="0" border="1" class="paddingTop5">
            <tr>
                <td class="fontSize12 width130">Name</td>
                <td class="fontSize12 width300">${selectedProduct.name}</td>
            </tr>
            <tr>
                <td class="fontSize12 width130">Description</td>
                <td class="fontSize12 width300">${selectedProduct?.description}</td>
            </tr>
            <tr>
                <td class="fontSize12 width130">Organization</td>
                <td class="fontSize12 width300">${selectedProduct?.organization?.name}</td>
            </tr>
            <tr>
                <td class="fontSize12 width130">Releases</td>
                <td class="fontSize12 width300">${selectedProduct?.releases?.size()}</td>
            </tr>
            <tr>
                <td colspan="2" class="findButtonTd">
                    <g:hiddenField name="productId" value="${selectedProduct.id}"/>
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