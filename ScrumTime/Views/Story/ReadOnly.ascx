<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Story>" %>
<tr id="storyRow_<%: Model.StoryId %>" class="storyRow" style="border: 0px">
    <% Html.RenderPartial(MVC.Story.Views.ReadOnlyColumns, Model);  %>
</tr>
