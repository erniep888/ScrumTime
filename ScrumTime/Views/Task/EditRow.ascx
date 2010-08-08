<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Task>" %>

    <%
        string taskId = Model.TaskId.ToString();
        if (Model.TaskId < 1)
            taskId = "---";
     %>

    <td style="vertical-align:middle;text-align:center;width:80px;border:0px;font-size:11px;"><%: taskId %></td>
    <td style="border:0px;"><textarea id="taskDescription_<%: Model.TaskId %>" rows="3" style="width:100%;font-family:Verdana;"><%: Model.Description %></textarea></td>
    <td style="vertical-align:middle;text-align:center;width:80px;border:0px;font-size:11px;"><input id="taskHours_<%: Model.TaskId %>" style="width:30px;text-align:center" type="text" value="<%: Model.Hours %>" /></td>
    <td style="vertical-align:middle;text-align:center;width:194px;border:0px;"><a href="#" class="noticableLink" onclick="saveTaskRowEdit('#taskRow_<%: Model.TaskId %>', <%: Model.TaskId %>, <%: Model.StoryId %> );">Save</a> | <a href="#" class="noticableLink" onclick="cancelTaskRowEdit('#taskRow_<%: Model.TaskId %>', <%: Model.TaskId %>, <%: Model.StoryId %> );">Cancel</a></td>
