<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Task>" %>

    <td style="vertical-align:middle;text-align:center;width:80px;border:0px;"><%: Model.TaskId %></td>
    <td style="border:0px;"><textarea rows="3" style="width:100%;font-family:Verdana;"><%: Model.Description %></textarea></td>
    <td style="vertical-align:middle;text-align:center;width:80px;border:0px;"><input style="width:30px;text-align:center" type="text" value="<%: Model.Hours %>" /></td>
    <td style="vertical-align:middle;text-align:center;width:194px;border:0px;">Save | <a href="#" class="noticableLink" onclick="cancelTaskRowEdit('#taskRow_<%: Model.TaskId %>', <%: Model.TaskId %>);">Cancel</a></td>
