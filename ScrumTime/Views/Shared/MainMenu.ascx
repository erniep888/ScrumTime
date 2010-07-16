<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.MenuViewModel>" %>


<div id="menuDiv">
	<div id="tabs" >
		<ul>	
            <%
                if (Model.SelectedMenuName == "Home")
                {
            %>
			        <li><a href="#" class="current">Home</a></li>
            <%
                }
                else 
                {
            %>   
                    <li><%: Html.ActionLink("Home", "Index", "Home")%></li> 
            <%
                }
                if (Model.SelectedMenuName == "Project")
                {
            %>
			        <li><a href="#" class="current">Project</a></li>
            <%
                }
                else 
                {
            %>   
                    <li><%: Html.ActionLink("Project", "Index", "Project")%></li>
            <%
                }
                if (Model.SelectedMenuName == "Community")
                {
            %>
			        <li><a href="#" class="current">Community</a></li>
            <%
                }
                else 
                {
            %>   
                    <li><%: Html.ActionLink("Community", "Index", "Community")%></li>
            <%
                }
                if (Model.SelectedMenuName == "About")
                {
            %>
			        <li><a href="#" class="current">About</a></li>
            <%
                }
                else 
                {
            %>   
                    <li><%: Html.ActionLink("About", "About", "Home")%></li>
            <% 
                }
            %>
		</ul>
	</div>
</div>
