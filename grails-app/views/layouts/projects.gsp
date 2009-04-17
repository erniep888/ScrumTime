<html>
<head>
    <title><g:layoutTitle default="Scrum Time"/></title>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'main.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'menu.css')}"/>
    <link rel="shortcut icon" href="${createLinkTo(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
    <g:layoutHead/>
    <g:javascript library="prototype"/>
</head>
<body style="margin-top:1px">
<g:render template="/shared/header"/>
<g:render template="/menu/mainMenu"/>
<div style="text-align:left;margin-top:16px;">
    <table cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td><g:render template="/projects/navigation/navHeader"/></td>
                    </tr>
                    <tr style="vertical-align:top;">
                        <td style="vertical-align:top;">
                            <g:render template="/projects/navigation/navPane"/>
                        </td>
                    </tr>
                 </table>
            </td>
            <td style="vertical-align:top;">
                <g:layoutBody/>
            </td>
        </tr>
    </table>
</div>
<g:render template="/shared/footer"/>
</body>
</html>