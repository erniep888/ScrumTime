<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

    <div id="currentProductAndSprint" class="nopadding" style="position:absolute;top:60px;right:18px;">
        <table class="nopadding">
            <tr>
                <td class="nopadding" style="color:#666;font-size:12px;padding-right:6px">Product:</td>
                <td class="nopadding" style="color:#666;font-size:12px;color:#75a22a;padding-right:30px">
                    <% Html.RenderAction(MVC.Product.CurrentReadOnly()); %>
                </td>
                <td class="nopadding" style="color:#666;font-size:12px;padding-right:6px">Sprint:</td>
                <td class="nopadding" style="color:#666;font-size:12px;color:#75a22a;">
                    <% Html.RenderAction(MVC.Sprint.CurrentReadOnly()); %>
                </td>
            </tr>
        </table>
    </div>