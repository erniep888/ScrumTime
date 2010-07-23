<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Authenticating.Master" Inherits="System.Web.Mvc.ViewPage<ScrumTime.ViewModels.StoryCollectionViewModel>" %>

<asp:Content ID="StoryBacklogTitle" ContentPlaceHolderID="TitleContent" runat="server">
	Story Backlog
</asp:Content>

<asp:Content ID="StoryBacklogHeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="<%= Url.Content("~/Scripts/Story/StoryAjax.js") %>" type="text/javascript"></script>  
    <script type="text/javascript">
        loadJSON();
        setClickEvent_Narrative(2);
    </script>    
    <style type="text/css">
        td {padding-top:4px;padding-bottom:4px}
    </style>
</asp:Content>


<asp:Content ID="StoryBacklogMainContent" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.RenderPartial("~/Views/Project/ProjectSubMenu.ascx", Model); %>    

    <div style="margin-top:32px">
        <div id="Div3" style="height:24px;width:964px;background-color:#aaa;
            font-family:Verdana;font-size:12px;padding-top:6px">
            <%--<div style="position:absolute;left:26px;font-size:14px;font-weight:bold;color:#eee">Stories</div>--%>
            <div style="position:absolute;left:16px;width:115px;color:#00a;margin-top:0px">New Story</div>
            <div style="position:absolute;left:918px;width:50px;margin-top:0px;color:#00a;">Filter</div>
        </div>       
        <table style="width:964px;font-family:Verdana;padding:0;border:2px solid #999;height:30px;margin-left:0px;
            background-color:#4682b4;font-size:14px;color:#666;" cellpadding="0" cellspacing="0">
            <tr>
                <th style="text-align:center;width:78px;border:0px;">Priority</th>
                <th style="text-align:center;width:78px;border:0px;">ID</th>
                <th style="border:0px;width:548px">Narrative</th>                    
                <th style="text-align:center;width:80px;border:0px;">Points</th>
                <th style="text-align:center;width:194px;border:0px;">Actions</th>
                <th style="width:11px;border:0px;"></th>
            </tr>
        </table>
        <div style="width:960px;height:386px;border-left:2px solid #999;border-right:2px solid #aaa;
            border-bottom:2px solid #999;overflow:scroll;">
            <table style="width:943px;font-family:Verdana;padding:0" cellpadding="0" cellspacing="0">                
                <tbody style="font-size:12px;">
                    <tr id="row_1" style="background-color:#eee;">
                        <td class="story_1" style="vertical-align:middle;text-align:center;width:78px;border:0px;">1</td>
                        <td style="vertical-align:middle;text-align:center;width:78px;border:0px;">10</td>
                        <td class="story_1" style="border:0px;width:530px">As the author, I want to see the text in multiple fonts.</td>
                        <td class="story_1" style="vertical-align:middle;text-align:center;width:80px;border:0px;">8</td>
                        <td style="vertical-align:middle;text-align:center;width:194px;border:0px;">Delete | <span id="task_1">Tasks</span></td>
                    </tr>
                    <tr id="row_2">
                        <td class="story_2" style="vertical-align:middle;text-align:center;width:78px;border:0px;">2</td>
                        <td style="vertical-align:middle;text-align:center;width:78px;border:0px;">12</td>
                        <td class="story_2" style="border:0px;width:530px;">As the author, I want to see the top of the table of contents prior to opening a full book. (* Please also take note of the fonts for the table of contents. *)</td>
                        <td class="story_2" style="vertical-align:middle;text-align:center;width:80px;border:0px;">8</td>
                        <td style="vertical-align:middle;text-align:center;width:194px;border:0px;">Delete | Tasks</td>
                    </tr>
                </tbody>
            </table>
        </div>        
    </div>
</asp:Content>

