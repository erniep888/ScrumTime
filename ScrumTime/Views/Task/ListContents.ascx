<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<ScrumTime.Models.Task>>" %>

    <table class="taskTable" style="width:100%;font-family:Verdana;padding:0;border:0px" cellpadding="0" cellspacing="0">
        <thead style="height:18px;width:100%;font-size:11px;color:#e66a38;" >  
            <tr>
                <th style="text-align:center;width:80px;padding-top:3px;padding-bottom:3px;border:0px;border-top:1px dotted #777;border-bottom:1px dotted #777;background-color:#f3f3f3;">ID</th>
                <th style="border:0px;border-top:1px dotted #777;border-bottom:1px dotted #777;background-color:#f3f3f3;" >Description</th>
                <th style="text-align:center;width:80px;border:0px;border-top:1px dotted #777;border-bottom:1px dotted #777;background-color:#f3f3f3;">Hours <span style="font-size:10px;color:#666">(<%: Model.Sum(t => t.Hours) %>)</span></th>
                <th style="text-align:center;width:194px;border:0px;border-top:1px dotted #777;border-bottom:1px dotted #777;background-color:#f3f3f3;">Actions</th>
            </tr>
        </thead>
        <tbody style="font-size:12px;">
            <%
                foreach (ScrumTime.Models.Task task in Model)
                {
            %>
                    <tr id="taskRow_<%: task.TaskId %>" class="taskRow">
                        <% Html.RenderPartial("~/Views/Task/ReadOnlyRow.ascx", task); %>
                    </tr>                                        
            <%
                }
            %>                             
        </tbody>
    </table>

