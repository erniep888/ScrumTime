function setupReadOnlyTaskRow(taskId, index) {
    $(".task_" + taskId).click(function () {
        $(this).parent().load('/Task/EditRow', { id: taskId });
    });
    return;
}

function cancelTaskRowEdit(parentTagId, taskId, index) {
    $(parentTagId).load('/Task/ReadOnlyRow', { id: taskId });
    return;
}

