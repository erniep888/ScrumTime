<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Authenticating.Master" Inherits="System.Web.Mvc.ViewPage<ScrumTime.ViewModels.StoryCollectionViewModel>" %>

<asp:Content ID="StoryBacklogTitle" ContentPlaceHolderID="TitleContent" runat="server">
	Story Backlog
</asp:Content>

<asp:Content ID="StoryBacklogHeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="<%: Url.Content("~/Scripts/Story.js") %>" type="text/javascript"></script>   
    <script src="<%: Url.Content("~/Scripts/Task.js") %>" type="text/javascript"></script>   
    <style type="text/css">
        td {padding-top:4px;padding-bottom:4px}
    </style>
</asp:Content>


<asp:Content ID="StoryBacklogMainContent" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.RenderPartial("~/Views/Project/ProjectSubMenu.ascx", Model); %>    

    <div style="margin-top:32px">
        <div id="Div3" style="height:24px;width:960px;background-color:white;
            font-family:Verdana;font-size:12px;padding-top:6px;border-top:2px solid #999;border-left:2px solid #999;border-right:2px solid #999;">
            <div style="position:absolute;left:16px;width:115px;margin-top:0px">
            <% if (Model.AddStory)
               { %>
                    <span style="color:#f22;font-size:12px;font-weight:bold;text-decoration:overline underline;">Add Story</span>
            <% }
               else
               { %>
                    <%: Html.ActionLink("Add Story", "AddStoryRow", "Story", null, new {@class="simpleLink"}) %>
            <% } %>
            </div>
            <div style="position:absolute;left:918px;width:50px;margin-top:0px;color:#00a;">Filter</div>
        </div>       
        <table style="width:964px;font-family:Verdana;padding:0;border:2px solid #999;height:30px;margin-left:0px;
            background-color:#f3f3f3;font-size:12px;color:#666;" cellpadding="0" cellspacing="0">
            <tr>
                <th style="text-align:center;width:68px;border:0px;background-color:#f3f3f3;">Priority</th>
                <th style="text-align:center;width:106px;border:0px;background-color:#f3f3f3;">Id/Name</th>
                <th style="border:0px;width:528px;background-color:#f3f3f3;">Narrative</th>                    
                <th style="text-align:center;width:80px;border:0px;background-color:#f3f3f3;">Points</th>
                <th style="text-align:center;width:194px;border:0px;background-color:#f3f3f3;">Actions</th>
                <th style="width:11px;border:0px;background-color:#f3f3f3;"></th>
            </tr>
        </table>
        <div style="width:960px;height:386px;border-left:2px solid #999;border-right:2px solid #aaa;
            border-bottom:2px solid #999;overflow:scroll;">
            <table class="storyTable" style="width:943px;font-family:Verdana;padding:0" cellpadding="0" cellspacing="0">                
                <tbody style="font-size:12px;">
                <%  
                    if (Model.AddStory)
                    {
                        ScrumTime.Models.Story newStory = new ScrumTime.Models.Story()
                        {
                            Points = 0, Priority = 0, ProjectId = Model.ProjectId, 
                            UserDefinedId = (Model.Stories.Count() + 1).ToString(),
                            Narrative = "As a ..."
                        };
                        ScrumTime.ViewModels.StoryViewModel newStoryViewModel = new ScrumTime.ViewModels.StoryViewModel()
                        {
                            StoryModel = newStory
                        };
                %>
                       <tr id="storyRow_0" class="storyRow" style="border:0px" >
                            <% Html.RenderPartial("~/Views/Story/AddStoryRow.ascx", newStoryViewModel); %>
                       </tr>

                <%
                    }
                    
                    int index = 1;                     
                                       
                    foreach (ScrumTime.Models.Story story in Model.Stories)
                    {
                       %>
                       <tr id="storyRow_<%: index %>" class="storyRow" style="border:0px" >
                            <% Html.RenderPartial("~/Views/Story/ReadOnlyRow.ascx", story); %>
                       </tr>
                       <%
                        index++;
                    }                               
                %>                      
                </tbody>
            </table>
        </div>        
    </div>
</asp:Content>

