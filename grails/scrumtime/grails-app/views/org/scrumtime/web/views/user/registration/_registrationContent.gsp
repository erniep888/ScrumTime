<tr>
    <td id="registrationContainingTd">    	
        <g:hasErrors>
                <div class="errors">
                    <g:renderErrors bean="${systemUser}" field="username" as="list"/>
                    <g:renderErrors bean="${systemUser}" field="retypedUsername" as="list"/>
                    <g:renderErrors bean="${systemUserCredential}" field="password" as="list"/>
                    <g:renderErrors bean="${systemUserCredential}" field="retypedPassword" as="list"/>
                    <g:renderErrors bean="${userInformation}" field="firstName" as="list"/>
                    <g:renderErrors bean="${userInformation}" field="nickName" as="list"/>
                    <g:renderErrors bean="${userInformation}" field="captchaResponse" as="list"/>
                </div>
        </g:hasErrors>
        <g:form action="index" method="post">
        <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <scrumtime:editfield fieldName="username" labelValue="Email Address"
                        labelClass="registrationLabels"
                        fieldTdClass="registrationTrEdit
                                  ${hasErrors(field:'username',' errors')}"
                        fieldClass="editTextSize"
                        fieldSize="30"
                        fieldMaxLength="200"
                        fieldValue="${systemUser?.username}"
                        useSemiColon="true"/>
                <td>
                    <span class="registrationInformation">
                        <g:message code="registration.emailaddress.required"/>
                    </span>
                </td>
            </tr>
            <tr valign="top" height="40px">
                <scrumtime:editfield fieldName="retypedUsername" labelValue="Verify Email Address"
                        labelClass="registrationLabels"
                        fieldTdClass="registrationTrEdit
                                  ${hasErrors(field:'retypedUsername',' errors')}"
                        fieldClass="editTextSize"
                        fieldSize="30"
                        fieldMaxLength="200"
                        fieldValue="${systemUser?.retypedUsername}"
                        useSemiColon="true"/>
                <td>
                    <span class="registrationInformation">
                        <g:message code="registration.emailaddress.required"/>
                    </span>
                </td>
            </tr>
            <tr>
                <scrumtime:editfield fieldName="password" labelValue="Password"
                        labelClass="registrationLabels"
                        fieldTdClass="registrationTrEdit
                                  ${hasErrors(field:'password',' errors')}"
                        fieldClass="editTextSize"
                        fieldSize="18"
                        fieldMaxLength="200"
                        fieldValue="${systemUserCredential?.password}"
                        useSemiColon="true"
                        passwordType="true"/>
                <td>
                    <span class="registrationInformation">
                        <g:message code="registration.password.required"/>
                    </span>
                </td>
            </tr>
            <tr valign="top" height="40px">
                <scrumtime:editfield fieldName="retypedPassword" labelValue="Verify Password"
                        labelClass="registrationLabels"
                        fieldTdClass="registrationTrEdit
                                  ${hasErrors(field:'retypedPassword',' errors')}"
                        fieldClass="editTextSize"
                        fieldSize="18"
                        fieldMaxLength="200"
                        fieldValue="${systemUserCredential?.retypedPassword}"
                        useSemiColon="true"
                        passwordType="true"/>
                <td>
                    <span class="registrationInformation">
                        <g:message code="registration.password.required"/>
                    </span>
                </td>
            </tr>
            <tr>
                <scrumtime:editfield fieldName="firstName" labelValue="First Name"
                        labelClass="registrationLabels middleLabel"
                        fieldTdClass="registrationTrEdit
                                  ${hasErrors(field:'firstName',' errors')}"
                        fieldClass="editTextSize"
                        fieldSize="18"
                        fieldMaxLength="200"
                        fieldValue="${userInformation?.firstName}"
                        useSemiColon="true"/>
                <td>
                    <span class="registrationInformation">
                        <g:message code="registration.firstname.required"/>
                    </span>
                </td>
            </tr>
            <tr>
                <scrumtime:editfield fieldName="lastName" labelValue="Last Name"
                        labelClass="registrationLabels middleLabel"
                        fieldTdClass="registrationTrEdit
                                  ${hasErrors(field:'lastName',' errors')}"
                        fieldClass="editTextSize"
                        fieldSize="18"
                        fieldMaxLength="200"
                        fieldValue="${userInformation?.lastName}"
                        useSemiColon="true"/>
                <td></td>
            </tr>
            <tr>
                <scrumtime:editfield fieldName="nickName" labelValue="Public Nick Name"
                        labelClass="registrationLabels middleLabel"
                        fieldTdClass="registrationTrEdit
                                  ${hasErrors(field:'nickName',' errors')}"
                        fieldClass="editTextSize"
                        fieldSize="18"
                        fieldMaxLength="200"
                        fieldValue="${userInformation?.nickName}"
                        useSemiColon="true"/>
                <td>
                    <span class="registrationInformation">
                        <g:message code="registration.publicname.info"/>
                    </span>
                </td>
            </tr>
            <tr>
                <td class="registrationLabels middleLabel">
                    <label for="selectedLanguage">Language:</label>
                </td>
                <td valign="top" class="registrationTrEdit">
                    <g:select name="selectedLanguage" optionKey="id"
                            optionValue="displayLanguage" from="${languages}" value="${selectedLanguage?.encodeAsHTML()}"/>
                </td>
                <td></td>
            </tr>

            <tr>
                <td class="registrationLabels middleLabel">
                    <label for="selectedTimeZone">Time Zone:</label>
                </td>
                <td class="registrationTrEdit">
                    <g:select name="selectedTimeZone" optionKey="id"
                            optionValue="shortForm" from="${timeZones}" value="${selectedTimeZone?.encodeAsHTML()}"/>
                </td>
                <td></td>
            </tr>

            <tr class='register'>
                <td class='registrationLabels middleLabel'>
                    <label for='captchaResponse'>Enter Access Code:</label>
                </td>
                <td class="registrationTrEdit ${hasErrors(bean: userInformation, field: 'captchaResponse', 'errors')}">
                    <input type="text" name="captchaResponse" size="8"/>
                    <jcaptcha:jpeg name="imageCaptcha" height="30px" width="100px" align="absmiddle"/>
                </td>
                <td>

                </td>
            </tr>
            
            <tr>
                <td id="registerButtonTd">
                    <input id="registerButton" type="submit" value="Register"/>
                </td>
                <td></td>
            </tr>
        </table>
        </g:form>       
    </td>
</tr>