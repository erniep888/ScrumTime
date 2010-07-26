<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Story>" %>

    <td class="story_<%= Model.StoryId %>" style="vertical-align:middle;text-align:center;width:78px;border:0px;"><%= Model.StoryId %></td>
    <td class="story_<%= Model.StoryId %>" style="vertical-align:middle;text-align:center;width:78px;border:0px;"><%= Model.UserDefinedId %></td>
    <td class="story_<%= Model.StoryId %>" style="border:0px;width:530px"><%= Model.Narrative %></td>
    <td class="story_<%= Model.StoryId %>" style="vertical-align:middle;text-align:center;width:80px;border:0px;"><%= Model.Points %></td>
    <td style="vertical-align:middle;text-align:center;width:194px;border:0px;">Delete | <a id="task_<%= Model.StoryId %>" class="simpleLink" href="#">Tasks</a></td>
                    
    <script type="text/javascript">       
        setupReadOnlyStoryRow(<%= Model.StoryId %>);
    </script>
    