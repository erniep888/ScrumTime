<html>
<head>
    <title>Scrum Time - Site Member Directory</title>
    <meta name="layout" content="main"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonSubWindow.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonTable.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonEdit.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'management.css')}"/>

</head>
<body>
<center>
    <g:form name="searchForm" url="[controller:'siteMember']">
        <div class="subWindow findManagementWindow">
            <div class="subWindowTitle">Find Site Members</div>
            <div class="paddingTop10"></div> <!-- cross browser vertical spacer -->
            <table cellpadding="0" cellspacing="0" border="0">
                <tr>

                    <scrumtime:editfield fieldName="nickNameSearchField" labelValue="Nick Name"
                            labelClass="editLabel"
                            fieldTdClass="${hasErrors(field:'nickNameSearchField',' errors')}"
                            fieldClass="editField"
                            fieldValue="${nickNameSearchField}"
                            useSemiColon="true"
                            id="nickNameSearchField"/>
                    <scrumtime:editfield fieldName="firstNameSearchField" labelValue="First Name"
                            labelClass="editLabel paddingLeft10"
                            fieldTdClass="${hasErrors(bean:selectedOrganization, field:'firstNameSearchField',' errors')}"
                            fieldClass="editField"
                            fieldValue="${firstNameSearchField}"
                            useSemiColon="true"
                            id="firstNameSearchField"/>

                    <scrumtime:editfield fieldName="lastNameSearchField" labelValue="Last Name"
                            labelClass="editLabel paddingLeft10"
                            fieldTdClass="${hasErrors(bean:selectedOrganization, field:'lastNameSearchField',' errors')}"
                            fieldClass="editField"
                            fieldValue="${lastNameSearchField}"
                            useSemiColon="true"
                            id="lastNameSearchField"/>
                    <scrumtime:editfield fieldName="emailSearchField" labelValue="Email"
                            labelClass="editLabel paddingLeft10"
                            fieldTdClass="${hasErrors(bean:selectedOrganization, field:'emailSearchField',' errors')}"
                            fieldClass="editField width180"
                            fieldValue="${emailSearchField}"
                            useSemiColon="true"
                            id="emailSearchField"/>
                </tr>
                <tr>
                    <td colspan="8" class="findButtonTd">
                        <g:if test="${memberview == 'add'}">
                            <g:hiddenField name="findSiteMembers" value="true"/>
                        </g:if>
                        <g:actionSubmit class="fontSize12 width60" action="find" value="Find"/>&nbsp;
                        <g:actionSubmit class="fontSize12 width60" action="findAll" value="Find All"/>

                    </td>
                </tr>

            </table>
        </div>
    </g:form>   <!-- There is a bug in ie 7 that prevents me from putting this after the table-->

    <div class="subWindow searchResultsManagementWindow">
        <div class="subWindowTitle">Search Results</div>
        <table class="width100Percent" cellpadding="0" cellspacing="0">
            <tr>
                <td class="tableHeader width130">Nick Name</td>
                <td class="tableHeader width200">Full Name</td>
                <td class="tableHeader width75">Organizations</td>
                <td class="tableHeader width130">Site Role&nbsp;&nbsp;&nbsp;&nbsp;</td>
            </tr>
        </table>
        <div class="tableDataDiv subSearchResultsDataHeight">
            <table class="width100Percent" cellpadding="0" cellspacing="0">
                <g:each var="siteMemberSummary" in="${siteMemberSummaries}">
                    <tr>
                        <g:if test="${(siteMemberSummary?.userInformation?.visibilityType.name.contains('Not listed')) &&
                                   !session.userIdentity.authorizationDefinition.toString().contains('SITE OWNER')}">
                            <td class="tableData width130">${siteMemberSummary?.userInformation?.nickName}</td>
                            <td class="tableData width200">PRIVATE</td>
                        </g:if>
                        <g:else>
                            <td class="tableData width130">
                                <a href="${createLink(controller: 'siteMember', action: 'view', id: siteMemberSummary?.userInformation.id)}">
                                    ${siteMemberSummary?.userInformation?.nickName}</a></td>
                            <td class="tableData width200">${siteMemberSummary?.userInformation?.firstName} ${siteMemberSummary?.userInformation?.lastName}</td>
                        </g:else>
                        <td class="tableData width75">${siteMemberSummary.organizationCount}</td>
                        <td class="tableData width130">${siteMemberSummary.currentRoles}</td>
                    </tr>
                </g:each>
            </table>
        </div>
    </div>
</center>
</body>
</html>