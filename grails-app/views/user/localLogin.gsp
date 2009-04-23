<html>
<head>
    <title><g:message code="scrumtime.title.login"/></title>
    <meta name="layout" content="simpleMenu"/>
</head>
<body>
<g:hasErrors>
    <div class="errors">
        ${flash.message}
    </div>
</g:hasErrors>
<g:form controller="userAuthentication" action="login" method="post">
    <div class="localLoginDiv height360">
        <table class="localLoginTable" cellpadding="6" cellspacing="5" border="0">
            <tr>
                <td class="registrationTitle" colspan="2"><g:message code="locallogin.page.title"/></td>
            </tr>
            <tr>
                <td class="alignRight">
                    <g:message code="locallogin.page.label.emailaddress"/>
                </td>
                <td class="alignLeft padLeft4 padRight50 ${hasErrors(field: 'username', ' errors')}">
                    <input name='username' maxlength="120"
                        value="${systemUser?.username?.encodeAsHTML()}" class="width250"/>
                </td>
            </tr>
            <tr>
                <td class="alignRight">
                    <g:message code="locallogin.page.label.password"/>
                </td>
                <td class="alignLeft padLeft4 padRight50 ${hasErrors(field: 'password', ' errors')}">
                    <input name='password' maxlength="120"
                        value="${systemUserCredential?.password}" type="password" class="width250"/>
                </td>
            </tr>
            <tr>
                <td colspan="2"><center>
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td class="alignLeft"><input type="checkbox" checked="true" name="rememberMe"/></td>
                            <td class="font12">${message(code: 'locallogin.page.label.rememberme')}</td>
                        </tr>
                    </table>
                </center>
                </td>
            </tr>
            <tr>
                <td class="alignCenter" id="registerButtonTd" colspan="2">
                    <g:submitButton class="width80" value="${message(code: 'scrumtime.mainmenu.login')}" name="loginButton"/>
                </td>
            </tr>
            <tr>
                <td class="alignCenter" colspan="2">
                    <a href="${createLink(controller:'home', action:'index')}"><g:message code="locallogin.page.label.resetpassword"/></a>
                </td>
            </tr>
        </table>
    </div>
</g:form>
</body>
</html>