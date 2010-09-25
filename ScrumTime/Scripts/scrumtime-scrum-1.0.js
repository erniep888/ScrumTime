function setupReadOnlyScrumRow(productId, scrumId) {
    $(".scrum_" + scrumId).click(function () {
        $.post('/Scrum/Edit',
            {
                id: sprintId
            },
            function (data) {
                $("#sprintTableBody_" + productId + " .sprintRow").removeClass("typicalAltRows");
                $('#sprintRow_' + sprintId).replaceWith(data);
                $("#sprintTableBody_" + productId + " .sprintRow:odd").addClass("typicalAltRows");
            }
        );
    });

    $(document).ready(function () {
        $("#sprintTableBody_" + productId + " .sprintRow:odd").addClass("typicalAltRows");
    });

    return;
}
