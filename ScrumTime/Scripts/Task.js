function setupReadOnlyTaskRow(taskId) {
    $(".task_" + taskId).click(function () {
        $(this).parent().load('/Task/EditRow', { id: taskId });
    });
    $(document).ready(function () {
        $(".taskTable .taskRow:odd").addClass("taskAltRows");
    });

    return;
}

function cancelTaskRowEdit(parentTagId, taskId) {
    $(parentTagId).load('/Task/ReadOnlyRow', { id: taskId });
    return;
}

