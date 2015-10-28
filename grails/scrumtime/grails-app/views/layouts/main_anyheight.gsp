<html>
<head>
    <title><g:layoutTitle default="Scrum Time"/></title>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'main.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonSubWindow.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'mainMenuDropDowns.css')}"/>
    <link rel="shortcut icon" href="${createLinkTo(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
    <g:layoutHead/>
    <g:javascript library="prototype"/>
    <g:javascript library="scriptaculous" />
    <g:javascript library="application"/>
</head>
<body onload="<g:pageProperty name='body.onload'/>" bgcolor="#f3f4eb">
<div align="center">    
    <scrumtime:messagepane messageCode="common.msgpane.working" />
    <table class="mainPage" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <div id="header">
                    <scrumtime:header/>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <scrumtime:mainmenu/>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <g:layoutBody/>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div id="footer">
                    <scrumtime:footer/>
                </div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>