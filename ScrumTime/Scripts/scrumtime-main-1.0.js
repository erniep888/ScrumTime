$(function () {
    $("#mainMenu").tabs();
    $("#mainMenu").tabs("option", "cache", true);
    $("#mainMenu").tabs("option", "ajaxOptions", { cache: true });
});

function loadBacklogTab() {
    $(function () {
        $("#mainMenu").tabs('select', 2);
    });
}
