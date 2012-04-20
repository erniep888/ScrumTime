<%--
  Created by IntelliJ IDEA.
  User: pascherk
  Date: 4/19/12
  Time: 12:40 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title></title>
</head>
<body>
<g:uploadForm name="myUpload" action="upload" controller="product">
    <g:hiddenField name="id" value="${id}" />
    <input name="contents" type="file"/>
    <input value="Submit" type="submit"/>
</g:uploadForm>

</body>
</html>