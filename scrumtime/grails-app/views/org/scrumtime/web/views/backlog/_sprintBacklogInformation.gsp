<div class="subWindowTitle sprintBacklogViewWindow"><center>(Sprint Backlog)</center></div>
<center><div class="fontSize12 paddingTop5 paddingBottom5"><b>${sprintBacklogInformation?.backlogName}</b></div>
    <table class="fontSize10">
        <tr>
            <td>Work Remaining</td>
            <td class="horiAlignRight"><b>${sprintBacklogInformation?.workRemaining}</b></td>
            <td>hrs</td>
        </tr>
        <tr>
            <td>Work Completed</td>
            <td class="horiAlignRight"><b>${sprintBacklogInformation?.workCompleted}</b></td>
            <td>hrs</td>
        </tr>
        <tr>
            <td>Work Total</td>
            <td class="horiAlignRight"><b>${sprintBacklogInformation?.totalWork}</b></td>
            <td>hrs</td>
        </tr>
    </table>
    <g:if test="${session?.backlogViewSettings?.backlogType == 'sprint'}">
        <span class="fontSize10">viewed currently</span>
    </g:if>
    <g:else>
        <g:link class="fontSize10" controller="backlog" action="viewBacklog" params="[backlogType:'sprint']">view</g:link>
    </g:else>
</center>