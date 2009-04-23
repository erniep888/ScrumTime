<html>
<head>
    <title><g:message code="scrumtime.title.registration"/></title>
    <meta name="layout" content="simpleMenu"/>
</head>
<body>
<g:form controller="home" action="index">
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
                    <g:submitButton class="width60" value="${message(code: 'scrumtime.button.ok')}" name="okButton"/>
                </td>
            </tr>
        </table>
    </div>
</g:form>
</body>
</html>