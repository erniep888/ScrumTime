<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Release>" %>

    <tr style="font-size:10px">
        <td style="text-align:center;width:151px;border:0px;"><%: Model.Name %></td>
        <td style="text-align:left;border:0px;"><%: Model.Description %></td>
        <td style="text-align:center;width:300px;border:0px;"><%: Model.Target.ToString("MM/dd/yyyy") %></td>                  
        <td style="text-align:center;width:142px;border:0px;"><a href="#" class="simpleLink" onclick="deleteStory(<%: Model.ReleaseId %>);"><img
                                        alt="Delete" style="" src="../../Content/Images/Menu/trash.png" width="16" height="16"/></a></td>
        <td style="width:10px;border:0px;"></td>
    </tr>

