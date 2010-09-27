<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.Models.Scrum>" %>

    <div>
        Date of Scrum:
        <input type="text" id="dateOfScrum_<%: Model.ScrumId %>" size="11" style="text-align:center" value="<%: Model.DateOfScrum.ToString("MM/dd/yyyy") %>" />
    </div>
    <div>
        <table>
            <tbody>
                <tr>
                    <td>Task Description</td>
                    <td>Assigned To</td>
                    <td>Hours Completed</td>
                    <td>Hours Remaining</td>
                </tr>                
            </tbody>
        </table>
    </div>
	<div>
        <table>
            <tbody>
                <tr>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <script type="text/javascript">
        loadScrumEditTitle();
    </script>


