<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<script type="text/javascript">
    $(document).ready(function () {
        document.title = 'ScrumTime 0.9 - Schedule';
    }); 
</script> 

<div class="nopadding" style="border:1px solid #999;text-align:center;font-family:Verdana;font-size:12px;
        margin-bottom:10px;padding:6px;padding-left:12px;padding-right:11px;">
    <div class="nopadding" style="color:#79a52c;font-weight:bold;letter-spacing:1px;font-size:13px;">Calendar</div>
    <div id="releaseSchedule" style="width:100%;height:260px;"></div>
</div>


<div id="scheduleMenu" style="padding:0;margin:0;">            
    <ul style="font-size:12px">              
        <li><a href="Release/List">Releases</a></li>
        <li><a href="Schedule/SprintList">Sprints</a></li>
    </ul>                
</div>




<script type="text/javascript">
    loadSchedule();
</script>