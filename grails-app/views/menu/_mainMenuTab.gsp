<g:if test="${tabStatus == 'ON'}">
    <td class="tabLeftSelected"></td>
    <td class="tabCenterSelected">${tabLabel}</td>
    <td class="tabRightSelected"></td>
</g:if>
<g:else>
    <td class="tabLeft"></td>
    <td class="tabCenter"><a href="${tabLink}">${tabLabel}</a></td>
    <td class="tabRight"></td>
</g:else>
