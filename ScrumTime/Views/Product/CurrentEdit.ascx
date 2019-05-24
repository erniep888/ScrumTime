<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.ProductCollectionViewModel>" %>

    <div class="nopadding currentProductContainer">
        <select id="currentProductSelected" style="text-align:left;font-family:Verdana;margin-right:4px;" 
                onblur="revertCurrentProductToReadOnly();" onchange="onCurrentProductChange();">
            <%
                foreach (ScrumTime.ViewModels.ProductViewModel productViewModel in Model.ProductViewModels)
                {
                    if (productViewModel.IsCurrent)
                    { %>
                        <option value="<%: productViewModel.ProductModel.ProductId %>" selected="selected"><%: productViewModel.ProductModel.Name%></option>	
                 <% }
                    else
                    { %>
                        <option value="<%: productViewModel.ProductModel.ProductId %>"><%: productViewModel.ProductModel.Name%></option>	
                 <% }
                }
            %>
		</select>
    </div>    