function setupReadOnlyProductRow(productId, url) {
    $(".product_" + productId).click(function () {
        $.post(url,
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

function cancelProductRowEdit(productId, url) {
    if (productId > 0) {
        $.post(url,
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

function addProductRow(url) {
    $("#productTable .productRow").removeClass("typicalAltRows");

    $.post(url,
        
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


function saveProductRowEdit(productId, url) {
    var name = $('#productName_' + productId).val();
    var description = $('#productDescription_' + productId).val();

    if (productId > 0) {
        $.post(url,
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
        $.post(url,
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

function deleteProduct(productId, url) {
    $.post(url,
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

