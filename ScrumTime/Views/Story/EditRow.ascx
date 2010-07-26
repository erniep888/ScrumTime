<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Story>" %>
    <td style="vertical-align:middle;text-align:center;width:78px;border:0px;"><%= Model.StoryId %></td>
    <td style="vertical-align:middle;text-align:center;width:78px;border:0px;"><textarea rows="3" style="width:100%;font-family:Verdana;"><%= Model.UserDefinedId %></textarea></td>
    <td style="width:540px;"><textarea rows="3" style="width:100%;font-family:Verdana;"><%= Model.Narrative %></textarea></td>
    <td style="vertical-align:middle;text-align:center;width:80px;border:0px;">
        <select style="text-align:center;width:50px;font-family:Verdana">
            <option value="0">0</option>
            <option value="1">1</option>
            <option value="3">3</option>
            <option value="5">5</option>
            <option value="8" selected="selected">8</option>
            <option value="100">100</option>
        </select></td>
    <td style="vertical-align:middle;text-align:center;width:194px;font-weight:bold;color:#0035a0;border:0px;">Save | <a href="#" class="noticableLink" onclick="cancelRowEdit('#row_<%= Model.StoryId %>', <%= Model.StoryId %>);">Cancel</span></td>