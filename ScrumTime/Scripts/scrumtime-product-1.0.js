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
        $("#productTable .productRow").removeClass("typicalAltRows");
        var target = $('#productTable tbody tr:first');
        if (target.length > 0)
            $('#productTable tbody tr:first').remove();
        $("#productTable .productRow:odd").addClass("typicalAltRows");
    }
    return;
}

function addProductRow() {
    $("#productTable .productRow").removeClass("typicalAltRows");

    $.post('/Product/New',
        
        function (data) {
            var target = $('#productTableBody tr:first');
            if (target.length > 0)
                $('#productTableBody tr:first').before(data);
            else
                $('#productTable tbody').prepend(data);

            $("#productTable .productRow:odd").addClass("typicalAltRows");
        }
    );
    
    return;
}


function saveProductRowEdit(productId) {
    var name = $('#productName_' + productId).val();
    var description = $('#productDescription_' + productId).val();

    if (productId > 0) {
        $.post('/Product/Save',
            {
                name: name, id: productId,
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
                name: name, id: productId,
                description: description
            },
            function (data) {
                $("#productTable .productRow").removeClass("typicalAltRows");                
                $('#productTable').replaceWith(data);
                $("#productTable .productRow:odd").addClass("typicalAltRows");
            }
        );
    }

    // TODO: Implement save failure GUI
}

function deleteProduct(productId) {
    $.post('/Product/Delete',
    {
        id: productId
    },
    function (data) {
        $("#productTable .productRow").removeClass("typicalAltRows");   
        $('#productTable').replaceWith(data);
        $("#productTable .productRow:odd").addClass("typicalAltRows");
    });

    // TODO: Implement delete failure GUI
}

