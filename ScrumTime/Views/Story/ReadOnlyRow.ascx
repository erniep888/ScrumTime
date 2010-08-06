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

    <td class="story_<%= Model.StoryId %>" style="vertical-align:middle;text-align:center;width:68px;border:0px;font-size:11px;"><a class="simpleLink" href="#"><%= Model.StoryId %></a></td>
    <td class="story_<%= Model.StoryId %>" style="vertical-align:middle;text-align:center;width:108px;border:0px;font-size:11px;"><a class="simpleLink" href="#" style="font-style:italic;"><%= Model.UserDefinedId %></a></td>
    <td class="story_<%= Model.StoryId %>" style="border:0px;width:510px"><a class="simpleLink" href="#"><%= Model.Narrative %></a></td>
    <td class="story_<%= Model.StoryId %>" style="vertical-align:middle;text-align:center;width:80px;border:0px;font-size:11px;"><a class="simpleLink" href="#"><%= Model.Points %></a></td>
    <td style="vertical-align:middle;text-align:left;width:194px;border:0px;font-size:11px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Delete | <a id="storyTasks_<%= Model.StoryId %>" class="simpleLink" href="#">Tasks <span style="font-size:10px">(<%= taskHourString %>)</span></a></td>
                    
    <script type="text/javascript">           
        setupReadOnlyStoryRow(<%= Model.StoryId %>);
    </script>
    