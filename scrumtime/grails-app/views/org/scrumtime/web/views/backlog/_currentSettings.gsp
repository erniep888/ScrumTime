<div>
    <table cellpadding="0" cellspacing="5">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="currentHeader width250">Current Product</td>
                    </tr>
                    <tr style="">
                        <g:if test="${session?.userSettings?.currentProduct}">
                            <td class="currentContainer"><b>${session?.userSettings?.currentProduct?.name}</b></td>
                        </g:if>
                        <g:else>
                            <td class="currentContainer"><b>Not Set</b></td>
                        </g:else>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="currentHeader width250">Current Release</td>
                    </tr>
                    <tr style="">
                        <g:if test="${session?.userSettings?.currentRelease}">
                            <td class="currentContainer"><b>${session?.userSettings?.currentRelease?.name}</b></td>
                        </g:if>
                        <g:else>
                            <td class="currentContainer"><b>Not Set</b></td>
                        </g:else>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="currentHeader width250">Current Sprint</td>
                    </tr>
                    <tr style="">
                        <g:if test="${session?.userSettings?.currentSprint}">
                            <td class="currentContainer"><b>${session?.userSettings?.currentSprint?.name}</b></td>
                        </g:if>
                        <g:else>
                            <td class="currentContainer"><b>Not Set</b></td>
                        </g:else>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>