<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<div class="nopadding">
    <div class="nopadding" style="width:100%;background-color:#fff;font-family:Verdana;font-size:12px;border:1px solid #999;">
        <ul class="nopadding" style="list-style-type:none;width:100%;">
            <li style="display:inline"><a href="#" class="simpleLink" onclick="addStoryRow();">Add Release</a></li>
            <li style="display:inline">Releases</li>
            <li style="display:inline">Filter</li>
        </ul>
        <table class="nopadding" style="width:100%;" cellpadding="0" cellspacing="0">
            <tr>
                <th style="text-align:center;width:68px;border:0px;background-color:#f3f3f3;">Name</th>
                <th style="text-align:center;width:102px;border:0px;background-color:#f3f3f3;">Description</th>
                <th style="border:0px;width:490px;background-color:#f3f3f3;text-align:left;">Start</th>    
                <th style="text-align:center;width:80px;border:0px;background-color:#f3f3f3;">Finish</th>                
                <th style="text-align:center;width:97px;border:0px;background-color:#f3f3f3;">Actions</th>
                <th style="width:30px;border:0px;background-color:#f3f3f3;"></th>
            </tr>
        </table>
        <div id="releaseContentListId" style="width:100%;height:48px;overflow:scroll;">
        </div>        
    </div>       
    
</div>    