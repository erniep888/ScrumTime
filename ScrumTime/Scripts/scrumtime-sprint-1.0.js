function setupReadOnlySprintRow(productId, sprintId) {
    $(".sprint_" + sprintId).click(function () {
        $.post('/Sprint/Edit',
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

function cancelSprintRowEdit(productId, sprintId) {
    if (sprintId > 0) {
        $.post('/Sprint/ReadOnly',
            {
                id: sprintId
            },
            function (data) {
                $('#sprintRow_' + sprintId).replaceWith(data);
            }
        );
    }
        else {
        var target = $('#sprintTable_' + productId + ' tbody tr:first');
        if (target.length > 0)
            $('#sprintTable_' + productId + ' tbody tr:first').remove();
    }
    return;
}

function addSprintRow(productId) {
    $("#sprintTableBody_" + productId + " .sprintRow").removeClass("typicalAltRows");

    $.post('/Sprint/New',
        {
            productId: productId
        },
        function (data) {
            var target = $('#sprintTable_' + productId + ' tbody tr:first');
            if (target.length > 0)
                $('#sprintTable_' + productId + ' tbody tr:first').before(data);
            else
                $('#sprintTable_' + productId + ' tbody').prepend(data);
        }
    );

        $("#sprintTableBody_" + productId + " .sprintRow:odd").addClass("typicalAltRows");
    return;
}


function saveSprintRowEdit(productId, sprintId) {
    var name = $('#sprintName_' + sprintId).val();
    var description = $('#sprintDescription_' + sprintId).val();
    var start = $('#sprintStart_' + sprintId).val();
    var finish = $('#sprintFinish_' + sprintId).val();

    if (sprintId > 0) {
        $.post('/Sprint/Save',
            {
                name: name, sprintId: sprintId,
                description: description, start: start,
                finish: finish, productId: productId
            },
            function (data) {
                $('#sprintRow_' + sprintId).replaceWith(data);
                updateReleaseSchedule();
            }
        );

    }
    else {
        $.post('/Sprint/Save',
            {
                name: name, sprintId: sprintId,
                description: description, start: start,
                finish: finish,
                productId: productId
            },
            function (data) {
                $("#sprintTableBody_" + productId + " .sprintRow").removeClass("typicalAltRows");
                $('#sprintContentListId_' + productId).replaceWith(data);
                $("#sprintTableBody_" + productId + " .sprintRow:odd").addClass("typicalAltRows");
                updateReleaseSchedule();
            }
        );
    }

    
    // TODO: Implement save failure GUI
}

function deleteSprint(productId, sprintId) {
    $.post('/Sprint/Delete',
    {
        id: sprintId,
        sprintId: sprintId,
        productId: productId
    },
    function (data) {
        $("#sprintTableBody_" + productId + " .sprintRow").removeClass("typicalAltRows");
        $('#sprintContentListId_' + productId).replaceWith(data);
        $("#sprintTableBody_" + productId + " .sprintRow:odd").addClass("typicalAltRows");
        updateReleaseSchedule();
    });

    // TODO: Implement delete failure GUI
}


function setupSprintCalendarControl(sprintId) {
    $("#sprintStart_" + sprintId).datepicker({        
        changeMonth: true,
        changeYear: true,
        gotoCurrent: true,
        showOtherMonths: true,
        selectOtherMonths: true,
        yearRange: 'c-4:c+4'
    });
    $("#sprintFinish_" + sprintId).datepicker({
        changeMonth: true,
        changeYear: true,
        gotoCurrent: true,
        showOtherMonths: true,
        selectOtherMonths: true,
        yearRange: 'c-4:c+4'
    });
}