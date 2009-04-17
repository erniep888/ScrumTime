<g:hasErrors bean="${organization}">
    <div class="errors">
        <g:eachError><p>${it.defaultMessage}</p></g:eachError>
        
        %{--<g:renderErrors bean="${organization}" field="name" as="list"/>--}%
        %{--<g:renderErrors bean="${organization}" field="description" as="list"/>--}%
    </div>
</g:hasErrors>
<div style="padding-left:20px;padding-top:16px;">
    <table>
        <g:form controller="organizationGeneral" action="save" method="post"><!-- placed here because of IE bug -->
            <tr>
                <td>
                    Name:
                </td>
                <td>
                    <input name='name' maxlength="120" tabindex="2"
                        style="width:300px;color:#333;"
                        value="${organization?.name?.encodeAsHTML()}"/>
                </td>
            </tr>
            <tr>
                <td style="vertical-align:top;">
                    Description:
                </td>
                <td>
                    <textarea tabindex="10" name='description' cols="30" rows="5"
                        style="width:300px;height:110px;font-family:arial;font-size:13px">${organization?.description?.encodeAsHTML()}</textarea>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <g:hiddenField name="save" value="true"/>
                    <g:hiddenField name="id" value="${organization?.id}"/>
                    <input id="saveButton" type="submit" value="Save" style="width:60px"/>
                </td>
            </tr>
        </g:form>
    </table>
</div>

            