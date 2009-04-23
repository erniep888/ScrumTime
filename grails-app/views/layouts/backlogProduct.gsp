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
<g:javascript>
    function onMouseOverImg(imgId) {
        $(imgId).
        setStyle({
            cursor:'pointer'
//            color:'#090',
//            backgroundImage: 'url(${createLinkTo(dir:'/images/tabs',file:'tab_background_hover.png')})'
        });
    }
    function onMouseOutImg(imgId) {
        $(imgId).
        setStyle({
            cursor:'default'
        });
    }
    function changeURL(url) {
        location.href = url;
    }
    function productSelectionChange(selectedOption) {
        changeURL('${createLink(controller: 'backlog',action:'setCurrentProduct')}' + '?id=' + selectedOption.selectedIndex )
    }
</g:javascript>
<g:render template="/shared/header"/>
<g:render template="/menu/mainMenu" model="['mainMenuSelection': 'backlog']"/>
<g:render template="/menu/backlogMenu" model="['backlogMenuSelection':'product']"/>
<g:render template="/menu/backlogProductMenu"/>
<g:layoutBody/>
<g:render template="/shared/footer"/>
</body>
</html>