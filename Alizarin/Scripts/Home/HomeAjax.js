var NarrativeCount = 0;

function loadJSON() {
    $(document).ready(function () {
        $("#task_1").click(function () {
            //            $.getJSON('Home/StoryJson',{'test' : "test1"}, function (data) {
            //                alert(data.d);
            //             });
            //$('#storyId_1').load('Home/Story');
            $(this).parent().parent().load('Home/Story');
//            var obj = $(this).parent().parent();
//            alert(obj.get(0).tagName);
        });
    });
    return;
}

function setClickEvent_Narrative(count) {
    NarrativeCount = count;
    $(document).ready(function () {
        for (i = 1; i <= NarrativeCount; i = i + 1) {
            $(".story_" + i).click(function () {
                var className = $(this).attr("class");
                var storyId = className.substring(6,className.length);
                //alert(storyId);
                $(this).parent().load('Home/StoryEdit');
                //$('#storyId_1').load('Home/StoryEdit');
            });
        }
    });    
    return;
}