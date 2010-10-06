<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<script type="text/javascript">
    $(document).ready(function () {
        document.title = 'ScrumTime 0.9 - Dashboard';
    }); 
</script> 

<div class="nopadding" style="border:2px solid #999;text-align:center;font-family:Verdana;font-size:12px;
        margin-bottom:10px;padding:6px;padding-left:12px;padding-right:11px;width:934px;height:496px;">
    <div id="sprintBurnDownChart" style="position:absolute;width:460px"></div>
    <div id="taskHoursPerSprint" style="position:absolute;left:506px;width:460px;"></div>
</div>

<script type="text/javascript">
    loadSprintBurnDownChart();
    loadTaskHoursPerSprint();
</script>