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
        $.post('/Product/CurrentEdit',
            {
        },
            function (data) {
                $('.currentProductContainer').replaceWith(data);
            }
        );
    });
    return;
}