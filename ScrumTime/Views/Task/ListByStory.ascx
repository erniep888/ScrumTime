<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Story>" %>
    
   <td style="padding:0px;margin:0px;border:0px;" colspan="5">
        <table style="width:941px;font-family:Verdana;padding:0px;margin:0px;border:0px" cellpadding="0" cellspacing="0">
            <tr style="padding:0px;margin:0px;border:0px;">
                <td class="story_<%: Model.StoryId %>" style="vertical-align:middle;text-align:center;width:68px;border:0px;font-size:11px;"><%: Model.StoryId %></td>
                <td style="vertical-align:middle;text-align:center;width:108px;border:0px;font-style:italic;font-size:11px;"><%: Model.UserDefinedId %></td>
                <td class="story_<%: Model.StoryId %>" style="border:0px;width:510px;"><%: Model.Narrative %></td>
                <td class="story_<%: Model.StoryId %>" style="vertical-align:middle;text-align:center;width:80px;border:0px;font-size:11px;"><%: Model.Points %></td>
                <td style="vertical-align:middle;text-align:center;width:194px;border:0px;"><a id="closeStoryTasks_<%: Model.StoryId %>" class="simpleLink" href="#" style="font-size:12px;font-weight:bold;color:#0035a0" onclick="cancelStoryRowEdit('#storyRow_<%: Model.StoryId %>', <%: Model.StoryId %>, <%: Model.Priority %>)">Close Tasks</a></td>
            </tr>
            <tr style="padding:0px;margin:0px;border:0px;">
                <td colspan="5" style="border:0px">
                    <%  if (Model.Tasks.Count() == 0)
                        { %>
                    <div style="margin-left:10px;margin-right:10px;margin-bottom:10px;border-top:1px dotted #444;border-left:1px dotted #444;border-right:1px dotted #444;">
                    <%  }
                        else
                        { %>
                    <div style="margin-left:10px;margin-right:10px;margin-bottom:10px;border:1px dotted #444;">
                    <%  } %>
                        <div id="Div4" style="height:22px;width:100%;background-color:white;
                            font-family:Verdana;font-size:10px;padding-top:0px;border:0px;">
                            <div style="font-size:11px;font-weight:bold;color:#777;padding-left:8px;">Tasks <span style="width:70px;color:#0035a0;margin-left:20px">( Add )</span></div>
                        </div>
                        <table class="taskTable" style="width:100%;font-family:Verdana;padding:0;border:0px" cellpadding="0" cellspacing="0">
                            <thead style="height:18px;width:100%;font-size:11px;color:#e66a38;" >  
                                <tr>
                                    <th style="text-align:center;width:80px;padding-top:3px;padding-bottom:3px;border:0px;border-top:1px dotted #777;border-bottom:1px dotted #777;background-color:#f3f3f3;">ID</th>
                                    <th style="border:0px;border-top:1px dotted #777;border-bottom:1px dotted #777;background-color:#f3f3f3;" >Description</th>
                                    <th style="text-align:center;width:80px;border:0px;border-top:1px dotted #777;border-bottom:1px dotted #777;background-color:#f3f3f3;">Hours <span style="font-size:10px;color:#666">(<%: Model.Tasks.Sum(t => t.Hours) %>)</span></th>
                                    <th style="text-align:center;width:194px;border:0px;border-top:1px dotted #777;border-bottom:1px dotted #777;background-color:#f3f3f3;">Actions</th>
                                </tr>
                            </thead>
                            <tbody style="font-size:12px;">
                                <%
                                    foreach (ScrumTime.Models.Task task in Model.Tasks)
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
                    </div>
                </td>
            </tr>
        </table>
   </td>  
        
        
    