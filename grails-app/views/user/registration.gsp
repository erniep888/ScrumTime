<html>
<head>
    <title><g:message code="scrumtime.title.registration"/></title>
    <meta name="layout" content="simpleMenu"/>
</head>
<body>
<g:hasErrors>
    <div class="errors">
        <g:renderErrors bean="${systemUser}" field="username" as="list"/>
        <g:renderErrors bean="${systemUser}" field="retypedUsername" as="list"/>
        <g:renderErrors bean="${systemUser}" field="nickName" as="list"/>
        <g:renderErrors bean="${systemUserCredential}" field="password" as="list"/>
        <g:renderErrors bean="${systemUserCredential}" field="retypedPassword" as="list"/>        
        <g:renderErrors bean="${userInformation}" field="captchaResponse" as="list"/>
        <g:renderErrors bean="${userInformation}" field="acceptedUserAgreement" as="list"/>
    </div>
</g:hasErrors>
<g:form action="register" method="post">
    <div class="registrationDiv height460">
        <table class="registrationTable" cellpadding="6" cellspacing="5" border="0">
            <tr>
                <td class="registrationTitle" colspan="2"><g:message code="registration.page.title"/></td>
            </tr>
            <tr>
                <td class="alignRight">
                    <g:message code="registration.page.label.emailaddress"/>
                </td>
                <td class="alignLeft padLeft4 ${hasErrors(field: 'username', ' errors')}">
                    <input name='username' size="40" maxlength="120"
                        value="${systemUser?.username?.encodeAsHTML()}"/>
                </td>
            </tr>
            <tr>
                <td class="alignRight">
                    <g:message code="registration.page.label.retypeemailaddress"/>
                </td>
                <td class="alignLeft padLeft4 ${hasErrors(field: 'retypedUsername', ' errors')}">
                    <input name='retypedUsername' size="40" maxlength="120"
                        value="${systemUser?.retypedUsername?.encodeAsHTML()}"/>
                </td>
            </tr>
            <tr>
                <td class="alignRight">
                    <g:message code="registration.page.label.password"/>
                </td>
                <td class="alignLeft padLeft4 ${hasErrors(field: 'password', ' errors')}">
                    <input name='password' value="${systemUserCredential?.password}" type="password"/>
                </td>
            </tr>
            <tr>
                <td class="alignRight">
                    <g:message code="registration.page.label.retypepassword"/>
                </td>
                <td class="alignLeft padLeft4 ${hasErrors(field: 'retypedPassword', ' errors')}">
                    <input name='retypedPassword' value="${systemUserCredential?.retypedPassword}" type="password"/>
                </td>
            </tr>
            <tr>
                <td class="alignRight">
                    <g:message code="registration.page.label.nickname"/>
                </td>
                <td class="alignLeft padLeft4 ${hasErrors(field: 'nickName', ' errors')}">
                    <input name='nickName' value="${systemUser?.nickName?.encodeAsHTML()}"/>
                </td>
            </tr>
            <tr>
                <td class="alignRight">
                    <g:message code="registration.page.label.timezone"/>
                </td>
                <td class="alignLeft padLeft4">
                    <g:select name="timeZoneId" optionKey="timeZoneId"
                        optionValue="shortName" from="${timeZones}" value="${userInformation?.timeZoneId}"/>
                </td>
            </tr>
            <tr>
                <td class="alignRight">
                    <g:message code="registration.page.label.language"/>
                </td>
                <td class="alignLeft padLeft4">
                    <g:select name="languageTwoLetterISO639" optionKey="languageTwoLetterISO639"
                        optionValue="displayLanguage" from="${locales}" value="${userInformation?.languageTwoLetterISO639}"/>
                </td>
            </tr>
            <tr>
                <td class="alignRight">
                    <label for='captchaResponse'><g:message code="registration.page.label.enteraccesscode"/></label>
                </td>
                <td class="alignLeft padLeft4">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="padRight10 ${hasErrors(bean: userInformation, field: 'captchaResponse', 'errors')}">
                                <input type="text" name="captchaResponse" size="8"/>
                            </td>
                            <td>
                                <div class="jcaptchaBorder">
                                    <jcaptcha:jpeg name="imageCaptcha" height="30px" width="100px" align="absmiddle"/>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="alignCenter" colspan="2">
                    <g:checkBox name="acceptedUserAgreement" value="${false}"/>
                    <label for="acceptedUserAgreement" class="${hasErrors(bean: userInformation, field: 'acceptedUserAgreement', 'checkBoxError')}">
                        <span><g:message code="registration.page.label.termsandconditions"/></span></label>
                </td>
            </tr>
            <tr>
                <td class="alignCenter" id="registerButtonTd" colspan="2">
                    <input id="registerButton" type="submit" value="${message(code: 'registration.page.button.register')}"/>
                </td>
            </tr>
        </table>
    </div>
</g:form>
</body>
</html>