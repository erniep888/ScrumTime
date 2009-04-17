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
                <g:if test="${activationSuccess}">
                    <td class="registrationTitle"><g:message code="registrationactivated.page.successtitle"/></td>
                </g:if>
                <g:else>
                    <td class="registrationTitle"><g:message code="registrationactivated.page.failuretitle"/></td>
                </g:else>
            </tr>
            <tr>
                <g:if test="${activationSuccess}">
                    <td class="alignCenter">
                        <g:message code="registrationactivated.success.message" args='[username]'/>
                    </td>
                </g:if>
                <g:else>
                    <td class="alignCenter">
                        <g:message code="registrationactivated.failure.message" args='[username]'/>
                    </td>
                </g:else>
            </tr>
            <tr>
                <td class="alignCenter padTop10">
                    <input class="width80" id="continueButton" type="submit" value="${message(code: 'scrumtime.button.continue')}"/>
                </td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>