<html>
<head>
    <title><g:message code="scrumtime.title"/></title>
    <meta name="layout" content="projects"/>
</head>
<body>
<div style="padding-top:4px">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td style="padding-left:20px">General</td>
            <td style="padding-left:20px"><a href="#">Members</a></td>
            <td style="padding-left:20px"><a href="#">Owners</a></td>
            <td style="padding-left:20px"><a href="#">Products</a></td>
        </tr>
        <tr>
            <td colspan="4">
                <div style="padding-left:20px;padding-top:16px;">
                    <table>
                        <tr>
                            <td>
                                Name:
                            </td>
                            <td>
                                <input name='name' maxlength="120" tabindex="2"
                                    style="width:300px;color:#333;"
                                    value="${systemUser?.username?.encodeAsHTML()}"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:top;">
                                Description:
                            </td>
                            <td>
                                <textarea tabindex="10" name='description' cols="30" rows="5" style="width:300px;height:110px;font-family:arial;font-size:13px"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <input id="saveButton" type="submit" value="Save" style="width:60px"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>