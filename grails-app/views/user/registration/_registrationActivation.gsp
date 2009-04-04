<tr>
    <td>
        <g:if test="${activationSuccess}">
            <div class="registrationSuccessMessage">
                <g:message code="registration.activation.success.message" args='[username]'/>
            </div>
        </g:if>
        <g:else>
            <div class="registrationActivationFailureMessage">
                <g:message code="registration.activation.failure.message" args='[username]'/>
            </div>
        </g:else>
    </td>
</tr>
<tr>
    <td id="continueButton">
        <g:form controller="home" action="index">
            <g:submitButton value="Continue" name="continue"/>
        </g:form>
    </td>
</tr>