<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<ScrumTime.Models.Task>>" %>
    
            <%
                foreach (ScrumTime.Models.Task task in Model)
                {                    
            %>
                    <tr id="taskRow_<%: task.TaskId %>" class="taskRow">
                        <% 
                        if (task.TaskId == 0)
                            Html.RenderPartial("~/Views/Task/EditRow.ascx", task);   
                        else
                            Html.RenderPartial("~/Views/Task/ReadOnlyRow.ascx", task);
                         %>
                    </tr>                                        
            <%
                }
            %>                             
        

