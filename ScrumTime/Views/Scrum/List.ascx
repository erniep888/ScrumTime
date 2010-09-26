<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.ScrumCollectionViewModel>" %>

    <table class="scrumTable" style="width:943px;font-family:Verdana;padding:0" cellpadding="0" cellspacing="0">                
        <tbody id="scrumTableBody" style="font-size:12px;">
            <%  
            foreach (ScrumTime.Models.Scrum scrum in Model.Scrums)
            {
                Html.RenderPartial("~/Views/Scrum/ReadOnly.ascx", scrum); 
            }                               
            %>                      
        </tbody>
    </table>

    <script type="text/javascript">
        $('.scrumTable').ready(function () {
            setAlternatingScrumBackgroundColors();
        });
    </script>