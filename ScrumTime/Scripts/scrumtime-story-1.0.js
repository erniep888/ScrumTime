
function setupReadOnlyStoryRow(storyId) {

    $(".story_" + storyId).click(function () {
        $(this).parent().load('/Story/Edit', { id: storyId });
    });
    $("#storyTasks_" + storyId).click(function () {
        $("#storyRow_" + storyId).load('/Task/StoryTaskBacklog', { storyId: storyId });
    });

    $(document).ready(function () {
        $(".storyTable .storyRow:odd").addClass("storyAltRows");
    });

    return;
}

function cancelStoryRowEdit(parentTagId, storyId) {
    if (storyId > 0)
        $(parentTagId).load('/Story/ReadOnly', { id: storyId });
    else {
        $.post('/Story/ListByPriority',
            {
        },
            function (data) {
                $('#storyContentListId').html(data);
            }
       );
    }
    return;
}

function setupEditStoryRow(storyId, originalStoryPriority) {
    $('#storyPriority_' + storyId).data('originalValue', originalStoryPriority);
    return;
}

function saveStoryRowEdit(parentTagId, storyId) {
    var originalPriority = $('#storyPriority_' + storyId).data('originalValue');
    if (originalPriority == 0) // handle the nulled/nonexisting originalValue
        originalPriority = -9;
    var priority = $('#storyPriority_' + storyId).val();
    var userDefinedId = $('#storyUserDefinedId_' + storyId).val();
    var narrative = $('#storyNarrative_' + storyId).val();
    var points = $('#storyPoints_' + storyId).val();
    if (originalPriority != priority ) {
        $.post('/Story/Save',
            {
                storyId: storyId, priority: priority,
                userDefinedId: userDefinedId, narrative: narrative,
                originalPriority: originalPriority, points: points
            },
            function (data) {
                $('#storyContentListId').html(data);
            }
        );
    }
    else {
        $.post('/Story/Save',
            {
                storyId: storyId, priority: priority,
                userDefinedId: userDefinedId, narrative: narrative,
                originalPriority: originalPriority, points: points
            },
            function (data) {
                $(parentTagId).html(data);
            }
        );
    }
    // TODO: Implement save failure GUI
}

function deleteStory(storyId) {
    $.post('/Story/Delete',
        {
            id: storyId,
            storyId: storyId
        },
        function (data) {
            $('#storyContentListId').html(data);
        }
    );
    
    // TODO: Implement delete failure GUI
}

function addStoryRow() {
    $(".storyTable .storyRow:odd").removeClass("storyAltRows");

    $.post('/Story/New',
        {            
        },
        function (data) {
            $('.storyTable  tr:first').before(data);
        }
    );

    $(".storyTable .storyRow:odd").addClass("storyAltRows");
    return;
}

function setupAddStoryFormSubmit() {
    $('#addStorySaveLinkId').click(function () {
        $('#addStoryFormId').submit();
    });
}

