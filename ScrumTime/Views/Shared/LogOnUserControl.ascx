<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated)
    {
%>
Welcome <b>
    <%: Page.User.Identity.Name %></b>! &nbsp;&nbsp;&nbsp;<%: Html.ActionLink("Log Off", MVC.Account.LogOff()) %>
<%
    }
    else
    {
%>
<%: Html.ActionLink("Log On", MVC.Account.LogOn()) %>
<%
    }
%>