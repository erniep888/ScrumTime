<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ScrumTime 0.9 Bistre (Development)</title>
    <link rel="shortcut icon" href="/Content/Images/favicon.ico" type="image/x-icon"/>
    <meta http-equiv="CACHE-CONTROL" content="NO-CACHE"/>

    <link rel="stylesheet" href="<%: Url.Content("~/Content/Css/main.css") %>" type="text/css" />
    <link rel="stylesheet" href="<%: Url.Content("~/Content/Css/smooth_withgreen/jquery-ui-1.8.4.custom.css") %>" type="text/css" />
    <link rel="stylesheet" href="<%: Url.Content("~/Content/Css/jquery.jqplot.min.css") %>" type="text/css" />
    <!--[if IE]><script language="javascript" type="text/javascript" src="<%: Url.Content("~/Scripts/excanvas.min.js") %>"></script><![endif]-->
    <script src="<%: Url.Content("~/Scripts/jquery-1.4.2.min.js") %>" type="text/javascript" ></script>
    <script src="<%: Url.Content("~/Scripts/jquery-ui-1.8.4.custom.min.js") %>" type="text/javascript" ></script>
    <script src="<%: Url.Content("~/Scripts/jquery.flot.min.js") %>" type="text/javascript" ></script>
    <script src="<%: Url.Content("~/Scripts/jquery.flot.selection.min.js") %>" type="text/javascript" ></script>
    <script src="<%: Url.Content("~/Scripts/jquery.jqplot.min.js") %>" type="text/javascript" ></script>
    <script src="<%: Url.Content("~/Scripts/Plugins/jqplot.logAxisRenderer.min.js") %>" type="text/javascript" ></script>
    <script src="<%: Url.Content("~/Scripts/Plugins/jqplot.canvasTextRenderer.min.js") %>" type="text/javascript" ></script>
    <script src="<%: Url.Content("~/Scripts/Plugins/jqplot.canvasAxisLabelRenderer.min.js") %>" type="text/javascript" ></script>
    <script src="<%: Url.Content("~/Scripts/Plugins/jqplot.canvasAxisTickRenderer.min.js") %>" type="text/javascript" ></script>
    <script src="<%: Url.Content("~/Scripts/Plugins/jqplot.dateAxisRenderer.min.js") %>" type="text/javascript" ></script>
    <script src="<%: Url.Content("~/Scripts/Plugins/jqplot.categoryAxisRenderer.min.js") %>" type="text/javascript" ></script>    
    <script src="<%: Url.Content("~/Scripts/Plugins/jqplot.enhancedLegendRenderer.min.js") %>" type="text/javascript" ></script>  
    <script src="<%: Url.Content("~/Scripts/Plugins/jqplot.barRenderer.min.js") %>" type="text/javascript" ></script>    
    <script src="<%: Url.Content("~/Scripts/Plugins/jqplot.pointLabels.min.js") %>" type="text/javascript" ></script>  
    <script src="<%: Url.Content("~/Scripts/scrumtime-main-1.0.js") %>" type="text/javascript" ></script>
    <script src="<%: Url.Content("~/Scripts/scrumtime-story-1.0.js") %>" type="text/javascript" ></script>
    <script src="<%: Url.Content("~/Scripts/scrumtime-task-1.0.js") %>" type="text/javascript" ></script>
    <script src="<%: Url.Content("~/Scripts/scrumtime-schedule-1.0.js") %>" type="text/javascript" ></script>
    <script src="<%: Url.Content("~/Scripts/scrumtime-release-1.0.js") %>" type="text/javascript" ></script>
</head>

<body>   
    <div id="pageHeader"></div>
	<div id="menuBackgroundDiv"></div>
	<div id="pageCenterDiv">
		<div id="pageTitleDiv">			
            <img id="pageLogoGraph" src="/Content/Images/Logos/logo_graph_48x48.png" height="32px" width="32px" alt="ScrumTime"/>		 
            <img id="pageLogo" src="/Content/Images/Logos/ScrumTimeLogo.png" alt="ScrumTime"/>		           	
			<div id="pageTagline">scrum project management tool</div>
		</div>
        <div class="loginLink" style="z-index:100;position:absolute;right:30px;top:96px;font-size:12px;">
            <% Html.RenderPartial("LogOnUserControl"); %>
        </div>
	
        <div id="main" style="position:absolute;top:88px;margin:0px;left:0px;">
            <div id="mainMenu" style="width:1000px;height:576px;padding:0;margin:0">            
                <ul style="font-size:12px">              
                    <li><a href="Dashboard/Index">Dashboard</a></li>                    
                    <li><a href="Story/BacklogByPriority">Backlog</a></li>
                    <li><a href="Scrum/Index">Scrum</a></li>
                    <li><a href="Product/Index">Product</a></li>
                    <li><a href="Schedule/Index">Schedule</a></li>
                    <li><a href="Chart/Index">Chart</a></li>
                </ul>                
            </div>
        </div>        
    </div>
    <% Html.RenderPartial("~/Views/Shared/FooterControl.ascx"); %>
</body>


</html>

