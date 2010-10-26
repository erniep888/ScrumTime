<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Story>" %>

        <%
            decimal? taskHours = 0;
            if (Model.Tasks.Count() > 0)
            {
                taskHours = Model.Tasks.Sum(t => t.Hours);
            }
        
            string taskHourString = "";
            if (taskHours > 1 || taskHours == 0 || taskHours < 0)
                taskHourString = Decimal.ToInt32((decimal)taskHours) + " hrs";
            else
                taskHourString = "1 hr";
         %>

        <td class="story_<%: Model.StoryId %>" style="vertical-align:middle;text-align:center;width:68px;border:0px;font-size:11px;"><a class="simpleLink" href="#"><%: Model.Priority %></a></td>
        <td class="story_<%: Model.StoryId %>" style="vertical-align:middle;text-align:center;width:108px;border:0px;font-size:11px;"><a class="simpleLink" href="#" style="font-style:italic;"><%: Model.UserDefinedId %></a></td>
        <td class="story_<%: Model.StoryId %>" style="border:0px;width:556px"><a class="simpleLink" href="#"><%: Model.Narrative %></a></td>
        <td class="story_<%: Model.StoryId %>" style="vertical-align:middle;text-align:center;width:80px;border:0px;font-size:11px;"><a id="storyTotalHours_<%: Model.StoryId %>" class="simpleLink" href="#"><%: taskHourString %></a></td>
        <td class="story_<%: Model.StoryId %>" style="vertical-align:middle;text-align:center;width:80px;border:0px;font-size:11px;"><a class="simpleLink" href="#"><%: Model.Points %></a></td>
        <td class="story_<%: Model.StoryId %>_Actions" style="vertical-align:middle;text-align:left;width:116px;border:0;font-size:11px;padding:0;">
            <table border="0" cellpadding="0" cellspacing="0" style="padding:0;border:0;margin-left:24px" width="94px">
                <tr>
                    <td style="border:0px;">
                        <a href="#" class="simpleLink" onclick="deleteStory(<%: Model.StoryId %>);"><img
                                        alt="Delete" style="" src="../../Content/Images/Menu/trash.png" /></a>
                    </td>
                    <td style="border:0px">
                        <a id="storyTasks_<%: Model.StoryId %>" class="simpleLink" href="#">
                            <img src="../../Content/Images/Menu/note_accept.png" /></a>
                    </td>
                </tr>
            </table>
        </td>   
        <td style="border:0px;"></td>                 
        <script type="text/javascript">           
            setupReadOnlyStoryRow(<%: Model.StoryId %>);            
        </script>
    
    