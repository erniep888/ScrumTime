<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Authenticating.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Community
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="projectControlMenu">
        <div style="position:absolute;left:0px;top:5px;">
            <a href="#">Acme</a>
        </div>
        <div style="position:absolute;right:-9px;top:5px;text-align:right">            
            <a href="#" style="text-align:right;">New Project...</a>
        </div>
    </div>
    <div>
        <div class="submenu">
            <ul>
                <li><a href="#">Scrum</a></li>
                <li><a href="#">Chart</a></li>
                <li><a href="#" style="margin-right:20px;">Features</a></li>
                <li><a href="#" style="margin-right:20px;" class="current">Backlog</a></li>
                <li><a href="#" style="margin-right:26px;">Schedule</a></li>
                <li><a href="#">Members</a></li>
            </ul>
        </div>
        
    </div>
    <div id="projectSubControlMenu">
        <div class="projectSubControlSeparator">&nbsp;</div>         
        <div class="submenu">
            <ul>
                <li><a href="#" class="current" style="padding-left:25px;padding-top:6px;">Story List</a></li>
                <li><a href="#" style="padding-left:25px;padding-top:6px;">Create...</a></li>                
            </ul>
        </div>
    </div>
    
    
</asp:Content>
