<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.ProductViewModel>" %>
<tr id="productRow_<%: Model.ProductModel.ProductId %>" class="productRow">
    <td style="vertical-align: middle; text-align: center; width: 210px; border: 0px;
        font-size: 11px;">
        <a class="simpleLink product_<%: Model.ProductModel.ProductId %>" href="#">
            <%: Model.ProductModel.Name %></a>
    </td>
    <td style="vertical-align: middle; text-align: left; width: 514px; border: 0px; font-size: 11px;">
        <a class="simpleLink product_<%: Model.ProductModel.ProductId %>" style="color: #79a52c;"
            href="#">
            <%: Model.ProductModel.Description %></a>
    </td>
    <td style="vertical-align: middle; text-align: left; border: 0px; font-size: 11px;">
        <a href="#" class="simpleLink" onclick="deleteProduct(<%: Model.ProductModel.ProductId %>, '<%: Url.Action(MVC.Product.Delete()) %>');"
            style="width: 100px; margin-left: 94px;">
            <img alt="Delete" style="" src="<%: Links.Content.Images.Menu.trash_png %>" title="Delete product" />
        </a>
    </td>
    <script type="text/javascript">           
        setupReadOnlyProductRow(<%: Model.ProductModel.ProductId %>, '<%: Url.Action(MVC.Product.Edit()) %>');
    </script>
</tr>
