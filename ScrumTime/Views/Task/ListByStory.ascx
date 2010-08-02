<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Story>" %>
    
   <td style="padding:0px;margin:0px;border:0px;" colspan="5">
        <table style="width:941px;font-family:Verdana;padding:0px;margin:0px;" cellpadding="0" cellspacing="0">
            <tr style="background-color:#eee;padding:0px;margin:0px;">
                <td class="story_<%= Model.StoryId %>" style="vertical-align:middle;text-align:center;width:78px;border:0px;"><%= Model.StoryId %></td>
                <td style="vertical-align:middle;text-align:center;width:78px;border:0px;"><%= Model.UserDefinedId %></td>
                <td class="story_<%= Model.StoryId %>" style="border:0px;width:530px;"><%= Model.Narrative %></td>
                <td class="story_<%= Model.StoryId %>" style="vertical-align:middle;text-align:center;width:80px;border:0px;"><%= Model.Points %></td>
                <td style="vertical-align:middle;text-align:center;width:192px;border:0px;"><a id="closeStoryTasks_<%= Model.StoryId %>" class="simpleLink" href="#" style="font-size:12px;font-weight:bold;color:#0035a0" onclick="cancelRowEdit('#storyRow_<%= Model.StoryId %>', <%= Model.StoryId %>, <%= Model.Priority %>)">Close Tasks</a></td>
            </tr>
            <tr>
                <td colspan="5">
                    <div style="margin-left:10px;border:1px dotted #333;margin-right:10px;margin-bottom:10px">
                        <div id="Div4" style="height:22px;width:100%;background-color:#dd9300;
                            font-family:Verdana;font-size:10px;padding-top:0px">
                            <div style="font-size:11px;font-weight:bold;color:#eee;padding-left:8px;">Tasks <span style="width:70px;color:#0035a0;margin-left:20px">( Add )</span></div>
                        </div>
                        <table style="width:100%;font-family:Verdana;padding:0;background-color:#ffd766" cellpadding="0" cellspacing="0">
                            <thead style="height:18px;width:100%;font-size:12px;color:#772;" >
                                <tr>
                                    <th style="text-align:center;width:80px;padding-top:3px;padding-bottom:3px;background-color:#ffd766">ID</th>
                                    <th style="background-color:#ffd766">Description</th>
                                    <th style="text-align:center;width:80px;background-color:#ffd766">Hours</th>
                                    <th style="text-align:center;width:194px;background-color:#ffd766">Actions</th>
                                </tr>
                            </thead>
                            <tbody style="font-size:12px;">
                                <%
                                    foreach (ScrumTime.Models.Task task in Model.Tasks)
                                    {
                                %>
                                        <tr id="task_<%= task.TaskId %>" style="background-color:#ffffe0;">
                                            <td style="vertical-align:middle;text-align:center;width:80px;"><%= task.TaskId %></td>
                                            <td><%= task.Description %></td>
                                            <td style="vertical-align:middle;text-align:center;width:80px"><%= task.Hours %></td>
                                            <td style="vertical-align:middle;text-align:center;width:194px">Delete</td>
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
        
        
    