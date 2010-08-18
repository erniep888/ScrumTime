<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ScrumTime.Master" Inherits="System.Web.Mvc.ViewPage<ScrumTime.ViewModels.StoryCollectionViewModel>" %>

<asp:Content ID="StoryBacklogTitle" ContentPlaceHolderID="TitleContent" runat="server">
	Story Backlog
</asp:Content>

<asp:Content ID="StoryBacklogHeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="<%: Url.Content("~/Scripts/scrumtime-story-1.0.js") %>" type="text/javascript"></script>   
    <script src="<%: Url.Content("~/Scripts/scrumtime-task-1.0.js") %>" type="text/javascript"></script>   
    <style type="text/css">
        td {padding-top:4px;padding-bottom:4px}
    </style>
</asp:Content>

<asp:Content ID="StoryBacklogMainContent" ContentPlaceHolderID="MainContent" runat="server">    
    <div style="margin-top:22px;margin-left:13px;">
        <div id="Div3" style="height:34px;width:960px;background-color:#fff;
            font-family:Verdana;font-size:12px;padding-top:6px;border-top:2px solid #999;border-left:2px solid #999;border-right:2px solid #999;">
            <div style="position:absolute;left:24px;width:115px;margin-top:10px">
                  <a href="#" class="simpleLink newStoryLink" onclick="addStoryRow();">Add Story</a>
            </div>            
            <div style="position:absolute;left:450px;width:80px;margin-top:0px;color:#79a52c;font-weight:bold;
                letter-spacing:1px;font-size:13px;text-align:left;">Stories</div>
            <div style="position:absolute;left:918px;width:50px;margin-top:10px;color:#00a;">Filter</div>
        </div>       
        <table style="width:964px;font-family:Verdana;padding:0;border:2px solid #999;height:30px;margin-left:0px;
            background-color:#f3f3f3;font-size:12px;color:#666;" cellpadding="0" cellspacing="0">
            <tr>
                <th style="text-align:center;width:68px;border:0px;background-color:#f3f3f3;">Priority</th>
                <th style="text-align:center;width:102px;border:0px;background-color:#f3f3f3;">Id/Name</th>
                <th style="border:0px;width:490px;background-color:#f3f3f3;text-align:left;">Narrative</th>    
                <th style="text-align:center;width:80px;border:0px;background-color:#f3f3f3;">Duration</th>                
                <th style="text-align:center;width:80px;border:0px;background-color:#f3f3f3;">Points</th>
                <th style="text-align:center;width:97px;border:0px;background-color:#f3f3f3;">Actions</th>
                <th style="width:30px;border:0px;background-color:#f3f3f3;"></th>
            </tr>
        </table>
        <div id="storyContentListId" style="width:960px;height:438px;border-left:2px solid #999;border-right:2px solid #aaa;
            border-bottom:2px solid #999;overflow:scroll;">
            <% Html.RenderPartial("~/Views/Story/List.ascx", Model); %>    
        </div>        
    </div>
    <script type="text/javascript">
        loadBacklogTab();        
    </script>
</asp:Content>

