<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.SprintCollectionViewModel>" %>

    <div id="sprintContentListId_<%: Model.ProductId %>" style="width:100%;height:94px;overflow:scroll;">
        <table id="sprintTable_<%: Model.ProductId %>" class="nopadding" style="width:100%;" cellpadding="0" cellspacing="0">
            <tbody id="sprintTableBody_<%: Model.ProductId %>" style="font-size:12px;">
            <%
                foreach (ScrumTime.Models.Sprint sprint in Model.Sprints)
                {
                    Html.RenderPartial("~/Views/Sprint/ReadOnly.ascx", sprint);
                }
            %>      
            </tbody>          
        </table>
    </div>        
   