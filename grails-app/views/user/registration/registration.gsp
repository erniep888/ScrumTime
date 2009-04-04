<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Scrum Time - Registration</title>
    <meta name="layout" content="main" />
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'registration.css')}"/>
    <link rel="shortcut icon" href="${createLinkTo(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>

</head>
<body bgcolor="#f3f4eb">
<div align="center">
    <table cellpadding="0" cellspacing="0">        
        <g:if test="${success}">
            <g:render template="/user/registration/registrationSuccess"/>
        </g:if>
        <g:elseif test="${activation}">
            <g:render template="/user/registration/registrationActivation"/>
        </g:elseif>
        <g:else>
            <g:render template="/user/registration/registrationContent"/>
        </g:else>        
    </table>
</div>
</body>
</html>