<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.TaskCollectionViewModel>" %>
    
    <tbody id="taskTableBody_<%: Model.ParentStoryModel.StoryId %>" style="font-size:12px;">
        <%
        foreach (var task in Model.SortedTaskModels)
        {                               
            Html.RenderPartial(MVC.Task.Views.ReadOnly, task);
        }
        %>                   
    </tbody>


                                  
        

