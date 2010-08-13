<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.TaskCollectionViewModel>" %>
    
    <%
        decimal? taskHours = 0;
        if (Model.ParentStoryModel.Tasks.Count() > 0)
        {
            taskHours = Model.ParentStoryModel.Tasks.Sum(t => t.Hours);
        }
        
        string taskHourString = "";
        if (taskHours > 1 || taskHours == 0 || taskHours < 0)
            taskHourString = Decimal.ToInt32((decimal)taskHours) + " hrs";
        else
            taskHourString = "1 hr";
     %>

   <td style="padding:0px;margin:0px;border:0px;" colspan="6">
        <table style="width:940px;font-family:Verdana;padding:0px;margin:0px;border:0px" cellpadding="0" cellspacing="0">
            <tr style="padding:0px;margin:0px;border:0px;">
                <td class="story_<%: Model.ParentStoryModel.StoryId %>" style="vertical-align:middle;text-align:center;width:68px;border:0px;font-size:11px;"><%: Model.ParentStoryModel.Priority%></td>
                <td style="vertical-align:middle;text-align:center;width:108px;border:0px;font-style:italic;font-size:11px;"><%: Model.ParentStoryModel.UserDefinedId%></td>
                <td class="story_<%: Model.ParentStoryModel.StoryId %>" style="border:0px;width:510px;"><%: Model.ParentStoryModel.Narrative %></td>
                <td style="vertical-align:middle;text-align:center;width:80px;border:0px;font-size:11px;"><div><%: taskHourString %></div></td>
                <td class="story_<%: Model.ParentStoryModel.StoryId %>" style="vertical-align:middle;text-align:center;width:80px;border:0px;font-size:11px;"><%: Model.ParentStoryModel.Points%></td>
                <td style="vertical-align:middle;text-align:center;width:114px;border:0px;">
                <table border="1" cellpadding="0" cellspacing="0" style="padding:0;border:0;" width="100%">
                    <tr>
                        <td style="border:0px">
                            <a href="#" id="closeStoryTasks_<%: Model.ParentStoryModel.StoryId %>" class="simpleLink" 
                                style="font-size:12px;font-weight:bold;color:#0035a0;" 
                                onclick="cancelStoryRowEdit('#storyRow_<%: Model.ParentStoryModel.StoryId %>', '<%: Model.ParentStoryModel.StoryId %>');">
                                <img alt="Cancel" src="../../Content/Images/Menu/cancel24x24.png" /></a>
                        </td>
                    </tr>
                </table>

                
                </td>
            </tr>
            <tr style="padding:0px;margin:0px;border:0px;">
                <td colspan="6" style="border:0px">
                    <div id="taskContainerId_<%: Model.ParentStoryModel.StoryId %>" style="margin-left:10px;margin-right:10px;margin-bottom:10px;border:1px dotted #444;">
                        <div id="Div4" style="height:22px;width:100%;background-color:white;
                            font-family:Verdana;font-size:10px;padding-top:0px;border:0px;">
                            <div style="font-size:12px;padding-left:12px;"><a href="#" class="simpleLink" onclick="addTaskRow(<%: Model.ParentStoryModel.StoryId %>);">Add Task</a><span style="width:70px;color:#777;font-weight:bold;margin-left:360px">Tasks</span></div>
                        </div>
                        <div id="taskContentListId_<%: Model.ParentStoryModel.StoryId %>">                            
                            <% Html.RenderPartial("~/Views/Task/ListById.ascx", Model); %>    
                        </div>
                    </div>
                </td>
            </tr>
        </table>
   </td>  
        
        
    