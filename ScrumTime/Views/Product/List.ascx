<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.ProductCollectionViewModel>" %>

    <table class="productTable" style="width:943px;font-family:Verdana;padding:0" cellpadding="0" cellspacing="0">                
        <tbody id="productTableBody" style="font-size:12px;">
            <%  
                foreach (ScrumTime.ViewModels.ProductViewModel productViewModel in Model.ProductViewModels)
            {
                Html.RenderPartial("~/Views/Product/ReadOnly.ascx", productViewModel);
            }                               
            %>                      
        </tbody>
    </table>

    <script type="text/javascript">
//        $('.productTable').ready(function () {
//            setAlternatingProductBackgroundColors();
//        });
    </script>