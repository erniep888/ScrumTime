<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Story>" %>

    <td class="story_<%= Model.StoryId %>" style="vertical-align:middle;text-align:center;width:68px;border:0px;"><a class="simpleLink" href="#"><%= Model.StoryId %></a></td>
    <td class="story_<%= Model.StoryId %>" style="vertical-align:middle;text-align:center;width:108px;border:0px;"><a class="simpleLink" href="#" style="color:#860"><%= Model.UserDefinedId %></a></td>
    <td class="story_<%= Model.StoryId %>" style="border:0px;width:510px"><a class="simpleLink" href="#"><%= Model.Narrative %></a></td>
    <td class="story_<%= Model.StoryId %>" style="vertical-align:middle;text-align:center;width:80px;border:0px;"><a class="simpleLink" href="#"><%= Model.Points %></a></td>
    <td style="vertical-align:middle;text-align:center;width:194px;border:0px;">Delete | <a id="task_<%= Model.StoryId %>" class="simpleLink" href="#">Tasks</a></td>
                    
    <script type="text/javascript">           
        setupReadOnlyStoryRow(<%= Model.StoryId %>, <%= Model.Priority %>);
    </script>
    