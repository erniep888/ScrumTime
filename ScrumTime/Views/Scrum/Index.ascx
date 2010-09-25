<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<script type="text/javascript">
    $(document).ready(function () {
        document.title = 'ScrumTime 0.9 - Scrum';
        renderScrumContentList();
    }); 
    </script> 


    <div style="margin-top:0px;margin-left:0px;">
        <div id="Div3" style="height:34px;width:960px;background-color:#fff;
            font-family:Verdana;font-size:12px;padding-top:6px;border-top:2px solid #999;border-left:2px solid #999;border-right:2px solid #999;">
            <div style="position:absolute;left:30px;width:115px;margin-top:10px">
                  <a href="#" class="simpleLink" onclick="addStoryRow();">Add Scrum</a>
            </div>            
            <div style="position:absolute;left:450px;width:80px;margin-top:0px;color:#79a52c;font-weight:bold;
                letter-spacing:1px;font-size:13px;text-align:left;">Scrums</div>
            <div style="position:absolute;left:918px;width:50px;margin-top:10px;color:#00a;">Filter</div>
        </div>       
        <table style="width:964px;font-family:Verdana;padding:0;border:2px solid #999;height:30px;margin-left:0px;
            background-color:#f3f3f3;font-size:12px;color:#666;" cellpadding="0" cellspacing="0">
            <tr>
                <th style="text-align:center;width:68px;border:0px;background-color:#f3f3f3;">Id</th>
                <th style="text-align:center;width:102px;border:0px;background-color:#f3f3f3;">Date Of Scrum</th>
                <th style="border:0px;width:490px;background-color:#f3f3f3;text-align:left;">Hours Completed</th>    
                <th style="text-align:center;width:80px;border:0px;background-color:#f3f3f3;">Hours Remaining</th>                
                <th style="text-align:center;width:97px;border:0px;background-color:#f3f3f3;">Actions</th>
                <th style="width:30px;border:0px;background-color:#f3f3f3;"></th>
            </tr>
        </table>
        <div id="scrumContentListId" style="width:960px;height:438px;border-left:2px solid #999;border-right:2px solid #aaa;
            border-bottom:2px solid #999;overflow:scroll;">
 
        </div>        
    </div>    

