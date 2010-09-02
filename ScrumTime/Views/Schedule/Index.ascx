<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<script type="text/javascript">
    $(document).ready(function () {
        document.title = 'ScrumTime 0.9 - Schedule';
    }); 
</script> 


<div class="nopadding" style="border:1px solid #999;text-align:center;font-family:Verdana;font-size:12px;
        margin-bottom:10px;padding:6px;padding-left:12px;padding-right:11px;">
    <div style="position:absolute;left:30px;font-size:10px;font-family:Verdana;top:48px"><p style="color:#666">From: <input type="text" id="fromDatePicker" size="18"/></p></div>
    <div style="position:absolute;right:57px;font-size:10px;font-family:Verdana;top:48px"><p style="color:#666">To: <input type="text" id="toDatePicker" size="18" style="text-align:right"/></p></div>
    <div class="nopadding" style="color:#79a52c;font-weight:bold;letter-spacing:1px;font-size:13px;">Calendar</div>    
    <div id="releaseSchedule" style="width:920px;height:260px;"></div>
</div>


<div id="scheduleMenu" style="padding:0;margin:0;">            
    <ul style="font-size:12px">              
        <li><a href="Release/List">Releases</a></li>
        <li><a href="Sprint/List">Sprints</a></li>
    </ul>                
</div>




<script type="text/javascript" language="javascript">
    loadSchedule();
</script>