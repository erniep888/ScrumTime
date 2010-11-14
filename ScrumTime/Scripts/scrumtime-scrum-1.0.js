function setupReadOnlyScrumRow(scrumId, editUrl, saveUrl, scrumListUrl) {
    $(".scrum_" + scrumId).click(function () {
        fetchScrumInformationForEdit(scrumId, editUrl, saveUrl, scrumListUrl);
    });
    return;
}

function setupAddScrumLink(editUrl, saveUrl, scrumListUrl) {
    $("#scrumAddLink").click(function () {
        // Fetch the edit content
        fetchScrumInformationForEdit(-1, editUrl, saveUrl, scrumListUrl);
    });
    return;
}

function saveScrumDetails(saveUrl, scrumListUrl) {
    var dateOfScrum = $('#dateOfScrum').val();
    var scrumDetailCount = $('#scrumDetailCount').val();
    var sprintId = $('#scrumDetailSprintId').val();
    var scrumId = $('#scrumDetailScrumId').val();

    var scrumDetails = new Array();
    var i = 0;
    while (i < scrumDetailCount) {
        var scrumDetail = new Object;
        scrumDetail.StoryTaskDescription = $('#scrumDetailStoryTaskDescription_' + i).text();
        scrumDetail.AssignedTo = $('#scrumDetailAssignedTo_' + i).val();
        scrumDetail.HoursRemaining = $('#scrumDetailHrsRem_' + i).val();
        scrumDetail.HoursCompleted = $('#scrumDetailHrsComp_' + i).val();
        scrumDetail.TaskId = $('#scrumDetailTaskId_' + i).val();
        scrumDetails[i] = scrumDetail;
        i++;
    }

    $.post(saveUrl,
        {
            scrumDetails: scrumDetails,
            scrumDetailCount: scrumDetailCount,
            dateOfScrum: dateOfScrum,
            scrumId: scrumId,
            sprintId: sprintId
        },
        function (data) {
            refreshScrumList(scrumListUrl);
        }
    ); 
}


function deleteScrum(scrumId, deleteUrl, scrumListUrl) {    
    $.post(deleteUrl,
    {
        id: scrumId
    },
    function (data) {
        refreshScrumList(scrumListUrl);
    });

    // TODO: Implement delete failure GUI
}



function setAlternatingScrumBackgroundColors() {
    $(".scrumTable .scrumRow").removeClass("typicalAltRows");
    $(".scrumTable .scrumRow:odd").addClass("typicalAltRows");
}

function setAlternatingScrumDetailBackgroundColors() {
    $(".scrumDetailTable .scrumDetailRow").removeClass("typicalAltRows");
    $(".scrumDetailTable .scrumDetailRow:odd").addClass("typicalAltRows");
}

function setupScrumEditDialog(saveUrl, scrumListUrl) {
    $("#scrumEditDialog").dialog({
        autoOpen: false,
        modal: true,
        height: 490,
        width: 850,
        resizable: false,
        buttons: {
            "Save": function () {
                saveScrumDetails(saveUrl, scrumListUrl);
                $(this).dialog("close");
                $(this).dialog("destroy");
            },
            Cancel: function () {
                $(this).dialog("close");
                $(this).dialog("destroy");
                $(this).remove();
            }
        }
    });    
}

function loadScrumEditTitle(currentSprintNameUrl) {    
    $.ajax({
        url: currentSprintNameUrl,
        dataType: 'json',
        success: function (json) {
            $('#scrumEditDialog').dialog({ title: 'Scrum For Sprint ' + json.d });
        },
        cache: false,
        async: true
    });    
}

function setupDateOfScrumDatePicker() {
    $("#dateOfScrum").datepicker({
        onSelect: function (dateText, inst) {  },
        onClose: function (dateText, inst) {  },
        changeMonth: true,
        changeYear: true,
        gotoCurrent: true,
        showOtherMonths: true,
        selectOtherMonths: true,
        yearRange: 'c-4:c+4'
    });
}

function refreshScrumList(scrumListUrl) {
    $.ajax({
        url: scrumListUrl,
        cache: false,
        type: "GET",
        dataType: "html",
        success: function (html) {
            $('.scrumTable').replaceWith(html);
        },
        async: true
    });
    $('#scrumEditDialog').dialog("close");
    $('#scrumEditDialog').remove();
}



function fetchScrumInformationForEdit(scrumId, editUrl, saveUrl, scrumListUrl) {
    $.ajax({
        url: editUrl,
        cache: false,
        type: "GET",
        data: ({ id: scrumId }),
        dataType: "html",
        success: function (html) {
            $('#scrumEditDialogContainer').replaceWith(html);
            $('#scrumEditDialogContainer').ready(function () {
                setupScrumEditDialog(saveUrl, scrumListUrl);
                $('#scrumEditDialog').ready(function () {
                    $('#scrumEditDialog').dialog("open");
                });
            });
        },
        async: false
    });
}

