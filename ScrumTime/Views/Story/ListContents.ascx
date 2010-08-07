<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.StoryCollectionViewModel>" %>

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
                    
            foreach (ScrumTime.Models.Story story in Model.Stories)
            {
                %>
                <tr id="storyRow_<%: story.StoryId %>" class="storyRow" style="border:0px" >
                    <% Html.RenderPartial("~/Views/Story/ReadOnlyRow.ascx", story); %>
                </tr>
                <%
            }                               
            %>                      
        </tbody>
    </table>