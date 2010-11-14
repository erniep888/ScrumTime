<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.StoryViewModel>" %>
    <%
        decimal? taskHours = 0;
        if (Model.StoryModel.Tasks.Count() > 0)
        {
            taskHours = Model.StoryModel.Tasks.Sum(t => t.Hours);
        }
        
        string taskHourString = "";
        if (taskHours > 1 || taskHours == 0 || taskHours < 0)
            taskHourString = Decimal.ToInt32((decimal)taskHours) + " hrs";
        else
            taskHourString = "1 hr";
     %>
     <tr id="storyRow_<%: Model.StoryModel.StoryId %>" class="storyRow" style="border:0px" >
        <td style="padding:0" colspan="7">
            <table style="padding:0;width:100%;" cellpadding="0" cellspacing="0" width="100%">
                <tbody>
                    <tr>
                        <td style="vertical-align:middle;text-align:center;width:68px;border:0px;"><input id="storyPriority_<%: Model.StoryModel.StoryId %>" style="width:30px;text-align:center" type="text" value="<%: Model.StoryModel.Priority %>" /></td>
                        <td style="vertical-align:middle;text-align:center;border:0px;width:108px;"><textarea id="storyUserDefinedId_<%: Model.StoryModel.StoryId %>" rows="3" style="width:94%;font-family:Verdana;font-style:italic;vertical-align:middle;text-align:center;"><%: Model.StoryModel.UserDefinedId%></textarea></td>
                        <td style="border:0px;width:556px;"><textarea id="storyNarrative_<%: Model.StoryModel.StoryId %>" rows="3" style="width:100%;font-family:Verdana;"><%: Model.StoryModel.Narrative %></textarea></td>
                        <td style="vertical-align:middle;text-align:center;width:80px;border:0px;font-size:11px;"><div><%: taskHourString %></div></td>
                        <td style="vertical-align:middle;text-align:center;width:80px;border:0px;">
                            <select id="storyPoints_<%: Model.StoryModel.StoryId %>" style="text-align:left;font-family:Verdana;margin-right:4px;">
                            <%
                                foreach(var point in Model.Points)
                                {
                                    if (point == Model.StoryModel.Points)
                                    {
                                        %>
                                        <option value="<%: point %>" selected="selected"><%: point%></option>
                                        <%
                                    }
                                    else
                                    {
                                        %>
                                        <option value="<%: point %>"><%: point%></option>
                                        <%
                    
                                    }
                                }
                            %>            
                            </select>
                        </td>
                        <td style="vertical-align:middle;text-align:left;width:116px;font-weight:bold;color:#0035a0;border:0px;">    
                            <table border="0" cellpadding="0" cellspacing="0" style="padding:0;border:0;margin-left:24px" width="94px">
                                <tr>
                                    <td style="border:0px;">
                                        <a href="#" class="simpleLink" onclick="saveStoryRowEdit(<%: Model.StoryModel.StoryId %>, '<%: Url.Action(MVC.Story.Save()) %>');"><img alt="Save" src="<%: Links.Content.Images.Menu.save24x24_png %>" /></a>
                                    </td>
                                    <td style="border:0px">
                                        <a href="#" class="simpleLink" onclick="cancelStoryRowEdit(<%: Model.StoryModel.StoryId %>, '<%: Url.Action(MVC.Story.ReadOnly()) %>', '<%: Url.Action(MVC.Story.ListByPriority()) %>');">
                                            <img alt="Cancel" src="<%: Links.Content.Images.Menu.cancel24x24_png %>" /></a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="border:0px;width:auto"></td>  

                        <script type="text/javascript">           
                            setupEditStoryRow(<%: Model.StoryModel.StoryId %>, <%: Model.StoryModel.Priority %> );

                            $('storyRow_<%: Model.StoryModel.StoryId %>').ready(function () {
                                setAlternatingStoryBackgroundColors();
                            });
                        </script>
                    </tr>                    
                    <% Html.RenderPartial(MVC.Story.Views.Schedule, Model); %>
                </tbody>
            </table>
        </td>
    </tr>