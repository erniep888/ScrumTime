function setupReadOnlyTaskRow(taskId, storyId, editUrl) {
    $(".task_" + taskId).click(function () {
        $.post(editUrl,
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

function cancelTaskRowEdit(taskId, storyId, readOnlyUrl) {
    if (taskId > 0) {
        $.post(readOnlyUrl,
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

function addTaskRow(storyId, newUrl) {
    $("#taskTableBody_" + storyId + " .taskRow").removeClass("taskAltRows");

    $.post(newUrl,
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

function saveTaskRowEdit(taskId, storyId, saveUrl, totalTaskHrsUrl) {
    var description = $('#taskDescription_' + taskId).val();
    var hours = $('#taskHours_' + taskId).val();

    if (taskId > 0) {
        $.post(saveUrl,
            {
                storyId: storyId, taskId: taskId,
                description: description, hours: hours
            },
            function (data) {
                $('#taskRow_' + taskId).replaceWith(data);
                setTaskTotalHours(storyId, totalTaskHrsUrl);
            }
        );              
        
    }
    else {
        $.post(saveUrl,
            {
                storyId: storyId, taskId: taskId,
                description: description, hours: hours
            },
            function (data) {
                $("#taskTableBody_" + storyId + " .taskRow").removeClass("taskAltRows");
                $('#taskTableBody_' + storyId).replaceWith(data);
                $("#taskTableBody_" + storyId + " .taskRow:odd").addClass("taskAltRows");
                setTaskTotalHours(storyId, totalTaskHrsUrl);
            }
        );
    }
    
    // TODO: Implement save failure GUI
}





// TODO: ************  Turn total into a number

function setTaskTotalHours(storyId, totalTaskHrsUrl) {

    $.post(totalTaskHrsUrl,
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

function deleteTask(storyId, taskId, deleteUrl, totalTaskHrsUrl) {
    $.post(deleteUrl,
    {
        id: taskId,
        taskId: taskId,
        storyId: storyId
    },
    function (data) {
        $("#taskTableBody_" + storyId + " .taskRow").removeClass("taskAltRows");
        $('#taskTableBody_' + storyId).replaceWith(data);
        $("#taskTableBody_" + storyId + " .taskRow:odd").addClass("taskAltRows");
        setTaskTotalHours(storyId, totalTaskHrsUrl);
    });

    // TODO: Implement delete failure GUI
}

function setupTaskEditorCancelButton(storyId, cancelOnlyUrl) {    
    $.ajax({
        url: cancelOnlyUrl,
        data: ({ storyId: storyId }),
        success: function (data) {
            $('.story_' + storyId + '_Actions').replaceWith(data);
        }
    });    
}
