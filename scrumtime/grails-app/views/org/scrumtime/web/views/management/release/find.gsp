<html>
<head>
  <title>Scrum Time - Release Directory</title>
  <meta name="layout" content="main" />
  <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonSubWindow.css')}"/>
  <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonTable.css')}"/>
  <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonEdit.css')}"/>
  <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'management.css')}"/>

</head>
<body>
<center>
<g:form name="searchForm" url="[controller:'release']">
<div class="subWindow findManagementWindow">
<div class="subWindowTitle">Find Releases</div>
<div class="paddingTop10"></div> <!-- cross browser vertical spacer -->
<table cellpadding="0" cellspacing="0" border="0">
<tr>
  <scrumtime:editfield fieldName="nameSearchField" labelValue="Name"
                       labelClass="editLabel"
                       fieldTdClass="${hasErrors(field:'nameSearchField',' errors')} paddingRight40"
                       fieldClass="editField width180"
                       fieldValue="${nameSearchField}"
                       useSemiColon="true"
                       id="nameSearchField"/>
</tr>
<tr>
  <td colspan="8" class="findButtonTd">
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
  <td class="tableHeader width130">Name</td>
  <td class="tableHeader width250">Product</td>
  <td class="tableHeader width200">Sprints&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  </table>
  <div class="tableDataDiv subSearchResultsDataHeight">
    <table class="width100Percent" cellpadding="0" cellspacing="0">
      <g:each var="release" in="${releases}">
      <tr>
        <td class="tableData width130">
            <a href="${createLink(controller:'release', action:'view', id:release?.id)}">
                ${release?.name}</a></td>
        <td class="tableData width250">${release?.product?.name}</td>
        <td class="tableData width200">${release?.sprints?.size()}</td>
      </tr>
      </g:each>
    </table>
  </div>
</div>
</center>
</body>
</html>