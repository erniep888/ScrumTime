<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.StoryViewModel>" %>

    <%
        int sprintId = -1;
        string sprintName = "None";
        if (Model.StoryModel.Sprint != null)
        {
            sprintId = Model.StoryModel.Sprint.SprintId;
            sprintName = Model.StoryModel.Sprint.Name;
        }
     %>

    <tr>
        <td></td>
        <td>Assign to Sprint:</td>
        <td colspan="3">
            <select id="storySprint_<%: Model.StoryModel.StoryId %>" style="text-align:left;font-family:Verdana;margin-right:4px;">
            <%
                foreach(ScrumTime.Models.Sprint sprint in Model.AllSprints)
                {
                    if (sprint.SprintId == sprintId)
                    {
                        %>
                        <option value="<%: sprint.SprintId %>" selected="selected"><%: sprint.Name %></option>
                        <%
                    }
                    else
                    {
                        %>
                        <option value="<%: sprint.SprintId %>"><%: sprint.Name %></option>
                        <%
                    
                    }
                }
            %>            
            </select>
        </td>
    </tr>