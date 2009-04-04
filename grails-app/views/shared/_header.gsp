<systemuser:useCookieLogin/>
<table>
    <tr>
        <td class="logo">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td><img src="${createLinkTo(dir: 'images', file: 'logos/scrumtime_logo.jpg')}"
                alt="<g:message code="common.producttitle"/>"/></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<img src="${createLinkTo(dir: 'images', file: 'logos/scrumtime_tagline.jpg')}"
                alt="<g:message code="common.producttitle"/>"/></td>
                </tr>
            </table>

        </td>

        %{--<td class="loginStatus"><g:message code="common.header.register"/> | <a href="${createLink(controller: 'login')}"><g:message code="common.header.login"/></a></td>--}%

        <td id="loginArea">
            <g:render template="/user/loginArea"/>
        </td>
    </tr>
    
</table>