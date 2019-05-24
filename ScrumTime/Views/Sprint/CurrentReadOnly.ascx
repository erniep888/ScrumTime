﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Sprint>" %>
    <% 
        string sprintName = "None";
        if (Model != null && Model.SprintId > 0)
            sprintName = Model.Name;
    %>

    <div class="nopadding currentSprintContainer">
        <a class="simpleLink currentSprintLink" style="font-size:12px;color:#75a22a;" href="#"><%: sprintName %></a>
    </div>
    <script type="text/javascript">
        setupCurrentSprintReadOnly();
    </script>