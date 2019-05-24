﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Sprint>" %>

     <tr id="sprintRow_<%: Model.SprintId %>" class="sprintRow" style="font-size:10px">
        <td class="sprint_<%: Model.SprintId %>" style="text-align:center;width:151px;border:0px;"><a class="simpleLink" href="#"><%: Model.Name %></a></td>
        <td class="sprint_<%: Model.SprintId %>" style="text-align:left;border:0px;"><a class="simpleLink" href="#"><%: Model.Description %></a></td>
        <td class="sprint_<%: Model.SprintId %>" style="text-align:center;width:120px;border:0px;"><a class="simpleLink" href="#"><%: Model.StartDate.ToString("MM/dd/yyyy") %></a></td>                  
        <td class="sprint_<%: Model.SprintId %>" style="text-align:center;width:120px;border:0px;"><a class="simpleLink" href="#"><%: Model.FinishDate.ToString("MM/dd/yyyy") %></a></td>                  
        <td style="text-align:center;width:140px;border:0px;"><a href="#" class="simpleLink" onclick="deleteSprint(<%: Model.ProductId %>, <%: Model.SprintId %>);"><img
                                        alt="Delete" style="" src="../../Content/Images/Menu/trash.png" width="16" height="16"/></a></td>
        <td style="width:10px;border:0px;"></td>
        <script type="text/javascript">           
            setupReadOnlySprintRow(<%: Model.ProductId %>, <%: Model.SprintId %>);
        </script>
    </tr>