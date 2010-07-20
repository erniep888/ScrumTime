<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.ProjectViewModel>" %>
<div id="projectControlMenu">
    <div style="position:absolute;left:0px;top:5px;">
        <a href="#"><%= Model.Name %></a>
    </div>
    <div style="position:absolute;left:780px;top:5px;text-align:right">            
        <a href="#" style="text-align:right;">List Projects</a>
    </div>
    <div style="position:absolute;left:882px;top:5px;text-align:right;margin-right:-7px">            
        <a href="#" style="text-align:right;">New Project</a>
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
            <li><a href="#" class="current" style="padding-left:16px;padding-top:6px;">Stories</a></li>
            <li><a href="#" style="padding-left:25px;padding-top:6px;">Tasks</a></li>                
            <li><a href="#" style="padding-left:25px;padding-top:6px;">Bugs</a></li>                
        </ul>
    </div>
</div>

