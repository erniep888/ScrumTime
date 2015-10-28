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
        <div class="subWindowTitle">Edit Product</div>
        <div class="managementEditDiv">
            <g:hasErrors>
                <div class="errors">
                    %{--<g:renderErrors bean="${selectedProduct}" as="list" />--}%
                    <g:renderErrors bean="${selectedProduct}" field="name" as="list"/>
                    <g:renderErrors bean="${selectedProduct}" field="description" as="list"/>
                    <g:renderErrors bean="${selectedProduct}" field="organization" as="list"/>
                </div>
            </g:hasErrors>
            <g:form name="editProductForm" url="[controller:'product']">
                <table align="left" cellpadding="0" cellspacing="7" border="0" class="">
                    <tr>
                        <scrumtime:editfield fieldName="name" labelValue="Name"
                                labelClass="editLabel width110"
                                fieldTdClass="paddingRight40 ${hasErrors(bean:selectedProduct, field:'name',' errors')}"
                                fieldClass="editField"
                                fieldSize="50"
                                fieldValue="${selectedProduct.name}"
                                useSemiColon="true"
                                id="name"/>
                    </tr>
                    <tr>
                        <scrumtime:textareafield fieldName="description" labelValue="Description"
                                labelClass="editLabel"
                                fieldClass="editField ${hasErrors(bean:selectedProduct, field:'description',' errors')}"
                                fieldValue="${selectedProduct.description}"
                                useSemiColon="true"
                                id="description"/>
                    </tr>
                    <tr>
                        <td class="editLabel">Organization:</td>
                        <td class="fontSize12 width300">${selectedProduct?.organization?.name}</td>
                    </tr>
                    <tr>
                        <td class="editLabel"># of Releases:</td>
                        <td class="fontSize12 width300">${(selectedProduct?.releases)?selectedProduct?.releases?.size():0}</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="paddingTop10">
                            <g:hiddenField name="submitted" value="true"/>
                            <g:hiddenField name="id" value="${selectedProduct?.id}"/>
                            <g:actionSubmit class="fontSize12 width80" action="edit" value="Save"/>&nbsp;
                            <g:actionSubmit class="fontSize12 width80" action="view" value="Cancel"/>
                        </td>
                    </tr>
                </table>
            </g:form>   <!-- There is a bug in ie 7 that prevents me from putting this after the table-->
        </div>
    </div>

</center>
</body>
</html>