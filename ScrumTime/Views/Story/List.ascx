<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.StoryCollectionViewModel>" %>
<table class="storyTable" style="width: 100%; min-width: 990px; font-family: Verdana;
    padding: 0" cellpadding="0" cellspacing="0">
    <tbody id="storyTableBody" style="font-size: 12px;">
        <%  
            foreach (var story in Model.Stories)
            {
                Html.RenderPartial(MVC.Story.Views.ReadOnly, story);
            }                               
        %>
    </tbody>
</table>
<script type="text/javascript">
    $('.storyTable').ready(function () {
        setAlternatingStoryBackgroundColors();
    });
</script>
