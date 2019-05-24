﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.ScrumViewModel>" %>
<div id="scrumEditDialogContainer" class="nopadding">
    <div id="scrumEditDialog" title="Scrum For Sprint">
	    <div style="margin-top:10px;margin-left:0px;padding:0;width:816px;
		    border-top:2px solid #999;border-left:2px solid #999;border-right:2px solid #999;
		    height:30px;">
		    <div style="position:absolute;left:305px;width:115px;margin-top:6px;
			    color:#79a52c;font-weight:bold;font-size:11px;">Date of Scrum:</div>
		    <div style="position:absolute;left:409px;margin-top:6px;font-size:11px;">
			    <input type="text" id="dateOfScrum" size="11" style="text-align:center" tabindex="-1"
			    value="<%: Model.ScrumModel.DateOfScrum.ToString("MM/dd/yyyy") %>" />
		    </div>
	    </div>
	    <table style="width:820px;font-family:Verdana;padding:0;border:2px solid #999;height:30px;margin-left:0px;
			    background-color:#f3f3f3;font-size:12px;color:#666;" cellpadding="0" cellspacing="0">
		    <tr>
			    <th style="text-align:left;border:0px;background-color:#f3f3f3;padding-left:3px">Task Description</th>
			    <th style="text-align:center;width:180px;border:0px;background-color:#f3f3f3;">Assigned To</th>
			    <th style="text-align:center;width:100px;border:0px;background-color:#f3f3f3;">Hours Completed</th>    
			    <th style="text-align:center;width:100px;border:0px;background-color:#f3f3f3;">Hours Remaining</th>                
			    <th style="width:30px;border:0px;background-color:#f3f3f3;"></th>
		    </tr>
	    </table>
	    <div style="margin-top:0px;margin-left:0px;padding:0;width:816px;
		    border-bottom:2px solid #999;border-left:2px solid #999;border-right:2px solid #999;
		    height:294px;overflow:scroll">
		    <table class="scrumDetailTable" style="width:799px;font-family:Verdana;padding:0" cellpadding="0" cellspacing="0">
			    <tbody style="font-size:11px;">
				    <%
					    int index = 0;
					    foreach (ScrumTime.Models.ScrumDetail scrumDetail in Model.ScrumModel.ScrumDetails)
					    {
						
						    %>
						    <tr class="scrumDetailRow">
							    <td id="scrumDetailStoryTaskDescription_<%: index %>" style="text-align:left;width:404px;border:0px;padding-left:3px"><%: scrumDetail.StoryTaskDescription %></td>
							    <td style="text-align:center;width:180px;border:0px;">
								    <select id="scrumDetailAssignedTo_<%: index %>" 
								    style="text-align:left;font-family:Verdana;margin-right:4px;">
								    <%
									    foreach (string username in Model.MemberUsernames)
									    {
										    if (scrumDetail.AssignedTo == username)
										    {
											    %>
											    <option value="<%: username %>" selected="selected"><%: username %></option>
											    <%
										    }
										    else
										    {
											    %>
											    <option value="<%: username %>"><%: username %></option>
											    <%
					
										    }
									    }
								    %>            
								    </select>
							    </td>
							    <td style="text-align:center;width:100px;border:0px;">
								    <input id="scrumDetailHrsComp_<%: index %>" style="width:40px;text-align:center;color:#79a52c;" type="text" value="<%: scrumDetail.HoursCompleted %>" />                                
							    </td>    
							    <td style="text-align:center;width:100px;border:0px;">
								    <input id="scrumDetailHrsRem_<%: index %>" style="width:40px;text-align:center;color:Red;" type="text" value="<%: scrumDetail.HoursRemaining %>" />                                
							    </td>                
							    <td style="width:15px;border:0px;">
								    <input type="hidden" id="scrumDetailTaskId_<%: index %>" name="scrumDetailTaskId_<%: index %>" value="<%: scrumDetail.TaskId %>" />
							    </td>
							
						    </tr>                        
						    <%
						    index++;
					    }
					     %>
				
			    </tbody>
		    </table>
		    <input type="hidden" id="scrumDetailCount" name="scrumDetailCount" value="<%: Model.ScrumModel.ScrumDetails.Count() %>" />
		    <input type="hidden" id="scrumDetailSprintId" name="scrumDetailSprintId" value="<%: Model.ScrumModel.SprintId %>" />
		    <input type="hidden" id="scrumDetailScrumId" name="scrumDetailScrumId" value="<%: Model.ScrumModel.ScrumId %>" />
	    </div>
    </div>
</div>


	<script type="text/javascript">
	    setupScrumEditDialog();
		loadScrumEditTitle();
		setAlternatingScrumDetailBackgroundColors();
		setupDateOfScrumDatePicker();        
	</script>

