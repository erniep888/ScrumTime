<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.ProductViewModel>" %>

<tr id="productRow_<%: Model.ProductModel.ProductId %>" class="productRow" style="font-size:10px">
    <td class="productRow_<%: Model.ProductModel.ProductId %>" style="text-align:center;width:210px;border:0px;"><input id="productName_<%: Model.ProductModel.ProductId %>" style="width:150px;text-align:center" type="text" value="<%: Model.ProductModel.Name %>" /></td>
    <td class="productRow_<%: Model.ProductModel.ProductId %>" style="text-align:left;border:0px;width:514px"><textarea id="productDescription_<%: Model.ProductModel.ProductId %>" rows="3" style="width:100%;font-family:Verdana;"><%: Model.ProductModel.Description %></textarea></td>
    <td style="vertical-align:middle;text-align:center;border:0px;">    
            <table border="1" cellpadding="0" cellspacing="0" style="padding:0;border:0;margin-left:54px" width="100px">
                <tr>
                    <td style="border:0px;">
                        <a href="#" class="simpleLink" onclick="saveProductRowEdit(<%: Model.ProductModel.ProductId %>);"><img alt="Save" src="../../Content/Images/Menu/save24x24.png" /></a>
                    </td>
                    <td style="border:0px">
                        <a href="#" class="simpleLink" onclick="cancelProductRowEdit(<%: Model.ProductModel.ProductId %>);">
                            <img alt="Cancel" src="../../Content/Images/Menu/cancel24x24.png" /></a>
                    </td>
                </tr>
            </table>
        </td>
    <td style="width:10px;border:0px;"></td>    
</tr>