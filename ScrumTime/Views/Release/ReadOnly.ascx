<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Release>" %>

    <tr id="releaseRow_<%: Model.ReleaseId %>" class="releaseRow" style="font-size:10px">
        <td class="release_<%: Model.ReleaseId %>" style="text-align:center;width:151px;border:0px;"><a class="simpleLink" href="#"><%: Model.Name %></a></td>
        <td class="release_<%: Model.ReleaseId %>" style="text-align:left;border:0px;"><a class="simpleLink" href="#"><%: Model.Description %></a></td>
        <td class="release_<%: Model.ReleaseId %>" style="text-align:center;width:300px;border:0px;"><a class="simpleLink" href="#"><%: Model.Target.ToString("MM/dd/yyyy") %></a></td>                  
        <td style="text-align:center;width:182px;border:0px;"><a href="#" class="simpleLink" onclick="deleteRelease(<%: Model.ProductId %>, <%: Model.ReleaseId %>);"><img
                                        alt="Delete" style="" src="../../Content/Images/Menu/trash.png" width="16" height="16"/></a></td>
        <td style="width:10px;border:0px;"></td>
        <script type="text/javascript">           
            setupReadOnlyReleaseRow(<%: Model.ProductId %>, <%: Model.ReleaseId %>);
        </script>
    </tr>

