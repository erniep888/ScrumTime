function setupReadOnlyReleaseRow(releaseId, productId) {
    $(".release_" + releaseId).click(function () {
        $.post('/Release/Edit',
            {
                id: releaseId
            },
            function (data) {
                $("#releaseTableBody_" + productId + " .releaseRow").removeClass("typicalAltRows");
                $('#releaseRow_' + releaseId).replaceWith(data);
                $("#releaseTableBody_" + productId + " .releaseRow:odd").addClass("typicalAltRows");
            }
        );
    });

    $(document).ready(function () {
        $("#releaseTableBody_" + productId + " .releaseRow:odd").addClass("typicalAltRows");
    });

    return;
}

