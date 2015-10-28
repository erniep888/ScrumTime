<systemuser:useCookieLogin/>
<table>
    <tr>
        <td class="logo"><img src="${createLinkTo(dir: 'images', file: 'logos/scrumtime_logo.jpg')}"
                alt="<g:message code="common.producttitle"/>"/></td>

        %{--<td class="loginStatus"><g:message code="common.header.register"/> | <a href="${createLink(controller: 'login')}"><g:message code="common.header.login"/></a></td>--}%

        <td id="loginArea">
            <g:render template="/org/scrumtime/web/views/user/loginArea"/>
        </td>

    </tr>
</table>