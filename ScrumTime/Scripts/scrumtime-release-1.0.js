function setupReadOnlyReleaseRow(productId, releaseId) {
    $(".release_" + releaseId).click(function () {
        $.post('/Release/Edit',
            {
                id: releaseId
            },
            function (data) {
                $("#releaseTableBody_" + productId + " .releaseRow").removeClass("typicalAltRows");
                $('#releaseRow_' + releaseId).replaceWith(data);
                $("#releaseTableBody_" + productId + " .releaseRow:odd").addClass("typicalAltRows");
            }
        );
    });

    $(document).ready(function () {
        $("#releaseTableBody_" + productId + " .releaseRow:odd").addClass("typicalAltRows");
    });

    return;
}

function cancelReleaseRowEdit(productId, releaseId) {
    if (releaseId > 0) {
        $.post('/Release/ReadOnly',
            {
                id: releaseId
            },
            function (data) {
                $('#releaseRow_' + releaseId).replaceWith(data);
            }
        );
    }
        else {
        var target = $('#releaseTable_' + productId + ' tbody tr:first');
        if (target.length > 0)
            $('#releaseTable_' + productId + ' tbody tr:first').remove();
    }
    return;
}

function addReleaseRow(productId) {
    $("#releaseTableBody_" + productId + " .releaseRow").removeClass("typicalAltRows");

    $.post('/Release/New',
        {
            productId: productId
        },
        function (data) {
            var target = $('#releaseTable_' + productId + ' tbody tr:first');
            if (target.length > 0)
                $('#releaseTable_' + productId + ' tbody tr:first').before(data);
            else
                $('#releaseTable_' + productId + ' tbody').prepend(data);
        }
    );

        $("#releaseTableBody_" + productId + " .releaseRow:odd").addClass("typicalAltRows");
    return;
}


function saveReleaseRowEdit(productId, releaseId) {
    var name = $('#releaseName_' + releaseId).val();
    var description = $('#releaseDescription_' + releaseId).val();
    var target = $('#releaseTarget_' + releaseId).val();    

    if (releaseId > 0) {
        $.post('/Release/Save',
            {
                name: name, releaseId: releaseId,
                description: description, target: target,
                productId: productId
            },
            function (data) {
                $('#releaseRow_' + releaseId).replaceWith(data);
            }
        );

    }
    else {
        $.post('/Release/Save',
            {
                name: name, releaseId: releaseId,
                description: description, target: target,
                productId: productId
            },
            function (data) {
                $("#releaseTableBody_" + productId + " .releaseRow").removeClass("typicalAltRows");
                $('#releaseContentListId_' + productId).replaceWith(data);
                $("#releaseTableBody_" + productId + " .releaseRow:odd").addClass("typicalAltRows");
            }
        );
    }

    // TODO: Implement save failure GUI
}

function deleteRelease(productId, releaseId) {
    $.post('/Release/Delete',
    {
        id: releaseId,
        releaseId: releaseId,
        productId: productId
    },
    function (data) {
        $("#releaseTableBody_" + productId + " .releaseRow").removeClass("typicalAltRows");
        $('#releaseContentListId_' + productId).replaceWith(data);
        $("#releaseTableBody_" + productId + " .releaseRow:odd").addClass("typicalAltRows");
    });

    // TODO: Implement delete failure GUI
}


function setupCalendarControl(releaseId) {
    $("#releaseTarget_" + releaseId).datepicker({        
        changeMonth: true,
        changeYear: true,
        gotoCurrent: true,
        showOtherMonths: true,
        selectOtherMonths: true,
        yearRange: 'c-4:c+4'
    });
}