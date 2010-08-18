function setupReadOnlyTaskRow(taskId, storyId) {
    $(".task_" + taskId).click(function () {
        $(this).parent().load('/Task/Edit', { id: taskId });
    });
    $(document).ready(function () {
        $("#taskTableBody_" + storyId + " .taskRow:odd").addClass("taskAltRows");
    });

    return;
}

function cancelTaskRowEdit(parentTagId, taskId, storyId) {
    if (taskId > 0)
        $(parentTagId).load('/Task/ReadOnly', { id: taskId });
    else {
        $.post('/Task/ListById',
            {
                storyId: storyId
            },
            function (data) {
                $("#taskTableBody_" + storyId + " .taskRow:odd").removeClass("taskAltRows");
                $('#taskTableBody_' + storyId).replaceWith(data);
                $("#taskTableBody_" + storyId + " .taskRow:odd").addClass("taskAltRows");
            }
        );
    }
    return;
}

function addTaskRow(storyId) {
    $("#taskTableBody_" + storyId + " .taskRow:odd").removeClass("taskAltRows");

    $.post('/Task/New',
        {
            storyId: storyId
        },
        function (data) {
            var target = $('#taskTable_' + storyId + ' tbody tr:first');
            if (target.length > 0)
                $('#taskTable_' + storyId + ' tbody tr:first').before(data);
            else
                $('#taskTable_' + storyId + ' tbody').after(data);
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

function saveTaskRowEdit(parentTagId, taskId, storyId) {
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
                $(parentTagId).html(data);
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
                $("#taskTableBody_" + storyId + " .taskRow:odd").removeClass("taskAltRows");
                $('#taskTableBody_' + storyId).replaceWith(data);
                $("#taskTableBody_" + storyId + " .taskRow:odd").addClass("taskAltRows");
            }
        );
    }
        // TODO: Implement save failure GUI
}

function deleteTask(storyId, taskId) {
    $.post('/Task/Delete',
    {
        id: taskId,
        taskId: taskId,
        storyId: storyId
    },
    function (data) {
        $("#taskTableBody_" + storyId + " .taskRow:odd").removeClass("taskAltRows");
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
