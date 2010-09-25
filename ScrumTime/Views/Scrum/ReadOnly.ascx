<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Scrum>" %>
    <%
        string scrumDate = Model.DateOfScrum.ToString("MM/dd/yyyy");
        decimal hoursCompleted = Model.ScrumDetails.Sum(s => s.HoursCompleted);
        decimal hoursRemaining = Model.ScrumDetails.Sum(s => s.HoursRemaining);
        
     %>

    <tr id="scrumRow_<%: Model.ScrumId %>" class="scrumRow">
        <td class="scrum_<%: Model.ScrumId %>" style="vertical-align:middle;text-align:center;width:80px;border:0px;font-size:11px;""><a class="simpleLink" href="#"><%: Model.ScrumId %></a></td>
        <td class="scrum_<%: Model.ScrumId %>" style="border:0px;"><a class="simpleLink" href="#"><%: scrumDate %></a></td>
        <td class="scrum_<%: Model.ScrumId %>" style="vertical-align:middle;text-align:center;width:80px;border:0px;font-size:11px;"><a class="simpleLink" href="#"><%: hoursCompleted %></a></td>
        <td class="scrum_<%: Model.ScrumId %>" style="vertical-align:middle;text-align:center;width:80px;border:0px;font-size:11px;"><a class="simpleLink" href="#"><%: hoursRemaining %></a></td>
        <td style="vertical-align:middle;text-align:center;width:194px;border:0px;font-size:11px;">
            <a href="#" class="simpleLink" onclick="deleteScrum(<%: Model.ScrumId %>);"><img alt="Delete" style="" src="../../Content/Images/Menu/trash.png" /></a>
        </td>
        <script type="text/javascript">           
            setupReadOnlyScrumRow(<%: Model.ScrumId %>);
        </script>
    </tr>