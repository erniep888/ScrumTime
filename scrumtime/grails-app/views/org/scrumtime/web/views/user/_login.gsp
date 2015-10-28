<g:if test="${!hideLogin}">
<g:form name="loginForm" controller="userAuthentication" action="login">
    <table align="right" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <scrumtime:editfield fieldName="username"
                    labelValue="${message(code:'login.username')}"
                    labelClass="loginLabel"
                    fieldTdClass="loginTrEdit
                                  ${hasErrors(field:'username',' errors')}"
                    fieldClass="loginTextSize"
                    fieldSize="30"
                    fieldMaxLength="200"
                    fieldValue="${username?.name}"
                    useSemiColon="true"/>
        </tr>
        <tr>
            <scrumtime:editfield fieldName="password"
                    labelValue="${message(code:'login.password')}"
                    labelClass="loginLabel"
                    fieldTdClass="loginTrEdit
                                  ${hasErrors(field:'password',' errors')}"
                    fieldClass="loginTextSize"
                    fieldSize="30"
                    fieldMaxLength="200"
                    fieldValue="${password?.name}"
                    useSemiColon="true"
                    passwordType="true"/>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <table cellpadding="0" cellspacing="0">
                    <tr class="loginTextSize">
                        <td id="loginCheckbox"><input type="checkbox" checked="true" name="rememberMe"/></td>
                        <td id="loginCheckboxMessage">${message(code:'login.rememberme')}</td>
                        <td id="loginButtonTd"><input id="loginButton" type="submit"
                                value="${message(code:'login.loginbutton')}"/></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

</g:form>
</g:if>