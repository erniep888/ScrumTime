<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.StoryViewModel>" %>
    <td style="vertical-align:middle;text-align:center;width:68px;border:0px;"><input style="width:30px;text-align:center" type="text" value="<%= Model.StoryModel.Priority %>" /></td>
    <td style="vertical-align:middle;text-align:center;width:108px;border:0px;"><textarea rows="3" style="width:100%;font-family:Verdana;color:#860;"><%= Model.StoryModel.UserDefinedId%></textarea></td>
    <td style="width:520px;border:0px"><textarea rows="3" style="width:100%;font-family:Verdana;"><%= Model.StoryModel.Narrative %></textarea></td>
    <td style="vertical-align:middle;text-align:center;width:80px;border:0px;">
        <select style="text-align:center;width:50px;font-family:Verdana">
        <%
            foreach(int point in Model.Points)
            {
                if (point == Model.StoryModel.Points)
                {
                %>
                <option value="<%= point %>" selected="selected"><%= point%></option>
                <%
}
                else
                {
                %>
                <option value="<%= point %>"><%= point%></option>
                <%
                    
                }
            }
        %>            
        </select></td>
    <td style="vertical-align:middle;text-align:center;width:194px;font-weight:bold;color:#0035a0;border:0px;">Save | <a href="#" class="noticableLink" onclick="cancelRowEdit('#row_<%= Model.StoryModel.StoryId %>', <%= Model.StoryModel.StoryId %>, <%= Model.StoryModel.Priority %>);">Cancel</span></td>