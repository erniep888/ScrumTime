<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Release>" %>

    <tr style="font-size:10px">
        <td class="release_<%: Model.ReleaseId %>" style="text-align:center;width:151px;border:0px;"><a class="simpleLink" href="#"><%: Model.Name %></a></td>
        <td class="release_<%: Model.ReleaseId %>" style="text-align:left;border:0px;"><a class="simpleLink" href="#"><%: Model.Description %></a></td>
        <td class="release_<%: Model.ReleaseId %>" style="text-align:center;width:300px;border:0px;"><a class="simpleLink" href="#"><%: Model.Target.ToString("MM/dd/yyyy") %></a></td>                  
        <td style="text-align:center;width:142px;border:0px;"><a href="#" class="simpleLink" onclick="deleteStory(<%: Model.ReleaseId %>);"><img
                                        alt="Delete" style="" src="../../Content/Images/Menu/trash.png" width="16" height="16"/></a></td>
        <td style="width:10px;border:0px;"></td>
    </tr>

