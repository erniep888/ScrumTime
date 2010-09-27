function setupReadOnlyScrumRow(scrumId) {
    $(".scrum_" + scrumId).click(function () {
        $.post('/Scrum/Edit',
            {
                id: sprintId
            },
            function (data) {
                $("#scrumTableBody_" + scrumId + " .scrumRow").removeClass("typicalAltRows");
                $('#scrumRow_' + sprintId).replaceWith(data);
                $("#scrumTableBody_" + scrumId + " .scrumRow:odd").addClass("typicalAltRows");
            }
        );
    });


    $("#scrumSelectedSprint").change(function () {
        $.post('/Sprint/ChangeSprint',
            {
                id: $("#scrumSelectedSprint").val()
            }
        );
    });
//    $(document).ready(function () {
//       $("#scrumTableBody " .scrumRow:odd").addClass("typicalAltRows");
//    });
    return;
}


function setAlternatingScrumBackgroundColors() {
    $(".scrumTable .scrumRow").removeClass("typicalAltRows");
    $(".scrumTable .scrumRow:odd").addClass("typicalAltRows");
}

function setupScrumEditDialog() {
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
        var currentSprintName = "";
        $.ajax({
            url: '/Sprint/CurrentSprintName',
            dataType: 'json',
            success: function (json) {
                $('#scrumEditDialog').dialog({ title: 'Scrum For Sprint ' + json.d });
            },
            cache: false
        });

        // Fetch the edit content
        fetchScrumInformationForEdit(-1);
        return;
    });
}

function fetchScrumInformationForEdit(scrumId) {
    $.ajax({
        url: '/Scrum/Edit',
        cache: false,
        type: "GET",
        data: ({ id: scrumId }),
        dataType: "html",
        success: function (html) {
            $('#scrumEditDialog').html(html);            
            $('#scrumEditDialog').ready(function () {
                $('#scrumEditDialog').dialog("open");
            });
        },
        async: true
    });

}