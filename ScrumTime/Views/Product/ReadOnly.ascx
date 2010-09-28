<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.ProductViewModel>" %>
    

    <tr id="productRow_<%: Model.ProductModel.ProductId %>" class="productRow">
        <td style="vertical-align:middle;text-align:center;width:210px;border:0px;font-size:11px;"><a class="simpleLink product_<%: Model.ProductModel.ProductId %>" href="#"><%: Model.ProductModel.Name %></a></td>
        <td style="vertical-align:middle;text-align:center;width:180px;border:0px;font-size:11px;"><a class="simpleLink product_<%: Model.ProductModel.ProductId %>" style="color:#79a52c;" href="#"><%: Model.ProductModel.Description %></a></td>
        <td style="vertical-align:middle;text-align:center;border:0px;font-size:11px;">
            <a href="#" class="simpleLink" onclick="deleteScrum(<%: Model.ProductModel.ProductId %>);"><img alt="Delete" style="" src="../../Content/Images/Menu/trash.png" /></a>
        </td>
        <script type="text/javascript">           
            
        </script>
    </tr>