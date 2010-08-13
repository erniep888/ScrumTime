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
    <td style="vertical-align:middle;text-align:center;width:68px;border:0px;"><input id="storyPriority_<%: Model.StoryModel.StoryId %>" style="width:30px;text-align:center" type="text" value="<%: Model.StoryModel.Priority %>" /></td>
    <td style="vertical-align:middle;text-align:center;width:108px;border:0px;"><textarea id="storyUserDefinedId_<%: Model.StoryModel.StoryId %>" rows="3" style="width:100%;font-family:Verdana;font-style:italic;vertical-align:middle;text-align:center;"><%: Model.StoryModel.UserDefinedId%></textarea></td>
    <td style="width:520px;border:0px"><textarea id="storyNarrative_<%: Model.StoryModel.StoryId %>" rows="3" style="width:100%;font-family:Verdana;"><%: Model.StoryModel.Narrative %></textarea></td>
    <td style="vertical-align:middle;text-align:center;width:80px;border:0px;font-size:11px;"><div><%: taskHourString %></div></td>
    <td style="vertical-align:middle;text-align:right;width:80px;border:0px;">
        <select id="storyPoints_<%: Model.StoryModel.StoryId %>" style="text-align:left;width:50px;font-family:Verdana;margin-right:4px;">
        <%
            foreach(int point in Model.Points)
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
        </select></td>
    <td style="vertical-align:middle;text-align:center;width:114px;font-weight:bold;color:#0035a0;border:0px;">    
        <table border="1" cellpadding="0" cellspacing="0" style="padding:0;border:0;" width="100%">
            <tr>
                <td style="border:0px;">
                    <a href="#" class="simpleLink" onclick="saveStoryRowEdit('#storyRow_<%: Model.StoryModel.StoryId %>', <%: Model.StoryModel.StoryId %>);"><img alt="Save" src="../../Content/Images/Menu/save24x24.png" /></a>
                </td>
                <td style="border:0px">
                    <a href="#" class="simpleLink" onclick="cancelStoryRowEdit('#storyRow_<%: Model.StoryModel.StoryId %>', <%: Model.StoryModel.StoryId %>);">
                        <img alt="Cancel" src="../../Content/Images/Menu/cancel24x24.png" /></a>
                </td>
            </tr>
        </table>
    </td>

    <script type="text/javascript">           
        setupEditStoryRow(<%: Model.StoryModel.StoryId %>, <%: Model.StoryModel.Priority %> );
    </script>