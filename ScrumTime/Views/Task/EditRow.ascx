<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Task>" %>

    <td style="vertical-align:middle;text-align:center;width:80px;"><%= Model.TaskId %></td>
    <td><textarea rows="3" style="width:100%;font-family:Verdana;color:#860;"><%= Model.Description %></textarea></td>
    <td style="vertical-align:middle;text-align:center;width:80px"><%= Model.Hours %></td>
    <td style="vertical-align:middle;text-align:center;width:194px">Delete</td>
    <%--<td style="vertical-align:middle;text-align:center;width:194px">Save | <a href="#" class="noticableLink" onclick="cancelTaskRowEdit('#taskRow_<%= Model.TaskId %>', <%= Model.TaskId %>, <%= 1 %>);">Cancel</span></td>--%>
