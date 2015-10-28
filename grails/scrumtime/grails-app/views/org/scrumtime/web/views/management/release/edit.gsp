<html>
<head>
    <title>Scrum Time - Release Directory</title>
    <meta name="layout" content="main"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonSubWindow.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonTable.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonEdit.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'management.css')}"/>

</head>
<body>
<center>
    <div class="subWindow releaseEditWindow">
        <div class="subWindowTitle">Edit Release</div>
        <div class="managementEditDiv">
            <g:hasErrors>
                <div class="errors">
                    %{--<g:renderErrors bean="${selectedProduct}" as="list" />--}%
                    <g:renderErrors bean="${selectedRelease}" field="name" as="list"/>
                    <g:renderErrors bean="${selectedRelease}" field="description" as="list"/>
                    <g:renderErrors bean="${selectedRelease}" field="product" as="list"/>
                </div>
            </g:hasErrors>
            <g:form name="editReleaseForm" url="[controller:'release']">
                <table align="left" cellpadding="0" cellspacing="7" border="0" class="">
                    <tr>
                        <scrumtime:editfield fieldName="name" labelValue="Name"
                                labelClass="editLabel width180"
                                fieldTdClass="paddingRight40 ${hasErrors(bean:selectedRelease, field:'name',' errors')}"
                                fieldClass="editField"
                                fieldSize="50"
                                fieldValue="${selectedRelease.name}"
                                useSemiColon="true"
                                id="name"/>
                    </tr>
                    <tr>
                        <scrumtime:textareafield fieldName="description" labelValue="Description"
                                labelClass="editLabel"
                                fieldClass="editField ${hasErrors(bean:selectedRelease, field:'description',' errors')}"
                                fieldValue="${selectedRelease.description}"
                                useSemiColon="true"
                                id="description"/>
                    </tr>
                    <tr>
                        <td class="editLabel">Product:</td>
                        <td class="fontSize12 width300">${selectedRelease?.product?.name}</td>
                    </tr>
                    <tr>
                        <td class="editLabel"># of Sprints:</td>
                        <td class="fontSize12 width300">${(selectedRelease?.sprints)?selectedRelease?.sprints?.size():0}</td>
                    </tr>
                    <tr>
                        <td class="editLabel"><label for="expectedStartDate">Expected Start Date:</label></td>
                        <td class="fontSize12"><g:datePicker name="expectedStartDate" value="${selectedRelease?.expectedStartDate ? selectedRelease?.expectedStartDate : 'none'}" precision="day" years="${2008..2015}" noSelection="['':'-Choose-']"/></td>
                    </tr>
                    <tr>
                        <td class="editLabel"><label for="expectedCompletionDate">Expected Completion Date:</label></td>
                        <td class="fontSize12"><g:datePicker name="expectedCompletionDate" value="${selectedRelease?.expectedCompletionDate ? selectedRelease?.expectedCompletionDate : 'none'}" precision="day" years="${2008..2015}" noSelection="['':'-Choose-']"/></td>
                    </tr>
                    <tr>
                        <td class="editLabel"><label for="actualStartDate">Actual Start Date:</label></td>
                        <td class="fontSize12"><g:datePicker name="actualStartDate" value="${selectedRelease?.actualStartDate ? selectedRelease?.actualStartDate : 'none'}" precision="day" years="${2008..2015}" noSelection="['':'-Choose-']"/></td>
                    </tr>
                    <tr>
                        <td class="editLabel"><label for="actualCompletionDate">Actual Completion Date:</label></td>
                        <td class="fontSize12"><g:datePicker name="actualCompletionDate" value="${selectedRelease?.actualCompletionDate ? selectedRelease?.actualCompletionDate : 'none'}" precision="day" years="${2008..2015}" noSelection="['':'-Choose-']"/></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td class="paddingTop10">
                            <g:hiddenField name="submitted" value="true"/>
                            <g:hiddenField name="id" value="${selectedRelease?.id}"/>
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