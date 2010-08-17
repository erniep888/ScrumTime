<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<ScrumTime.Models.Task>>" %>
    
            <%
                foreach (ScrumTime.Models.Task task in Model)
                {                    
            %>
                    <tr id="taskRow_<%: task.TaskId %>" class="taskRow">
                        <%                        
                            Html.RenderPartial("~/Views/Task/ReadOnly.ascx", task);
                         %>
                    </tr>                                        
            <%
                }
            %>                             
        

