<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>


    <div id="mainMenu" >            
        <ul style="font-size:12px">              
            <li><a href="Dashboard/Index">Dashboard</a></li>                    
            <li><a href="Story/BacklogByPriority">Backlog</a></li>
            <li><a href="Scrum/Index">Scrum</a></li>
            <li><a href="Schedule/Index">Schedule</a></li>
            <li><a href="Product/Index">Product</a></li>                    
        </ul>                
    </div>
     

<script type="text/javascript">
    createMainTabs();
</script>