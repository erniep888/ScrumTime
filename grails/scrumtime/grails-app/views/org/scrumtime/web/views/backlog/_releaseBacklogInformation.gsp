<div class="subWindowTitle releaseBacklogViewWindow"><center>(Release Backlog)</center></div>
<center><div class="fontSize12 paddingTop5 paddingBottom5"><b>${releaseBacklogInformation?.backlogName}</b></div>
    <table class="fontSize10">
        <tr>
            <td>Work Remaining</td>
            <td class="horiAlignRight"><b>${releaseBacklogInformation?.workRemaining}</b></td>
            <td>hrs</td>
        </tr>
        <tr>
            <td>Work Completed</td>
            <td class="horiAlignRight"><b>${releaseBacklogInformation?.workCompleted}</b></td>
            <td>hrs</td>
        </tr>
        <tr>
            <td>Work Total</td>
            <td class="horiAlignRight"><b>${releaseBacklogInformation?.totalWork}</b></td>
            <td>hrs</td>
        </tr>
    </table>
    <g:if test="${session?.backlogViewSettings?.backlogType == 'release'}">
        <span class="fontSize10">viewed currently</span>
    </g:if>
    <g:else>
        <g:link class="fontSize10" controller="backlog" action="viewBacklog" params="[backlogType:'release']">view</g:link>
    </g:else>
</center>
                
