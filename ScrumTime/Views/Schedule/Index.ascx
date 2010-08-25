<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<script type="text/javascript">
    $(document).ready(function () {
        document.title = 'ScrumTime 0.9 - Schedule';
    }); 
</script> 

<div id="scheduleAccordion" style="padding-bottom:10px;">
    <h3><a href="#">Releases</a></h3>
    <div>
        <% Html.RenderPartial("~/Views/Schedule/ReleaseList.ascx"); %>
    </div>
    <h3><a href="#">Sprints</a></h3>
    <div>
        <% Html.RenderPartial("~/Views/Schedule/SprintList.ascx"); %>
    </div>
</div>

<div class="nopadding" style="border:1px solid #999;text-align:center;font-family:Verdana;font-size:12px;margin-bottom:15px;padding-left:6px;">
    <div class="nopadding" style="color:#79a52c;font-weight:bold;letter-spacing:1px;font-size:13px;margin-top:3px;">Calendar</div>
    <div id="releaseSchedule" style="width:948px;height:290px;"></div>
</div>


<script type="text/javascript">
    loadSchedule();
</script>