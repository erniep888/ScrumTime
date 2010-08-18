<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.TaskCollectionViewModel>" %>
<tr id="storyRow_<%: Model.ParentStoryModel.StoryId %>" class="storyRow" style="border:0px" >                
   <td style="padding:0px;margin:0px;border:0px;" colspan="6">           
     <table style="width:940px;font-family:Verdana;padding:0px;margin:0px;border:0px" cellpadding="0" cellspacing="0">
            <tr style="padding:0px;margin:0px;border:0px;">
                <%
                    Html.RenderPartial("~/Views/Story/ReadOnlyColumns.ascx", Model.ParentStoryModel);
                %>
            </tr>
            <tr style="padding:0px;margin:0px;border:0px;">
                <td colspan="6" style="border:0px">
                    <div id="taskContainerId_<%: Model.ParentStoryModel.StoryId %>" style="margin-left:10px;margin-right:10px;margin-bottom:10px;border:1px dotted #444;">
                        <div id="Div4" style="height:22px;width:100%;background-color:white;
                            font-family:Verdana;font-size:10px;padding-top:0px;border:0px;">
                            <div style="font-size:12px;padding-left:12px;"><a href="#" class="simpleLink" onclick="addTaskRow(<%: Model.ParentStoryModel.StoryId %>);">Add Task</a><span style="width:70px;color:#777;font-weight:bold;margin-left:360px">Tasks</span></div>
                        </div>
                        <div id="taskContentListId_<%: Model.ParentStoryModel.StoryId %>">                            
                            <table id="taskTable_<%: Model.ParentStoryModel.StoryId %>" class="taskTable" style="width:100%;font-family:Verdana;padding:0;border:0px" cellpadding="0" cellspacing="0">
                                <thead id="taskTableHead_<%: Model.ParentStoryModel.StoryId %>" style="height:18px;width:100%;font-size:11px;color:#e66a38;" >  
                                    <tr>
                                        <th style="text-align:center;width:80px;padding-top:3px;padding-bottom:3px;border:0px;border-top:1px dotted #777;border-bottom:1px dotted #777;background-color:#f3f3f3;">ID</th>
                                        <th style="border:0px;border-top:1px dotted #777;border-bottom:1px dotted #777;background-color:#f3f3f3;text-align:left;" >Description</th>
                                        <th style="text-align:center;width:80px;border:0px;border-top:1px dotted #777;border-bottom:1px dotted #777;background-color:#f3f3f3;">Hours <span style="font-size:10px;color:#666">(<%: Model.ParentStoryModel.Tasks.Sum(t => t.Hours)%>)</span></th>
                                        <th style="text-align:center;width:194px;border:0px;border-top:1px dotted #777;border-bottom:1px dotted #777;background-color:#f3f3f3;">Actions</th>
                                    </tr>
                                </thead>
                                <% Html.RenderPartial("~/Views/Task/List.ascx", Model ); %>
                            </table>    
                        </div>
                    </div>
                </td>
            </tr>
        </table>
   </td>  

   <script type="text/javascript" language="javascript">
       setupTaskEditorCancelButton(<%: Model.ParentStoryModel.StoryId %>);  
       hideBottomContainerBorderIfNeeded(<%: Model.ParentStoryModel.StoryId %>);   
       $('storyRow_<%: Model.ParentStoryModel.StoryId %>').ready(function () {
            setAlternatingStoryBackgroundColors();
        });
   </script>
</tr>
        
        
    