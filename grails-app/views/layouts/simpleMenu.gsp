<html>
<head>
    <title><g:layoutTitle default="Scrum Time"/></title>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'main.css')}"/>
    <link rel="shortcut icon" href="${createLinkTo(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
    <g:layoutHead/>
    <g:javascript library="application"/>
</head>
<body style="margin-top:1px">
<table cellpadding="0" cellspacing="0" style="width:100%;border-bottom:#999999 solid 2px;padding-bottom:5px;" border="0">
    <tr>
        <td>
            <div><img src="${createLinkTo(dir: 'images', file: 'scrumtime_logo.jpg')}" alt="Scrum Time"/></div>
        </td>
        <td>
            <div style="font-family:arial;color:#999999;font-size:22px;text-align:right;padding-right:4px"><g:message code="scrumtime.tagline"/></div>
        </td>
    </tr>
</table>
<div style="height:30px;">
    <table style="width:100%;text-align:left;font-family:arial;font-size:16px;" border="0">
        <tr>
            <td><a href="${createLink(controller:'home', action:'index')}"><g:message code="registration.page.homelink"/></a></td>
        </tr>
    </table>
</div>

<g:layoutBody/>
<g:render template="/shared/footer"/>
</body>
</html>