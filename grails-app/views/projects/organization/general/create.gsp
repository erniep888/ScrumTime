<html>
<head>
    <title><g:message code="scrumtime.title"/></title>
    <meta name="layout" content="projects"/>
</head>
<body>
<div>
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td><span style="padding-left:20px">Create a new Organization.</span></td>
        </tr>
        <tr>
            <td>
                <g:hasErrors bean="${organization}">
                    <div class="errors">
                        <g:eachError><p>${it.defaultMessage}</p></g:eachError>

                    %{--<g:renderErrors bean="${organization}" field="name" as="list"/>--}%
                    %{--<g:renderErrors bean="${organization}" field="description" as="list"/>--}%
                    </div>
                </g:hasErrors>
                <div style="padding-left:20px;padding-top:16px;">
                    <table>
                        <g:form controller="organizationGeneral" method="post"><!-- placed here because of IE bug -->
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
                                    <g:hiddenField name="createAction" value="true"/>
                                    <g:actionSubmit value="Save" action="save" style="width:60px"/>
                                </td>
                            </tr>
                        </g:form>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>