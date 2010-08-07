<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Story>" %>
    
   <td style="padding:0px;margin:0px;border:0px;" colspan="5">
        <table style="width:940px;font-family:Verdana;padding:0px;margin:0px;border:0px" cellpadding="0" cellspacing="0">
            <tr style="padding:0px;margin:0px;border:0px;">
                <td class="story_<%: Model.StoryId %>" style="vertical-align:middle;text-align:center;width:68px;border:0px;font-size:11px;"><%: Model.Priority %></td>
                <td style="vertical-align:middle;text-align:center;width:108px;border:0px;font-style:italic;font-size:11px;"><%: Model.UserDefinedId %></td>
                <td class="story_<%: Model.StoryId %>" style="border:0px;width:510px;"><%: Model.Narrative %></td>
                <td class="story_<%: Model.StoryId %>" style="vertical-align:middle;text-align:center;width:80px;border:0px;font-size:11px;"><%: Model.Points %></td>
                <td style="vertical-align:middle;text-align:center;width:194px;border:0px;"><a href="#" id="closeStoryTasks_<%: Model.StoryId %>" class="simpleLink" style="font-size:12px;font-weight:bold;color:#0035a0;" onclick="cancelStoryRowEdit('#storyRow_<%: Model.StoryId %>', '<%: Model.StoryId %>');">Close Tasks</a></td>
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
                            <div style="font-size:12px;padding-left:12px;"><%: Html.ActionLink("Add Task", "AddStoryRow", "Story", null, new {@class="simpleLink"}) %><span style="width:70px;color:#777;font-weight:bold;margin-left:360px">Tasks</span></div>
                        </div>
                        <div id="taskContentListId">                            
                            <% Html.RenderPartial("~/Views/Task/ListById.ascx", Model); %>    
                        </div>
                    </div>
                </td>
            </tr>
        </table>
   </td>  
        
        
    