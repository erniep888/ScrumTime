<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Product>" %>
    <% 
        string productName = "None";
        if (Model != null)
            productName = Model.Name;
    %>

    <div class="nopadding currentProductContainer">
        <a class="simpleLink currentProductLink" style="font-size:12px;color:#75a22a;" href="#"><%: productName %></a>
    </div>
    <script type="text/javascript">
        setupCurrentProductReadOnly('<%: Url.Action(MVC.Product.CurrentEdit()) %>');
    </script>