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
<g:render template="/menu/mainMenu" model="['mainMenuSelection': 'management']"/>
<g:render template="/menu/managementMenu" model="['managementMenuSelection':'product']"/>
<g:render template="/menu/managementProductMenu"/>
<g:layoutBody/>
<g:render template="/shared/footer"/>
</body>
</html>