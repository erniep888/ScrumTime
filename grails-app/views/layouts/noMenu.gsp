<html>
<head>
    <title><g:layoutTitle default="Scrum Time"/></title>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'main.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'menu.css')}"/>
    <link rel="shortcut icon" href="${createLinkTo(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
    <g:layoutHead/>
    <g:javascript library="prototype"/>
</head>
<body style="margin-top:1px">
<table cellpadding="0" cellspacing="0" style="width:100%" border="0">
    <tr>
        <td>
            <div><img src="${createLinkTo(dir: 'images', file: 'approvedcontent_small.png')}" alt="Approved Content"/></div>
        </td>
        <td>
            <div style="font-family:arial;color:#999999;font-size:22px;text-align:right;"><g:message code="scrumtime.tagline"/></div>
        </td>
    </tr>
</table>
<g:layoutBody/>
<g:render template="/shared/footer"/>
</body>
</html>