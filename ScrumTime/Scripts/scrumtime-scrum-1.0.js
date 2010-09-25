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

//    $(document).ready(function () {
//       $("#scrumTableBody " .scrumRow:odd").addClass("typicalAltRows");
//    });
    return;
}


function setAlternatingScrumBackgroundColors() {
    $(".scrumTable .scrumRow").removeClass("typicalAltRows");
    $(".scrumTable .scrumRow:odd").addClass("typicalAltRows");
}