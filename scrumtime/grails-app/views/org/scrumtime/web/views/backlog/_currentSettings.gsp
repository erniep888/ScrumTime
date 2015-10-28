<div>
    <table border="0">
        <tr>
            <td>
                <div id="productBacklog" class="subWindow backlogSmallWindow">
                    <g:render template="/org/scrumtime/web/views/backlog/productBacklogInformation"
                            model="['productBacklogInformation':productBacklogInformation]"/>
                </div>
            </td>
        </tr>
    </table>
</div>
<div class="paddingTop5">
    <table border="0">
        <tr>
            <td>
                <div id="releaseBacklog" class="subWindow backlogSmallWindow">
                    <g:render template="/org/scrumtime/web/views/backlog/releaseBacklogInformation"
                            model="['releaseBacklogInformation':releaseBacklogInformation]"/>
                </div>
            </td>
        </tr>
    </table>
</div>
<div class="paddingTop5">
    <table border="0">
        <tr>
            <td>
                <div id="sprintBacklog" class="subWindow backlogSmallWindow">
                    <g:render template="/org/scrumtime/web/views/backlog/sprintBacklogInformation"
                            model="['sprintBacklogInformation':sprintBacklogInformation]"/>
                </div>
            </td>
        </tr>
    </table>
</div>
