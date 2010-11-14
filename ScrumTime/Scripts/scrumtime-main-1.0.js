function createMainTabs() {
    $(function () {
        $("#mainMenu").tabs();
        $("#mainMenu").tabs("option", "cache", false);
        $("#mainMenu").tabs("option", "ajaxOptions", { cache: false });
        $("#mainMenu").css("margin", 15);
    });
}

function loadBacklogTab() {
    $(function () {
        $("#mainMenu").tabs('select', 2);
    });
}


function setupCurrentProductReadOnly(url) {
    $(".currentProductLink").click(function () {
        $.get(url,
            {
        },
            function (data) {
                $('.currentProductContainer').replaceWith(data);
            }
        );
    });
    return;
}

function onCurrentProductChange(url, currentProductReadOnlyUrl, currentSprintReadOnlyUrl) {
    $.post(url,
        {
            productId: $("#currentProductSelected").val()
        },
        function (data) {
            var selected = $("#mainMenu").tabs("option", "selected");
            $("#mainMenu").tabs("load", selected);
            revertCurrentProductToReadOnly(currentProductReadOnlyUrl);
            revertCurrentSprintToReadOnly(currentSprintReadOnlyUrl);
        }
    );
    return;
}

function revertCurrentProductToReadOnly(url) {
    $.get(url,
        {
    },
        function (data) {
            $('.currentProductContainer').replaceWith(data);
        }
    );
    return;
}

function setupCurrentSprintReadOnly(url) {
    $(".currentSprintLink").click(function () {
        $.get(url,
            {
        },
            function (data) {
                $('.currentSprintContainer').replaceWith(data);
            }
        );
    });
    return;
}

function onCurrentSprintChange(url, currentSprintReadOnlyUrl) {
    $.post(url,
        {
            sprintId: $("#currentSprintSelected").val()
        },
        function (data) {
            var selected = $("#mainMenu").tabs("option", "selected");
            $("#mainMenu").tabs("load", selected);
            revertCurrentSprintToReadOnly(currentSprintReadOnlyUrl);
        }
    );
    return;
}

function onCurrentSprintFocus(url, currentSprintReadOnlyUrl) {
    var selectionCount = $("#currentSprintSelected")[0].length;
    if (selectionCount == 1)
        onCurrentSprintChange(url, currentSprintReadOnlyUrl);
    return;
}

function revertCurrentSprintToReadOnly(url) {
    $.get(url,
        {
        },
        function (data) {
            $('.currentSprintContainer').replaceWith(data);
        }
    );
    return;
}