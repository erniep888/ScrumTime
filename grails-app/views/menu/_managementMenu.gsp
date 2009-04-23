<div id="secondLevelMenuDiv" style="text-align:left">
    <table class="font14" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td style="width:20px"></td>
            <g:if test="${!managementMenuSelection || managementMenuSelection == '' || managementMenuSelection == 'product'}">
                <td style="width:88px" class="fontBolder fontDkGray">Product</td>
                <td style="width:78px"><a href="${createLink(controller: 'home', action: 'index')}">Sprint</a></td>
            </g:if>
            <g:else>
                <td style="width:88px"><a href="${createLink(controller: 'product', action: 'index')}">Product</a></td>
                <td style="width:78px" class="fontBolder fontDkGray">Sprint</td>
            </g:else>
        </tr>
    </table>
</div>
