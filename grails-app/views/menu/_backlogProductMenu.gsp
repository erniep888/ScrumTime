<div id="thirdLevelMenuDiv" style="text-align:left">
    <table style="font-size:14px;width:100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td style="width:40px"></td>
            <g:if test="${!productBacklogMenuSelection || productBacklogMenuSelection == '' || productBacklogMenuSelection == 'list'}">
                <td style="width:88px" class="fontBolder fontDkGray">List</td>
                <td style="width:78px"><a href="${createLink(controller: 'backlog', action: 'addItem')}">Add Item</a></td>
            </g:if>
            <g:else>
                <td style="width:88px"><a href="${createLink(controller: 'backlog', action: 'index')}">List</a></td>
                <td style="width:78px" class="fontBolder fontDkGray">Add Item</td>
            </g:else>
            <td style="text-align:right">
                <table cellpadding="0" cellspacing="0" align="right">
                    <tr>
                        <td style="font-size:14px;padding-right:4px">Product:</td>
                        <td><g:select style="font-size:12px" name="currentProduct.id" value="${currentProduct?.id}"
                            from="${products}" optionKey="id" optionValue="name"
                            noSelection="['-1':'----------------------']" onChange="productSelectionChange(this)"/></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
