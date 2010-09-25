<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<div id="scrumEditDialog" title="Scrum">
	<%--<div style="margin-top:0px;margin-left:0px;">
        <select id="scrumSprint_<%: Model.SprintId %>" style="text-align:left;font-family:Verdana;margin-right:4px;">
        <%
            foreach(ScrumTime.Models.Sprint sprint in Model.Sprints)
            {
                if (sprint.SprintId == Model.SprintId)
                {
                    %>
                    <option value="<%: sprint.SprintId %>" selected="selected"><%: sprint.Name %></option>
                    <%
                }
                else
                {
                    %>
                    <option value="<%: sprint.SprintId %>"><%: sprint.Name %></option>
                    <%
                    
                }
            }
        %>            
        </select>
    </div>--%>

	<form>
	<fieldset>
		<label for="name">Name</label>
		<input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all" />
		<label for="email">Email</label>
		<input type="text" name="email" id="email" value="" class="text ui-widget-content ui-corner-all" />
		<label for="password">Password</label>
		<input type="password" name="password" id="password" value="" class="text ui-widget-content ui-corner-all" />
	</fieldset>
	</form>
</div>

<script type="text/javascript">
    $("#scrumEditDialog").dialog({
        autoOpen: false,
        modal: true,
        height: 460,
        width: 850,
        buttons: {
            "Save": function () {
                alert("howdy");
                $(this).dialog("close");
            },
            Cancel: function () {
                $(this).dialog("close");
            }
        }

    });

    $("#scrumAddLink").click(function () {
        $("#scrumEditDialog").dialog("open");
        return false;
    });

</script>
