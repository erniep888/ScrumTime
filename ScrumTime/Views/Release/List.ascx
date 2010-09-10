<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.ReleaseCollectionViewModel>" %>

<div class="nopadding">
    <div class="nopadding" style="width:100%;background-color:#fff;font-family:Verdana;font-size:12px;border:1px solid #999;">
        <div id="Div3" style="height:34px;width:100%;background-color:#fff;font-family:Verdana;border-bottom:1px solid #999;">
            <div style="position:absolute;left:30px;width:115px;margin-top:10px">
                  <a href="#" class="simpleLink newStoryLink" onclick="addStoryRow();">Add Release</a>
            </div>            
            <div style="position:absolute;left:444px;width:80px;margin-top:0px;color:#79a52c;font-weight:bold;
                letter-spacing:1px;font-size:13px;text-align:left;">Releases</div>
            <div style="position:absolute;left:900px;width:50px;margin-top:10px;color:#00a;">Filter</div>
        </div>               
        <table class="nopadding" style="width:100%;color:#666" cellpadding="0" cellspacing="0">
            <tr>
                <th style="text-align:center;width:150px;border:0px;background-color:#eee;border-bottom:1px solid #999">Name</th>
                <th style="text-align:left;border:0px;background-color:#eee;border-bottom:1px solid #999">Description</th>
                <th style="text-align:center;width:300px;border:0px;background-color:#eee;border-bottom:1px solid #999">Target</th>    
                <th style="text-align:center;width:180px;border:0px;background-color:#eee;border-bottom:1px solid #999">Actions</th>
                <th style="width:30px;border:0px;background-color:#eee;border-bottom:1px solid #999"></th>
            </tr>
        </table>
        <div id="releaseContentListId" style="width:100%;height:94px;overflow:scroll;">
            <table class="nopadding" style="width:100%;" cellpadding="0" cellspacing="0">
                <tbody id="releaseTableBody_<%: Model.ProductId %>" style="font-size:12px;">
                <%
                    foreach (ScrumTime.Models.Release release in Model.Releases)
                    {
                        Html.RenderPartial("~/Views/Release/ReadOnly.ascx", release);
                    }
                %>      
                </tbody>          
            </table>
        </div>        
    </div>       
    
</div>    