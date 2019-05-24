<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.TaskCollectionViewModel>" %>
    
    <tbody id="taskTableBody_<%: Model.ParentStoryModel.StoryId %>" style="font-size:12px;">
        <%
        foreach (ScrumTime.Models.Task task in Model.SortedTaskModels)
        {                               
            Html.RenderPartial("~/Views/Task/ReadOnly.ascx", task);
        }
        %>                   
    </tbody>


                                  
        

