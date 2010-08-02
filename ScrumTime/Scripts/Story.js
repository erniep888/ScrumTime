
function setupReadOnlyStoryRow(storyId, priority) {
    var bgColor = getStoryBackgroundColor(priority);
    $("#storyRow_" + storyId).css("background-color", bgColor);

    $(".story_" + storyId).click(function () {
        $(this).parent().load('/Story/EditRow', { id: storyId });
    });
    $("#storyTasks_" + storyId).click(function () {
        $(this).parent().parent().load('/Task/ListByStory', {storyId: storyId});
    });

    $(document).ready(function () {
        $(".storyTable .storyRow:even").addClass("storyAltRows");
    });
    return;
}

function cancelStoryRowEdit(parentTagId, storyId, priority) {
    var bgColor = getStoryBackgroundColor(priority);
    $("#storyRow_" + storyId).css("background-color", bgColor);

    $(parentTagId).load('/Story/ReadOnlyRow', { id: storyId });
    return;
}

// returns the alternating color for the row
function getStoryBackgroundColor(storyPriority) {
    if (storyPriority % 2 == 0)
        return '#ddd';
    else {
        return '#fff';
    }
}



// loadJSON is not currently used...but do not delete just yet
function loadJSON() {
    $(document).ready(function () {
        $("#task_1").click(function () {
            //            $.getJSON('Home/StoryJson',{'test' : "test1"}, function (data) {
            //                alert(data.d);
            //             });
            //$('#storyId_1').load('Home/Story');
            $(this).parent().parent().load('/Story/StoryTasks');
            //            var obj = $(this).parent().parent();
            //            alert(obj.get(0).tagName);
        });
    });
    return;
}