<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.ReleaseCollectionViewModel>" %>
<div id="releaseContentListId_<%: Model.ProductId %>" style="width: 100%; height: 94px;
    overflow: scroll;">
    <table id="releaseTable_<%: Model.ProductId %>" class="nopadding" style="width: 100%;"
        cellpadding="0" cellspacing="0">
        <tbody id="releaseTableBody_<%: Model.ProductId %>" style="font-size: 12px;">
            <%
                foreach (var release in Model.Releases)
                {
                    Html.RenderPartial(MVC.Release.Views.ReadOnly, release);
                }
            %>
        </tbody>
    </table>
</div>
