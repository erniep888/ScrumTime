<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.SprintCollectionViewModel>" %>

    <div class="nopadding currentSprintContainer">
        <select id="currentSprintSelected" style="text-align:left;font-family:Verdana;margin-right:4px;" 
                onblur="revertCurrentSprintToReadOnly();" onchange="onCurrentSprintChange();" onfocus="onCurrentSprintFocus();">
            <%
                foreach (ScrumTime.Models.Sprint sprint in Model.Sprints)
                {
                    if (sprint.SprintId == Model.CurrentSprintId)
                    { %>
                        <option value="<%: sprint.SprintId %>" selected="selected"><%: sprint.Name%></option>	
                 <% }
                    else
                    { %>
                        <option value="<%: sprint.SprintId %>"><%: sprint.Name %></option>	
                 <% }
                }
            %>
		</select>
    </div>    