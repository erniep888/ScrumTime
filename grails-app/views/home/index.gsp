<html>
    <head>
        <title><g:message code="common.home.title" /></title>
        <meta name="layout" content="main" />
    </head>
    <body>
        <h2 style="margin-left:12px;"><g:message code="common.home.title" /></h2>
        <div class="dialog" style="margin-left:20px;width:60%;">
            <ul>
              <g:each var="c" in="${grailsApplication.controllerClasses}">
                    <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
              </g:each>
            </ul>
        </div>
    </body>
</html>