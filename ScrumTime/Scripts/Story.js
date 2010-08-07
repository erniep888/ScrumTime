
function setupReadOnlyStoryRow(storyId) {

    $(".story_" + storyId).click(function () {
        $(this).parent().load('/Story/EditRow', { id: storyId });
    });
    $("#storyTasks_" + storyId).click(function () {
        $(this).parent().parent().load('/Task/ListByStory', { storyId: storyId });
    });

    $(document).ready(function () {
        $(".storyTable .storyRow:odd").addClass("storyAltRows");
    });

    return;
}

function cancelStoryRowEdit(parentTagId, storyId) {
    $(parentTagId).load('/Story/ReadOnlyRow', { id: storyId });
    return;
}

function saveStoryRowEdit(parentTagId, storyId) {
    var priority = $('#storyPriority_' + storyId).val();
    var userDefinedId = $('#storyUserDefinedId_' + storyId).val();
    var narrative = $('#storyNarrative_' + storyId).val();
    var points = $('#storyPoints_' + storyId).val();
    $.post('/Story/Save', 
        {
            storyId: storyId, priority: priority,
            userDefinedId: userDefinedId, narrative: narrative,
            points: points
        },
        function (data) {
            $(parentTagId).html(data);
        }
    );

    // TODO: Implement save failure GUI
}

function addStoryRow() {    
    $('.storyTable  tr:first').after('<tr id="storyRow_0" class="storyRow" style="border:0px" ></tr>');
    $('#storyRow_0').load('/Story/AddStoryRow');
    return;
}

function setupAddStoryFormSubmit() {
    $('#addStorySaveLinkId').click(function () {
        $('#addStoryFormId').submit();
    });
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