<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.ProductCollectionViewModel>" %>
<table id="productTable" style="width: 943px; font-family: Verdana; padding: 0" cellpadding="0"
    cellspacing="0">
    <tbody id="productTableBody" style="font-size: 12px;">
        <%  
            foreach (var productViewModel in Model.ProductViewModels)
            {
                Html.RenderPartial(MVC.Product.Views.ReadOnly, productViewModel);
            }                               
        %>
    </tbody>
</table>
