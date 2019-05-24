﻿
function setupReadOnlyStoryRow(storyId) {
    $(".story_" + storyId).click(function () {
        $.post('/Story/Edit',
            {
                id: storyId
            },
            function (data) {
                $('#storyRow_' + storyId).replaceWith(data);
            }
        );
    });

    $("#storyTasks_" + storyId).click(function () {
        $.post('/Task/StoryTaskBacklog',
            {
                storyId: storyId
            },
            function (data) {                
                $('#storyRow_' + storyId).replaceWith(data);                
            }
        );
    });
    
    return;
}

function cancelStoryRowEdit(storyId) {
    if (storyId > 0) {
        $.post('/Story/ReadOnly',
            {
                id: storyId
            },
            function (data) {
                $('#storyRow_' + storyId).replaceWith(data);
                $('#storyRow_' + storyId).ready(function () {
                    setAlternatingStoryBackgroundColors();
                });
            }
        );
    }
    else {
        $.post('/Story/ListByPriority',
            {
            },
            function (data) {
                $('.storyTable').replaceWith(data);
            }
       );
    }
    return;
}

function setupEditStoryRow(storyId, originalStoryPriority) {
    $('#storyPriority_' + storyId).data('originalValue', originalStoryPriority);
    return;
}

function saveStoryRowEdit(storyId) {
    var originalPriority = $('#storyPriority_' + storyId).data('originalValue');
    if (originalPriority == 0) // handle the nulled/nonexisting originalValue
        originalPriority = -9;
    var priority = $('#storyPriority_' + storyId).val();
    var userDefinedId = $('#storyUserDefinedId_' + storyId).val();
    var narrative = $('#storyNarrative_' + storyId).val();
    var points = $('#storyPoints_' + storyId).val();
    var sprintId = $('#storySprint_' + storyId).val();
    if (originalPriority != priority ) {
        $.post('/Story/Save',
            {
                storyId: storyId, priority: priority, sprintId: sprintId,
                userDefinedId: userDefinedId, narrative: narrative,
                originalPriority: originalPriority, points: points
            },
            function (data) {
                $('.storyTable').replaceWith(data);
            }
        );
    }
    else {
        $.post('/Story/Save',
            {
                storyId: storyId, priority: priority, sprintId: sprintId,
                userDefinedId: userDefinedId, narrative: narrative,
                originalPriority: originalPriority, points: points
            },
            function (data) {
                $('#storyRow_' + storyId).replaceWith(data);
                $('#storyRow_' + storyId).ready(function () {
                    setAlternatingStoryBackgroundColors();
                });
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
            $('.storyTable').replaceWith(data);
        }
    );
    
    // TODO: Implement delete failure GUI
}

function addStoryRow() {
    $.post('/Story/New',
        {            
        },
        function (data) {
            var target = $('.storyTable tbody tr:first');
            if (target.length > 0)
                $('.storyTable  tr:first').before(data);
            else
                $('.storyTable tbody').prepend(data);
        }
    );
    return;
}

function setupAddStoryFormSubmit() {
    $('#addStorySaveLinkId').click(function () {
        $('#addStoryFormId').submit();
    });
}

function setAlternatingStoryBackgroundColors() {
    $(".storyTable .storyRow").removeClass("typicalAltRows");
    $(".storyTable .storyRow:odd").addClass("typicalAltRows");    
}