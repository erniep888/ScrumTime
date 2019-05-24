﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Task>" %>
    <tr id="taskRow_<%: Model.TaskId %>" class="taskRow">
        <td class="task_<%: Model.TaskId %>" style="vertical-align:middle;text-align:center;width:80px;border:0px;font-size:11px;""><a class="simpleLink" href="#"><%: Model.TaskId %></a></td>
        <td class="task_<%: Model.TaskId %>" style="border:0px;"><a class="simpleLink" href="#"><%: Model.Description %></a></td>
        <td class="task_<%: Model.TaskId %>" style="vertical-align:middle;text-align:center;width:80px;border:0px;font-size:11px;"><a class="storyTaskHours_<%: Model.StoryId %> simpleLink" href="#"><%: Model.Hours %></a></td>
        <td style="vertical-align:middle;text-align:center;width:194px;border:0px;font-size:11px;"><a href="#" class="simpleLink" onclick="deleteTask(<%: Model.StoryId %>, <%: Model.TaskId %>);">Delete</a> | <a class="simpleLink" href="#">Move</a></td>
        <script type="text/javascript">           
            setupReadOnlyTaskRow(<%: Model.TaskId %>, <%: Model.StoryId %>);
        </script>
    </tr>