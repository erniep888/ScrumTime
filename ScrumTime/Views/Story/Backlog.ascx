<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.StoryCollectionViewModel>" %>
<script type="text/javascript">
    $(document).ready(function () {
        document.title = '<%: Model.Title %>';
    });
</script>
<div style="margin-top: 0px; margin-left: 0px;">
    <div id="Div3" style="height: 34px; width: 100%; min-width: 990px; background-color: #fff;
        font-family: Verdana; font-size: 12px; padding-top: 6px; border-top: 2px solid #999;
        border-left: 2px solid #999; border-right: 2px solid #999;">
        <div style="float: left; margin-left: 8px; margin-top: 10px;">
            <a href="#" class="simpleLink" onclick="addStoryRow('<%: Url.Action(MVC.Story.New()) %>');">Add Story</a>
        </div>
        <div style="color: #79a52c; font-weight: bold; letter-spacing: 1px; font-size: 13px;
            text-align: center; width: 100%;">
            Stories</div>
        <div style="float: right; margin-top: -10px; margin-right: 6px; color: #00a;">
            Filter</div>
    </div>
    <div style="border: 2px solid #999; height: 30px; margin-left: 0px; width: 100%;
        min-width: 990px;">
        <table style="font-family: Verdana; padding: 0; margin-left: 0px; padding-top: 3px;
            background-color: #f3f3f3; font-size: 12px; color: #666; width: 100%; min-width: 990px;"
            cellpadding="0" cellspacing="0">
            <tr>
                <td style="text-align: center; width: 68px; border: 0px; background-color: #f3f3f3;
                    font-weight: bold">
                    Priority
                </td>
                <td style="text-align: center; width: 108px; border: 0px; background-color: #f3f3f3;
                    font-weight: bold">
                    Id/Name
                </td>
                <td style="border: 0px; width: 556px; background-color: #f3f3f3; text-align: left;
                    font-weight: bold">
                    Narrative
                </td>
                <td style="text-align: center; width: 80px; border: 0px; background-color: #f3f3f3;
                    font-weight: bold">
                    Duration
                </td>
                <td style="text-align: center; width: 80px; border: 0px; background-color: #f3f3f3;
                    font-weight: bold">
                    Points
                </td>
                <td style="text-align: center; width: 116px; border: 0px; background-color: #f3f3f3;
                    font-weight: bold">
                    Actions
                </td>
                <td style="border: 0px;">
                </td>
            </tr>
        </table>
    </div>
    <div id="storyContentListId" style="width: 100%; min-width: 990px; height: 538px;
        border-left: 2px solid #999; border-right: 2px solid #aaa; border-bottom: 2px solid #999;
        overflow: scroll;">
        <% Html.RenderPartial(MVC.Story.Views.List, Model); %>
    </div>
</div>
