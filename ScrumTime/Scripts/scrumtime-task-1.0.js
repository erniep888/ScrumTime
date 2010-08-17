function setupReadOnlyTaskRow(taskId) {
    $(".task_" + taskId).click(function () {
        $(this).parent().load('/Task/Edit', { id: taskId });
    });
    $(document).ready(function () {
        $(".taskTable .taskRow:odd").addClass("taskAltRows");
    });

    return;
}

function cancelTaskRowEdit(parentTagId, taskId, storyId) {
    if (taskId > 0)
        $(parentTagId).load('/Task/ReadOnlyRow', { id: taskId });
    else
        $('#taskContentListId_' + storyId).load('/Task/ListById', { storyId: storyId });
    return;
}

function addTaskRow(storyId) {
    $('#taskContentListId_' + storyId).load('/Task/AddTaskRow', { storyId: storyId });
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
                $('#taskContentListId_' + storyId).html(data);
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
        $('#taskContentListId_' + storyId).html(data);
    });

    // TODO: Implement delete failure GUI
}

function setupTaskEditorCancelButton(storyId) {
    $(function () {
    var newActionHtml = 
        '<td class="story_' + storyId + '_Actions" style="vertical-align:middle;text-align:center;width:114px;border:0px;">' +
        '            <table border="1" cellpadding="0" cellspacing="0" style="padding:0;border:0;" width="100%">' +
        '                <tr>' +
        '                   <td style="border:0px">' +
        '                        <a href="#" id="closeStoryTasks_' + storyId + '" class="simpleLink" ' +
        '                            style="font-size:12px;font-weight:bold;color:#0035a0;" ' +
        '                            onclick="cancelStoryRowEdit(\'#storyRow_' + storyId + '\', \'' + storyId + '\');">' +
        '                            <img alt="Cancel" src="../../Content/Images/Menu/cancel24x24.png" /></a>' +
        '                    </td>' +
        '                </tr>' +
        '            </table>    ' +
        '        </td>';
    $('.story_' + storyId + '_Actions').replaceWith(newActionHtml);
    });
}
