<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Story>" %>

<td class="story_<%: Model.StoryId %>_Actions" style="vertical-align:middle;text-align:center;width:114px;border:0px;">
    <table border="1" cellpadding="0" cellspacing="0" style="padding:0;border:0;" width="114px">
        <tr>
            <td style="border:0px">
                <a href="#" id="closeStoryTasks_<%: Model.StoryId %>" class="simpleLink"
                    style="font-size:12px;font-weight:bold;color:#0035a0;"
                    onclick="cancelStoryRowEdit('#storyRow_<%: Model.StoryId %>', <%: Model.StoryId %>);">
                    <img alt="Cancel" src="../../Content/Images/Menu/cancel24x24.png" /></a>
            </td>
        </tr>
    </table> 
</td>