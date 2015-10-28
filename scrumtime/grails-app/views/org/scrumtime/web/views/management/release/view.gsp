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
    <div class="subWindow managementViewDiv">
        <div class="subWindowTitle">Releases</div>
        <div class="managementFilterDiv">
            <table border="0">
                <g:form name="filterReleaseForm" url="[controller:'release']">
                    <tr>
                        <scrumtime:editfield fieldName="filterName" labelValue="Name"
                                labelClass="editFieldSmall"
                                fieldTdClass="filterTrEdit
                                  ${hasErrors(field:'filterName',' errors')}"
                                fieldClass="editFieldSmall"
                                fieldSize="45"
                                fieldMaxLength="200"
                                fieldValue="${releaseViewSettings?.filterName}"
                                useSemiColon="true"/>
                        <td>&nbsp;&nbsp;&nbsp;</td>
                        <td class="editFieldSmall">
                            <label for="filterProductId">Product:</label>
                        </td>
                        <td valign="middle" class="editFieldSmall">
                            <g:select name="filterProductId" value="${releaseViewSettings?.filterProductId}"
                                    from="${availableProducts}" optionKey="id" optionValue="name"
                                    noSelection="${['-1':'-------------------']}" class="editFieldSmall"/>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <g:hiddenField name="filterSubmit" value="true"/>
                            <g:actionSubmit class="fontSize12" action="view" value="Filter"/>&nbsp;
                        </td>
                    </tr>
                </g:form>   <!-- There is a bug in ie 7 that prevents me from putting this after the table-->
            </table>
        </div>
        <div class="managementViewDivHeader fontSize10">
            <table class="width100Percent" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="viewHeader rightBorder width300">Name</td>
                    <td class="viewHeader rightBorder width250">Product</td>
                    <td class="viewHeader rightBorder width200">Sprints</td>
                    <td class="viewHeader">Actions&nbsp;&nbsp;&nbsp;&nbsp;</td>
                </tr>
            </table>
        </div>
        <div class="tableDataDiv managementViewData">
            <table class="width100Percent" cellpadding="0" cellspacing="0" border="0">
                <g:each var="release" in="${releases}">
                    <tr>
                        <td class="tableData width300">${release?.name}</td>
                        <td class="tableData width250">${release?.product?.name}</td>
                        <td class="tableData width200">${(release?.sprints)?release?.sprints?.size():0}</td>
                        <td class="fontSize11 horiAlignCenter">
                            &nbsp;<g:link controller="release" action="edit" id="${release?.id}">Edit</g:link>
                            &nbsp;&nbsp;&nbsp;<g:link controller="release" action="delete" id="${release?.id}">Delete</g:link>
                        </td>
                    </tr>
                </g:each>
            </table>
        </div>
    </div>
</center>
</body>
</html>