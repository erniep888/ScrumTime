function setupReadOnlyTaskRow(taskId, storyId) {
    $(".task_" + taskId).click(function () {
        $.post('/Task/Edit',
            {
                id: taskId
            },
            function (data) {
                $("#taskTableBody_" + storyId + " .taskRow").removeClass("taskAltRows");
                $('#taskRow_' + taskId).replaceWith(data);
                $("#taskTableBody_" + storyId + " .taskRow:odd").addClass("taskAltRows");
            }
        );
    });

    $(document).ready(function () {
        $("#taskTableBody_" + storyId + " .taskRow:odd").addClass("taskAltRows");
    });

    return;
}

function cancelTaskRowEdit(taskId, storyId) {
    if (taskId > 0) {
        $.post('/Task/ReadOnly',
            {
                id: taskId
            },
            function (data) {
                $('#taskRow_' + taskId).replaceWith(data);
            }
        );
    }
    else {
        var target = $('#taskTable_' + storyId + ' tbody tr:first');
        if (target.length > 0)
            $('#taskTable_' + storyId + ' tbody tr:first').remove();
    }
    return;
}

function addTaskRow(storyId) {
    $("#taskTableBody_" + storyId + " .taskRow").removeClass("taskAltRows");

    $.post('/Task/New',
        {
            storyId: storyId
        },
        function (data) {
            var target = $('#taskTable_' + storyId + ' tbody tr:first');
            if (target.length > 0)
                $('#taskTable_' + storyId + ' tbody tr:first').before(data);
            else
                $('#taskTable_' + storyId + ' tbody').prepend(data);
        }
    );

    $("#taskTableBody_" + storyId + " .taskRow:odd").addClass("taskAltRows");
    return;
}

function hideBottomContainerBorderIfNeeded(storyId) {
    // if there are no tasks, then hide the dotted container bottom border
    var targetTag = $('#taskTable_' + storyId + ' tbody :first-child');
    if (targetTag.length == 0)
        $('#taskContainerId_' + storyId).css('border-bottom', '0px');
    else
        $('#taskContainerId_' + storyId).css('border-bottom', '1px dotted #444');
    return;
}

function saveTaskRowEdit(taskId, storyId) {
    var description = $('#taskDescription_' + taskId).val();
    var hours = $('#taskHours_' + taskId).val();

    var tag = $('#taskContentListId_' + storyId);

    if (taskId > 0) {
        $.post('/Task/Save',
            {
                storyId: storyId, taskId: taskId,
                description: description, hours: hours
            },
            function (data) {
                $('#taskRow_' + taskId).replaceWith(data);
                setTaskTotalHours(storyId);
            }
        );              
        
    }
    else {
        $.post('/Task/Save',
            {
                storyId: storyId, taskId: taskId,
                description: description, hours: hours
            },
            function (data) {
                $("#taskTableBody_" + storyId + " .taskRow").removeClass("taskAltRows");
                $('#taskTableBody_' + storyId).replaceWith(data);
                $("#taskTableBody_" + storyId + " .taskRow:odd").addClass("taskAltRows");
            }
        );
    }
    
    // TODO: Implement save failure GUI
}





// TODO: ************  Turn total into a number

function setTaskTotalHours(storyId) {

    $.post('/Task/TotalTaskHours',
        {
            storyId: storyId
        },
        function (data) {

            $('#storyTotalHours_' + storyId).text(getTaskHourString(Number(data)));
            $('#totalTaskHoursTaskHeader_' + storyId).text('(' + data + ')');
        }
    );
}

function getTaskHourString(taskHours){
    var taskHourString = "";
    if (taskHours > 1 || taskHours == 0 || taskHours < 0)
        taskHourString = taskHours + " hrs";
    else
        taskHourString = "1 hr";
    return taskHourString;
}









function deleteTask(storyId, taskId) {
    $.post('/Task/Delete',
    {
        id: taskId,
        taskId: taskId,
        storyId: storyId
    },
    function (data) {
        $("#taskTableBody_" + storyId + " .taskRow").removeClass("taskAltRows");
        $('#taskTableBody_' + storyId).replaceWith(data);
        $("#taskTableBody_" + storyId + " .taskRow:odd").addClass("taskAltRows");
    });

    // TODO: Implement delete failure GUI
}

function setupTaskEditorCancelButton(storyId) {    
    $.ajax({
        url: '/Story/StoryActionCancelOnly',
        data: ({ storyId: storyId }),
        success: function (data) {
            $('.story_' + storyId + '_Actions').replaceWith(data);
        }
    });    
}
