<table align="right" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <systemuser:ifNotLoggedIn>
            <td id="loginMaintenance">
                <g:if test="${!hideLogin}">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td id="registerAndForgotPasswordTd">
                            <g:link controller="registration">${message(code: 'login.register')}</g:link>
                            | ${message(code: 'login.forgotpassword')}
                        </td>
                    </tr>
                    <tr>
                        <td class="notLoggedInFlashMessage">
                            ${flash.message}
                        </td>
                    </tr>
                </table>
                </g:if>
            </td>
            <td class="loginStatus">
                <g:render template="/org/scrumtime/web/views/user/login"/>
            </td>
        </systemuser:ifNotLoggedIn>
        <systemuser:ifIsLoggedIn>
            <td>
                <g:render template="/org/scrumtime/web/views/user/loginStatus"/>
            </td>
        </systemuser:ifIsLoggedIn>
    </tr>
</table>