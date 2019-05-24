﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.DashboardViewModel>" %>

<script type="text/javascript">
    $(document).ready(function () {
        document.title = 'ScrumTime 0.9 - Dashboard';       
    }); 
</script> 

<div style="margin:0px">
    <div style="height:34px;width:100%;min-width:990px;background-color:#fff;
        font-family:Verdana;font-size:12px;padding-top:6px;border-top:2px solid #999;border-left:2px solid #999;
        border-right:2px solid #999;color:#79a52c;font-weight:bold;letter-spacing:1px;font-size:13px;text-align:center;">
        Dashboard
    </div> 
    <div class="nopadding" style="text-align:center;width:100%;min-width:990px;border:2px solid #999;">     
        <table class="nopadding" cellpadding="0" cellspacing="0" style="width:100%;
                height:30px;margin-left:0px;" border="0">
            <tr>
                <td class="nopadding" style="color:#666;font-size:11px;width:30%;background-color:#ddd;">Current Product</td>
                <td class="nopadding" style="color:#666;font-size:11px;background-color:#ddd;">Current Sprint</td>
                <td class="nopadding" style="color:#666;font-size:11px;width:30%;background-color:#ddd;">Next Release</td>
            </tr>
            <tr>
                <td class="nopadding" style="color:#75a22a;font-size:12px;width:30%;background-color:#eee;"><%: Model.CurrentProductName %></td>
                <td class="nopadding" style="color:#75a22a;font-size:12px;background-color:#eee;"><%: Model.CurrentSprintName %></td>
                <td class="nopadding" style="color:#75a22a;font-size:12px;width:30%;background-color:#eee;"><%: Model.NextReleaseName %></td>
            </tr>
        </table> 
    </div>  
    <div class="nopadding" style="border-left:2px solid #999;border-right:2px solid #aaa;border-bottom:2px solid #999;
        height:395px;padding-top:60px;overflow:scroll;width:100%;min-width:990px;min-height:395px;">
        <div id="sprintBurnDownChart" style="float:left;width:460px;height:306px;margin-left:24px;"></div>
        <div id="taskHoursPerSprint" style="float:right;width:463px;height:280px;margin-right:24px;"></div>
    </div>
</div>  


<script type="text/javascript">        
    loadSprintBurnDownChart();
    loadTaskHoursPerSprint("<%: Page.User.Identity.Name %>");
</script>