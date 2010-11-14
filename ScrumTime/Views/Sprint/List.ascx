<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.SprintCollectionViewModel>" %>
<div id="sprintContentListId_<%: Model.ProductId %>" style="width: 100%; height: 94px;
    overflow: scroll;">
    <table id="sprintTable_<%: Model.ProductId %>" class="nopadding" style="width: 100%;"
        cellpadding="0" cellspacing="0">
        <tbody id="sprintTableBody_<%: Model.ProductId %>" style="font-size: 12px;">
            <%
                foreach (var sprint in Model.Sprints)
                {
                    Html.RenderPartial(MVC.Sprint.Views.ReadOnly, sprint);
                }
            %>
        </tbody>
    </table>
</div>
