function setupReadOnlyReleaseRow(productId, releaseId, url) {
    $(".release_" + releaseId).click(function () {
        $.post(url,
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

function cancelReleaseRowEdit(productId, releaseId, url) {
    if (releaseId > 0) {
        $.post(url,
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

function addReleaseRow(productId, url) {
    $("#releaseTableBody_" + productId + " .releaseRow").removeClass("typicalAltRows");

    $.post(url,
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


function saveReleaseRowEdit(productId, releaseId, saveUrl, updateCalendarUrl) {
    var name = $('#releaseName_' + releaseId).val();
    var description = $('#releaseDescription_' + releaseId).val();
    var target = $('#releaseTarget_' + releaseId).val();    

    if (releaseId > 0) {
        $.post(saveUrl,
            {
                name: name, releaseId: releaseId,
                description: description, target: target,
                productId: productId
            },
            function (data) {
                $('#releaseRow_' + releaseId).replaceWith(data);
                updateReleaseSchedule(updateCalendarUrl);
            }
        );

    }
    else {
        $.post(saveUrl,
            {
                name: name, releaseId: releaseId,
                description: description, target: target,
                productId: productId
            },
            function (data) {
                $("#releaseTableBody_" + productId + " .releaseRow").removeClass("typicalAltRows");
                $('#releaseContentListId_' + productId).replaceWith(data);
                $("#releaseTableBody_" + productId + " .releaseRow:odd").addClass("typicalAltRows");
                updateReleaseSchedule(updateCalendarUrl);
            }
        );
    }

    // TODO: Implement save failure GUI
}

function deleteRelease(productId, releaseId, deleteUrl, updateCalendarUrl) {
    $.post(deleteUrl,
    {
        id: releaseId,
        releaseId: releaseId,
        productId: productId
    },
    function (data) {
        $("#releaseTableBody_" + productId + " .releaseRow").removeClass("typicalAltRows");
        $('#releaseContentListId_' + productId).replaceWith(data);
        $("#releaseTableBody_" + productId + " .releaseRow:odd").addClass("typicalAltRows");
        updateReleaseSchedule(updateCalendarUrl);
    });

    // TODO: Implement delete failure GUI
}


function setupReleaseCalendarControl(releaseId) {
    $("#releaseTarget_" + releaseId).datepicker({        
        changeMonth: true,
        changeYear: true,
        gotoCurrent: true,
        showOtherMonths: true,
        selectOtherMonths: true,
        yearRange: 'c-4:c+4'
    });
}