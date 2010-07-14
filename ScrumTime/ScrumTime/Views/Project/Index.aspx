<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Authenticating.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="projectControlMenu">
        <div style="position:absolute;left:0px;top:5px;">
            <a href="#" style="margin-right:15px">New...</a>
            <a href="#" >List...</a>
        </div>
        <div style="position:absolute;right:0px;top:5px;text-align:right">
            <a href="#">Acme</a> Project
        </div>
    </div>
    <div>
        <div id="submenu">
            <ul>
                <li><a href="#" class="current">Details</a></li>
                <li><a href="#">Scrums</a></li>
                <li><a href="#">Charts</a></li>
                <li><a href="#" style="margin-right:20px;">Features</a></li>
                <li><a href="#">Stories</a></li>
                <li><a href="#">Tasks</a></li>
                <li><a href="#" style="margin-right:0px;">Bugs</a></li>
                <li><a href="#" style="margin-right:20px;">Releases</a></li>
                <li><a href="#">Sprints</a></li>
                <li><a href="#" style="margin-right:20px;">Members</a></li>
                <li><a href="#">ToDo</a></li>
            </ul>
        </div>
    </div>
    
    
</asp:Content>
