<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<div id="mainMenu">
    <ul style="font-size: 12px">
        <li>
            <%: Html.ActionLink("Dashboard", MVC.Dashboard.Index()) %></li>
        <li>
            <%: Html.ActionLink("Backlog", MVC.Story.BacklogByPriority()) %></li>
        <li>
            <%: Html.ActionLink("Scrum", MVC.Scrum.Index())%></li>
        <li>
            <%: Html.ActionLink("Schedule", MVC.Schedule.Index())%></li>
        <li>
            <%: Html.ActionLink("Product", MVC.Product.Index())%></li>
    </ul>
</div>
<script type="text/javascript">
    createMainTabs();
</script>
