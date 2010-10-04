function setupReadOnlyProductRow(productId) {
    $(".product_" + productId).click(function () {
        $.post('/Product/Edit',
            {
                id: productId
            },
            function (data) {
                $("#productTableBody .productRow").removeClass("typicalAltRows");
                $('#productRow_' + productId).replaceWith(data);
                $("#productTableBody .productRow:odd").addClass("typicalAltRows");
            }
        );
    });

    $(document).ready(function () {
        $("#productTableBody .productRow:odd").addClass("typicalAltRows");
    });

    return;
}

function cancelProductRowEdit(productId) {
    if (productId > 0) {
        $.post('/Product/ReadOnly',
            {
                id: productId
            },
            function (data) {
                $('#productRow_' + productId).replaceWith(data);
            }
        );
    }
        else {
        var target = $('#productTable tbody tr:first');
        if (target.length > 0)
            $('#productTable tbody tr:first').remove();
    }
    return;
}

function addProductRow(productId) {
    $("#productTableBody .productRow").removeClass("typicalAltRows");

    $.post('/Product/New',
        {
            productId: productId
        },
        function (data) {
            var target = $('#productTable tbody tr:first');
            if (target.length > 0)
                $('#productTable tbody tr:first').before(data);
            else
                $('#productTable tbody').prepend(data);
        }
    );

        $("#productTableBody .productRow:odd").addClass("typicalAltRows");
    return;
}


function saveProductRowEdit(productId) {
    var name = $('#productName_' + productId).val();
    var description = $('#productDescription_' + productId).val();

    if (productId > 0) {
        $.post('/Product/Save',
            {
                name: name, productId: productId,
                description: description
            },
            function (data) {
                $('#productRow_' + productId).replaceWith(data);
            }
        );

    }
    else {
        $.post('/Product/Save',
            {
                name: name, productId: productId,
                description: description
            },
            function (data) {
                $("#productTableBody .productRow").removeClass("typicalAltRows");
                $('#productContentListId_' + productId).replaceWith(data);
                $("#productTableBody .productRow:odd").addClass("typicalAltRows");
            }
        );
    }

    // TODO: Implement save failure GUI
}

function deleteProduct(productId) {
    $.post('/Product/Delete',
    {
        id: productId,
        productId: productId
    },
    function (data) {
        $("#productTableBody .productRow").removeClass("typicalAltRows");
        $('#productContentListId_' + productId).replaceWith(data);
        $("#productTableBody .productRow:odd").addClass("typicalAltRows");
    });

    // TODO: Implement delete failure GUI
}
