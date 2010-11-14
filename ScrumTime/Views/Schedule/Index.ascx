<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.ScheduleViewModel>" %>
<script type="text/javascript">
    $(document).ready(function () {
        document.title = '<%: Model.Title %>';
    }); 
</script>
<div class="nopadding" style="border: 1px solid #999; text-align: center; font-family: Verdana;
    font-size: 12px; margin-bottom: 10px; padding: 6px; padding-left: 12px; padding-right: 11px;">
    <div style="position: absolute; left: 30px; font-size: 10px; font-family: Verdana;
        top: 48px">
        <p style="color: #666">
            From:
            <input type="text" id="fromDatePicker" size="11" style="text-align: center" value="<%: Model.FromDate.ToString("MM/dd/yyyy") %>" />
        </p>
    </div>
    <div style="position: absolute; right: 57px; font-size: 10px; font-family: Verdana;
        top: 48px">
        <p style="color: #666">
            To:
            <input type="text" id="toDatePicker" size="11" style="text-align: center" value="<%: Model.ToDate.ToString("MM/dd/yyyy") %>" />
        </p>
    </div>
    <div class="nopadding" style="color: #79a52c; font-weight: bold; letter-spacing: 1px;
        font-size: 13px;">
        Calendar</div>
    <div id="releaseSchedule" style="width: 920px; height: 260px;">
    </div>
</div>
<div id="scheduleMenu" style="padding: 0; margin: 0;">
    <ul style="font-size: 12px">
        <li>
            <%: Html.ActionLink("Sprints", MVC.Sprint.ListContainerByStartDateDesc()) %></li>
        <li>
            <%: Html.ActionLink("Releases", MVC.Release.ListContainerByTargetDateDesc()) %></li>
    </ul>
</div>
<script type="text/javascript">
    initializeRealeaseSchedule('<%: Url.Action(MVC.Schedule.UpdateCalendar()) %>');
    updateReleaseSchedule('<%: Url.Action(MVC.Schedule.UpdateCalendar()) %>');
</script>
