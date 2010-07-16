<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Authenticating.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
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
                <li><a href="#" style="margin-right:20px;" class="current">Backlog</a></li>                
            </ul>
        </div>
        
    </div>
    <div id="projectSubControlMenu">
        <div class="projectSubControlSeparator">&nbsp;</div>         
    </div>
    
    <script type="text/javascript">
			$(function(){

                // Accordion
				$("#accordion").accordion({ header: "h3" });
            });
		</script>




    <div id="accordion">
			<div>
				<h3><a href="#">First</a></h3>
				<div>Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.</div>
			</div>
			<div>
				<h3><a href="#">Second</a></h3>
				<div>Phasellus mattis tincidunt nibh.</div>
			</div>
			<div>
				<h3><a href="#">Third</a></h3>
				<div>Nam dui erat, auctor a, dignissim quis.</div>
			</div>
		</div>

    
</asp:Content>
