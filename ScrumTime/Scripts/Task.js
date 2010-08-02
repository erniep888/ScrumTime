function setupReadOnlyTaskRow(taskId, index) {
    var bgColor = getTaskBackgroundColor(index);
    $("#taskRow_" + taskId).css("background-color", bgColor);

    $(".task_" + taskId).click(function () {
        $(this).parent().load('/Task/EditRow', { id: taskId });
    });
    return;
}

function cancelTaskRowEdit(parentTagId, taskId, index) {
    var bgColor = getTaskBackgroundColor(index);
    $("#taskRow_" + taskId).css("background-color", bgColor);

    $(parentTagId).load('/Task/ReadOnlyRow', { id: taskId });
    return;
}

// returns the alternating color for the row
function getTaskBackgroundColor(index) {
    if (index % 2 == 0)
        return '#ddd';
    else {
        return '#fff';
    }
}

