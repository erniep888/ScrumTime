$(function () {
    $("#mainMenu").tabs();
    $("#mainMenu").tabs("option", "cache", false);
    $("#mainMenu").tabs("option", "ajaxOptions", { cache: false });
});

function loadBacklogTab() {
    $(function () {
        $("#mainMenu").tabs('select', 2);
    });
}


function setupCurrentProductReadOnly() {
    $(".currentProductLink").click(function () {
        $.get('/Product/CurrentEdit',
            {
        },
            function (data) {
                $('.currentProductContainer').replaceWith(data);
            }
        );
    });
    return;
}

function onCurrentProductChange() {
    $.post('/Product/SetCurrent',
        {
            productId: $("#currentProductSelected").val()
        },
        function (data) {
            window.location.reload();
        }
    );
    return;
}

function revertCurrentProductToReadOnly() {
    $.get('/Product/CurrentReadOnly',
        {
    },
        function (data) {
            $('.currentProductContainer').replaceWith(data);
        }
    );
    return;
}

function setupCurrentSprintReadOnly() {
    $(".currentSprintLink").click(function () {
        $.get('/Sprint/CurrentEdit',
            {
        },
            function (data) {
                $('.currentSprintContainer').replaceWith(data);
            }
        );
    });
    return;
}

function onCurrentSprintChange() {
    $.post('/Sprint/SetCurrent',
        {
            sprintId: $("#currentSprintSelected").val()
        },
        function (data) {
            window.location.reload();
        }
    );
    return;
}

function revertCurrentSprintToReadOnly() {
    $.get('/Sprint/CurrentReadOnly',
        {
        },
        function (data) {
            $('.currentSprintContainer').replaceWith(data);
        }
    );
    return;
}