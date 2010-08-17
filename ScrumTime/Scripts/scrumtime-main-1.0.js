$(function () {
    $("#mainMenu").tabs();
    $("#mainMenu").tabs("option", "cache", false);
    $("#mainMenu").tabs("option", "ajaxOptions", { cache: false });
});