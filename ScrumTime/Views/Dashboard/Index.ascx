<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<script type="text/javascript">
    $(document).ready(function () {
        document.title = 'ScrumTime 0.9 - Dashboard';
    }); 
</script> 

<div class="nopadding" style="border:2px solid #999;text-align:center;font-family:Verdana;font-size:12px;
        margin-bottom:10px;padding:6px;padding-left:12px;padding-right:11px;width:934px;height:496px;">
    <div style="border-top:1px solid #999;border-left:1px solid #999;border-right:1px solid #999;
        height:20px;margin-top:10px;margin-left:1px;margin-right:5px;background-color:#f3f3f3;color:#79a52c;font-weight:bold;
        letter-spacing:1px;">
        Dashboard
    </div>
    <div style="border:1px solid #999;height:50px;margin-left:1px;margin-right:5px;margin-bottom:30px;padding-top:10px">
        <table class="nopadding" cellpadding="0" cellspacing="0" style="width:100%;" border="1">
            <tr>
                <td class="nopadding" style="color:#666;font-size:11px;width:200px">Current Product</td>
                <td class="nopadding" style="color:#666;font-size:11px;">Current Sprint</td>
                <td class="nopadding" style="color:#666;font-size:11px;width:200px">Next Release</td>
            </tr>
            <tr>
                <td class="nopadding" style="color:#75a22a;font-size:12px;width:200px">Acme</td>
                <td class="nopadding" style="color:#75a22a;font-size:12px;">Banana</td>
                <td class="nopadding" style="color:#75a22a;font-size:12px;width:200px">1.0</td>
            </tr>
        </table>        
    </div>
    <div id="sprintBurnDownChart" style="position:absolute;width:460px"></div>
    <div id="taskHoursPerSprint" style="position:absolute;left:506px;width:463px;height:280px;"></div>
</div>

<script type="text/javascript">
    loadSprintBurnDownChart();
    loadTaskHoursPerSprint();
</script>