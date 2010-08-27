<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<div class="nopadding">
    <div class="nopadding" style="width:100%;background-color:#fff;font-family:Verdana;font-size:12px;border:1px solid #999;">
        <div id="Div3" style="height:34px;width:100%;background-color:#fff;font-family:Verdana;border-bottom:1px solid #999;">
            <div style="position:absolute;left:30px;width:115px;margin-top:10px">
                  <a href="#" class="simpleLink newStoryLink" onclick="addStoryRow();">Add Sprint</a>
            </div>            
            <div style="position:absolute;left:444px;width:80px;margin-top:0px;color:#79a52c;font-weight:bold;
                letter-spacing:1px;font-size:13px;text-align:left;">Sprints</div>
            <div style="position:absolute;left:900px;width:50px;margin-top:10px;color:#00a;">Filter</div>
        </div>               
        <table class="nopadding" style="width:100%;color:#666" cellpadding="0" cellspacing="0">
            <tr>
                <th style="text-align:center;width:150px;border:0px;background-color:#f3f3f3;">Name</th>
                <th style="text-align:left;border:0px;background-color:#f3f3f3;">Description</th>
                <th style="text-align:center;width:120px;border:0px;background-color:#f3f3f3;">Start</th>    
                <th style="text-align:center;width:120px;border:0px;background-color:#f3f3f3;">Finish</th>                
                <th style="text-align:center;width:140px;border:0px;background-color:#f3f3f3;">Actions</th>
                <th style="width:30px;border:0px;background-color:#f3f3f3;"></th>
            </tr>
        </table>
        <div id="releaseContentListId" style="width:100%;height:94px;overflow:scroll;">
            <table class="nopadding" style="width:100%;" cellpadding="0" cellspacing="0">
                <% Html.RenderPartial("~/Views/Sprint/ReadOnly.ascx"); %>
            </table>
        </div>        
    </div>       
    
</div>    