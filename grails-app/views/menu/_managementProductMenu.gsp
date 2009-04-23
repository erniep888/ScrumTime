<div id="thirdLevelMenuDiv" style="text-align:left">
    <table class="font14" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td style="width:40px"></td>
            <g:if test="${!managementProductMenuSelection || managementProductMenuSelection == '' || managementProductMenuSelection == 'list'}">
                <td style="width:88px" class="fontBolder fontDkGray">List</td>
                <td style="width:78px"><a href="${createLink(controller: 'product', action: 'createNew')}">New</a></td>
            </g:if>
            <g:else>
                <td style="width:88px"><a href="${createLink(controller: 'product', action: 'index')}">List</a></td>
                <td style="width:78px" class="fontBolder fontDkGray">New</td>
            </g:else>
        </tr>
    </table>
</div>
