<html>
<head>
  <title>Scrum Time - Product Directory</title>
  <meta name="layout" content="main" />
  <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonSubWindow.css')}"/>
  <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonTable.css')}"/>
  <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonEdit.css')}"/>
  <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'management.css')}"/>

</head>
<body>
<center>
<g:form name="searchForm" url="[controller:'product']">
<div class="subWindow findManagementWindow">
<div class="subWindowTitle">Find Products</div>
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
  <td class="tableHeader width250">Organization</td>
  <td class="tableHeader width200">Releases&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  </table>
  <div class="tableDataDiv subSearchResultsDataHeight">
    <table class="width100Percent" cellpadding="0" cellspacing="0">
      <g:each var="product" in="${products}">
      <tr>
        <td class="tableData width130">
            <a href="${createLink(controller:'product', action:'view', id:product?.id)}">
                ${product?.name}</a></td>
        <td class="tableData width250">${product?.organization?.name}</td>
        <td class="tableData width200">${product?.releases?.size()}</td>
      </tr>
      </g:each>
    </table>
  </div>
</div>
</center>
</body>
</html>