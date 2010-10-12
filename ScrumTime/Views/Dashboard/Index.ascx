<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<script type="text/javascript">
    $(document).ready(function () {
        document.title = 'ScrumTime 0.9 - Dashboard';       
    }); 
</script> 

<div style="margin-top:0px;margin-left:0px;">
    <div style="height:34px;width:960px;background-color:#fff;
        font-family:Verdana;font-size:12px;padding-top:6px;border-top:2px solid #999;border-left:2px solid #999;
        border-right:2px solid #999;color:#79a52c;font-weight:bold;letter-spacing:1px;font-size:13px;text-align:center;">
        Dashboard
    </div> 
    <div class="nopadding" style="text-align:center">     
    <table class="nopadding" cellpadding="0" cellspacing="0" style="width:100%;border:2px solid #999;
            height:30px;margin-left:0px;" border="0">
        <tr>
            <td class="nopadding" style="color:#666;font-size:11px;width:200px;background-color:#f3f3f3;">Current Product</td>
            <td class="nopadding" style="color:#666;font-size:11px;background-color:#f3f3f3;">Current Sprint</td>
            <td class="nopadding" style="color:#666;font-size:11px;width:200px;background-color:#f3f3f3;">Next Release</td>
        </tr>
        <tr>
            <td class="nopadding" style="color:#75a22a;font-size:12px;width:200px;background-color:#f3f3f3;">Acme</td>
            <td class="nopadding" style="color:#75a22a;font-size:12px;background-color:#f3f3f3;">Copperhead</td>
            <td class="nopadding" style="color:#75a22a;font-size:12px;width:200px;background-color:#f3f3f3;">1.0</td>
        </tr>
    </table> 
    </div>  
    <div class="nopadding" style="border-left:2px solid #999;border-right:2px solid #aaa;border-bottom:2px solid #999;
        height:395px;padding-top:30px">
        <div id="sprintBurnDownChart" style="position:absolute;left:30px;width:460px;height:306px;"></div>
        <div id="taskHoursPerSprint" style="position:absolute;left:510px;width:463px;height:280px;"></div>
    </div>
</div>  


<script type="text/javascript">        
    loadSprintBurnDownChart();
    loadTaskHoursPerSprint();
</script>