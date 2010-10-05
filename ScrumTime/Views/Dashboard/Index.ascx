<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<script type="text/javascript">
    $(document).ready(function () {
        document.title = 'ScrumTime 0.9 - Dashboard';
    }); 
</script> 

<div class="nopadding" style="border:2px solid #999;text-align:center;font-family:Verdana;font-size:12px;
        margin-bottom:10px;padding:6px;padding-left:12px;padding-right:11px;">
    <div id="sprintBurndownChart" style="width:920px;height:496px;"></div>
</div>