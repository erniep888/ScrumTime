<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Sprint>" %>
<tr id="sprintRow_<%: Model.SprintId %>" class="sprintRow" style="font-size: 10px">
    <td class="sprintRow_<%: Model.SprintId %>" style="text-align: center; width: 151px;
        border: 0px;">
        <input id="sprintName_<%: Model.SprintId %>" style="width: 90px; text-align: center"
            type="text" value="<%: Model.Name %>" />
    </td>
    <td class="sprintRow_<%: Model.SprintId %>" style="text-align: left; border: 0px;">
        <textarea id="sprintDescription_<%: Model.SprintId %>" rows="3" style="width: 100%;
            font-family: Verdana;"><%: Model.Description %></textarea>
    </td>
    <td class="sprintRow_<%: Model.SprintId %>" style="text-align: center; width: 120px;
        border: 0px;">
        <input type="text" id="sprintStart_<%: Model.SprintId %>" size="11" style="text-align: center"
            value="<%: Model.StartDate.ToString("MM/dd/yyyy") %>" />
    </td>
    <td class="sprintRow_<%: Model.SprintId %>" style="text-align: center; width: 120px;
        border: 0px;">
        <input type="text" id="sprintFinish_<%: Model.SprintId %>" size="11" style="text-align: center"
            value="<%: Model.FinishDate.ToString("MM/dd/yyyy") %>" />
    </td>
    <td style="vertical-align: middle; text-align: center; width: 130px; border: 0px;">
        <table border="1" cellpadding="0" cellspacing="0" style="padding: 0; border: 0; margin-left: 18px"
            width="100px">
            <tr>
                <td style="border: 0px;">
                    <a href="#" class="simpleLink" onclick="saveSprintRowEdit(<%: Model.ProductId %>, <%: Model.SprintId %>, '<%: Url.Action(MVC.Sprint.Save()) %>', '<%: Url.Action(MVC.Schedule.UpdateCalendar()) %>');">
                        <img alt="Save" src="<%: Links.Content.Images.Menu.save24x24_png %>" width="16" height="16" /></a>
                </td>
                <td style="border: 0px">
                    <a href="#" class="simpleLink" onclick="cancelSprintRowEdit(<%: Model.ProductId %>, <%: Model.SprintId %>, '<%: Url.Action(MVC.Sprint.ReadOnly()) %>');">
                        <img alt="Cancel" src="<%: Links.Content.Images.Menu.cancel24x24_png %>" width="16"
                            height="16" /></a>
                </td>
            </tr>
        </table>
    </td>
    <td style="width: 10px; border: 0px;">
    </td>
    <script type="text/javascript">           
        setupSprintCalendarControl(<%: Model.SprintId %>);
    </script>
</tr>
