<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<script type="text/javascript">
    $(document).ready(function () {
        document.title = 'ScrumTime 0.9 - Schedule';
    }); 
</script> 

<div class="nopadding" style="border:2px solid #999;height:34px;width:947px;margin-left:6px;
    margin-bottom:-8px;text-align:center;font-family:Verdana;font-size:12px;">
    <div style="position:absolute;left:16px;width:115px;margin-top:10px">
        <a href="#" class="simpleLink newStoryLink" onclick="addStoryRow();">Add Release</a>
    </div>   
    <div class="nopadding" style="color:#79a52c;font-weight:bold;letter-spacing:1px;font-size:13px;margin-top:3px;">Releases</div>
</div>
<div id="releaseSchedule" style="width:963px;height:200px;"></div>

<span id="clickdata"></span>

<script type="text/javascript">
    loadSchedule();
</script>