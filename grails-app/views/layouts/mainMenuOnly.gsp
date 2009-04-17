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
        <td style="height:20px">
            <div><img src="${createLinkTo(dir: 'images', file: 'scrumtime_logo.jpg')}" alt="Scrum Time"/></div>
        </td>
        <td>
            <div style="font-family:arial;color:#999999;font-size:20px;text-align:right;padding-right:4px"><g:message code="scrumtime.tagline"/></div>
            <table class="loginTable" border="0">
                <systemuser:ifNotLoggedIn>
                    <tr>
                        <td><g:link controller="registration"><g:message code="scrumtime.mainmenu.register"/></g:link></td>
                        <td class="width18">|</td>
                        <td class="width56"><g:link controller="userAuthentication"><g:message code="scrumtime.mainmenu.login"/></g:link></td>
                    </tr>
                </systemuser:ifNotLoggedIn>
                <systemuser:ifIsLoggedIn>
                    <tr>
                        <td><g:message code="scrumtime.salutation"/> ${session?.authenticationToken.nickName}</td>
                        <td class="width18">|</td>
                        <td class="width56"><g:link controller="userAuthentication" action="logout"><g:message code="scrumtime.mainmenu.logout"/></g:link></td>
                    </tr>
                </systemuser:ifIsLoggedIn>
            </table>
        </td>
    </tr>
</table>
<g:render template="/menu/mainMenu"/>
<g:layoutBody/>
<g:render template="/shared/footer"/>
</body>
</html>