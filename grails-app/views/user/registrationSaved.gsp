<html>
<head>
    <title><g:message code="scrumtime.title.registration"/></title>
    <meta name="layout" content="simpleMenu"/>
</head>
<body>
<form action="${createLinkTo(file: 'index.gsp')}" method="get" name="registrationSaved" id="registrationSaved">
    <div class="registrationDiv height200">
        <table class="registrationTable" cellpadding="6" cellspacing="5" border="0">
            <tr>
                <td class="registrationTitle"><g:message code="registrationsaved.page.title"/></td>
            </tr>
            <tr>
                <td class="alignCenter">
                    <g:message code="registrationsaved.page.successmessage" args='[username]'/>
                </td>
            </tr>
            <tr>
                <td class="alignCenter padTop10">
                    <input class="width60" id="okButton" type="submit" value="${message(code: 'scrumtime.button.ok')}"/>
                </td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>