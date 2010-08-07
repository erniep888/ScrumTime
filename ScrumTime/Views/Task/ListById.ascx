<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Story>" %>

<% 
    var results = from t in Model.Tasks
                  orderby t.TaskId ascending
                  select t;
    
     %>

<% Html.RenderPartial("~/Views/Task/ListContents.ascx", results.ToList<ScrumTime.Models.Task>()); %>    



