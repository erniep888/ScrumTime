<div style="text-align:left;border-left:#999 solid 1px;border-right:#999 solid 1px;border-bottom:#999 solid 1px;">
    <div style="width:100%;background-color:#c6d5ec;border-bottom:#fff solid 2px;">
        <table style="width:auto" cellpadding="0" cellspacing="0">
            <tr style="font-size:12px;height:20px;">
                <td style="width:390px;background-color:#c6d5ec;text-align:center;vertical-align:bottom;font-weight:bold;">Name</td>
                <td style="width:100px;border-left:#fff solid 2px;border-right:#fff solid 2px;background-color:#c6d5ec;text-align:center;vertical-align:bottom;font-weight:bold;">Members</td>
                <td style="width:300px;background-color:#c6d5ec;text-align:center;vertical-align:bottom;font-weight:bold;">Actions</td>
            </tr>
        </table>
    </div>
    <div style="text-align:left;width:100%;height:100px;overflow-y:scroll;background-color:#eee;">
        <table style="width:auto" cellpadding="0" cellspacing="0">
            <g:each var="product" in="${products}">
                <g:set var="memberCount" value="${product?.owners?.size() + product?.chickens?.size() + product?.pigs?.size() + 1}" />
                <tr style="font-size:13px;height:24px">
                    <td style="width:390px;background-color:#eee;text-align:center;vertical-align:middle;"><a href="${createLink(controller: 'product', action: 'edit', id: product?.id)}">${product?.name}</a></td>
                    <td style="width:100px;background-color:#eee;text-align:center;vertical-align:middle;"><a href="${createLink(controller: 'product', action: 'members', id: product?.id)}">${memberCount}</a></td>
                    <td style="width:290px;background-color:#eee;text-align:center;vertical-align:middle;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${createLink(controller: 'product', action: 'edit', id: product?.id)}">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${createLink(controller: 'product', action: 'delete', id: product?.id)}">Delete</a></td>
                </tr>
            </g:each>
        </table>
    </div>
</div>
            