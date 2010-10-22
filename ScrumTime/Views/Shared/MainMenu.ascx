<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<div id="main" style="position:absolute;top:88px;margin:0px;left:0px;">
    <div id="mainMenu" style="width:1000px;height:576px;padding:0;margin:0">            
        <ul style="font-size:12px">              
            <li><a href="Dashboard/Index">Dashboard</a></li>                    
            <li><a href="Story/BacklogByPriority">Backlog</a></li>
            <li><a href="Scrum/Index">Scrum</a></li>
            <li><a href="Schedule/Index">Schedule</a></li>
            <li><a href="Product/Index">Product</a></li>                    
        </ul>                
    </div>
</div>        

<script type="text/javascript">
    createMainTabs();
</script>