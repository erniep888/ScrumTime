<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Release>" %>

<tr id="releaseRow_<%: Model.ReleaseId %>" class="releaseRow" style="font-size:10px">
    <td class="releaseRow_<%: Model.ReleaseId %>" style="text-align:center;width:151px;border:0px;"><input id="releaseName_<%: Model.ReleaseId %>" style="width:90px;text-align:center" type="text" value="<%: Model.Name %>" /></td>
    <td class="releaseRow_<%: Model.ReleaseId %>" style="text-align:left;border:0px;"><textarea id="releaseDescription_<%: Model.ReleaseId %>" rows="3" style="width:100%;font-family:Verdana;"><%: Model.Description %></textarea></td>
    <td class="releaseRow_<%: Model.ReleaseId %>" style="text-align:center;width:300px;border:0px;"><input type="text" id="releaseTarget_<%: Model.ReleaseId %>" size="11" style="text-align:center" value="<%: Model.Target.ToString("MM/dd/yyyy") %>" /></td>                  
    <td style="vertical-align:middle;text-align:center;width:142px;border:0px;">    
            <table border="1" cellpadding="0" cellspacing="0" style="padding:0;border:0;margin-left:40px" width="100px">
                <tr>
                    <td style="border:0px;">
                        <a href="#" class="simpleLink" onclick="saveStoryRowEdit(<%: Model.ReleaseId %>);"><img alt="Save" src="../../Content/Images/Menu/save24x24.png"  width="16" height="16"/></a>
                    </td>
                    <td style="border:0px">
                        <a href="#" class="simpleLink" onclick="cancelStoryRowEdit(<%: Model.ReleaseId %>);">
                            <img alt="Cancel" src="../../Content/Images/Menu/cancel24x24.png"  width="16" height="16"/></a>
                    </td>
                </tr>
            </table>
        </td>
    <td style="width:10px;border:0px;"></td>
</tr>