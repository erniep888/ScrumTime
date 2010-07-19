<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Story>" %>
<div id="storyId_1">
    <div id="storyNarrativeId_1" style="position:absolute;left:20px;width:200px;">
        <%= Model.Narrative %>
    </div>
    <div id="storyPointsId_1" style="position:absolute;left:230px;width:100px;">
        45 points
    </div>
    <div id="storyTasks_1" style="position:relative;left:330px;">
        <a href="#">Tasks</a>
    </div>
</div>
