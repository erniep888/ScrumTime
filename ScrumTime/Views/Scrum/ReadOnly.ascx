<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.ScrumViewModel>" %>
    <%
        string scrumDate = Model.ScrumModel.DateOfScrum.ToString("MM/dd/yyyy");
        decimal hoursCompleted = Model.ScrumModel.ScrumDetails.Sum(s => s.HoursCompleted);
        decimal hoursRemaining = Model.ScrumModel.ScrumDetails.Sum(s => s.HoursRemaining);
        
     %>

    <tr id="scrumRow_<%: Model.ScrumModel.ScrumId %>" class="scrumRow">
        <td class="scrum_<%: Model.ScrumModel.ScrumId %>" style="vertical-align:middle;text-align:center;width:100px;border:0px;font-size:11px;""><a class="simpleLink" href="#"><%: Model.Index %></a></td>
        <td class="scrum_<%: Model.ScrumModel.ScrumId %>" style="vertical-align:middle;text-align:center;width:210px;border:0px;font-size:11px;"><a class="simpleLink" href="#"><%: scrumDate %></a></td>
        <td class="scrum_<%: Model.ScrumModel.ScrumId %>" style="vertical-align:middle;text-align:center;width:180px;border:0px;font-size:11px;"><a class="simpleLink" style="color:#79a52c;" href="#"><%: hoursCompleted %></a></td>
        <td class="scrum_<%: Model.ScrumModel.ScrumId %>" style="vertical-align:middle;text-align:center;width:180px;border:0px;font-size:11px;"><a class="simpleLink" style="color:Red;" href="#"><%: hoursRemaining %></a></td>
        <td style="vertical-align:middle;text-align:center;border:0px;font-size:11px;">
            <a href="#" class="simpleLink" onclick="deleteScrum(<%: Model.ScrumModel.ScrumId %>);"><img alt="Delete" style="" src="../../Content/Images/Menu/trash.png" /></a>
        </td>
        <script type="text/javascript">           
            setupReadOnlyScrumRow(<%: Model.ScrumModel.ScrumId %>);
        </script>
    </tr>