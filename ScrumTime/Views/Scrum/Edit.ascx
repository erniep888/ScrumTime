<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.ScrumCollectionViewModel>" %>

<div id="scrumEditDialog" title="Scrum">

    <div>
        Date of Scrum:
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
