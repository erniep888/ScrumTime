function setupReadOnlyScrumRow(scrumId) {
    $.ajaxSetup({
        cache: false
    });

    $(".scrum_" + scrumId).click(function () {
        fetchScrumInformationForEdit(scrumId);        
    });


    $("#scrumSelectedSprint").change(function () {
        $.post('/Sprint/ChangeSprint',
            {
                id: $("#scrumSelectedSprint").val()
            },
            function (data) {
                refreshScrumList();
            }
        );
    });
    return;
}

function saveScrumDetails() {
    $.ajaxSetup({
        cache: false
    });
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

    $.post('/Scrum/Save',
        {
            scrumDetails: scrumDetails,
            scrumDetailCount: scrumDetailCount,
            dateOfScrum: dateOfScrum,
            scrumId: scrumId,
            sprintId: sprintId
        },
        function (data) {
            refreshScrumList();
        }
    ); 
}


function deleteScrum(scrumId) {
    $.ajaxSetup({
        cache: false
    });
    $.post('/Scrum/Delete',
    {
        id: scrumId
    },
    function (data) {
        refreshScrumList();
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

function setupScrumEditDialog() {
    $.ajaxSetup({
        cache: false
    });
    $("#scrumEditDialog").dialog({
        autoOpen: false,
        modal: true,
        height: 490,
        width: 850,
        resizable: false,
        buttons: {
            "Save": function () {
                saveScrumDetails();
                $(this).dialog("close");
            },
            Cancel: function () {
                $(this).dialog("close");
            }
        }
    });

    $("#scrumAddLink").click(function () {        
        // Fetch the edit content
        fetchScrumInformationForEdit(-1);
        return;
    });
}

function loadScrumEditTitle() {
    $.ajaxSetup({
        cache: false
    });
    $.ajax({
        url: '/Sprint/CurrentSprintName',
        dataType: 'json',
        success: function (json) {
            $('#scrumEditDialog').dialog({ title: 'Scrum For Sprint ' + json.d });
        },
        cache: false,
        async: false
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

function refreshScrumList() {
    $.ajax({
        url: '/Scrum/List',
        cache: false,
        type: "GET",
        dataType: "html",
        success: function (html) {
            $('.scrumTable').replaceWith(html);
        },
        async: true
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
            var number = $('#scrumDetailScrumId').length;

            $('#scrumEditDialog').html(html);
            $('#scrumEditDialog').ready(function () {
                $('#scrumEditDialog').dialog("open");
            });
        },
        async: true
    });

}