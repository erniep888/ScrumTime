<table cellpadding="0" cellspacing="4px">
    <tr>
        <td class="levelOne"><img src="${createLinkTo(dir: 'images/menu', file: 'rightarrow.gif')}" alt="Right Arrow"/>&nbsp;&nbsp;<g:link controller="backlog" action="viewBacklogItem">Create Backlog Item</g:link></td>
    </tr>
    <tr>
        <td class="levelOne">Browse</td>
    </tr>
    <tr>
        <td class="levelTwo"><img src="${createLinkTo(dir: 'images/menu', file: 'rightarrow.gif')}" alt="Right Arrow"/>&nbsp;&nbsp;<g:link controller="backlog" action="viewBacklog" params="[backlogType:'product']">Product Backlog</g:link></td>
    </tr>
    <tr>
        <td class="levelTwo"><img src="${createLinkTo(dir: 'images/menu', file: 'rightarrow.gif')}" alt="Right Arrow"/>&nbsp;&nbsp;<g:link controller="backlog" action="viewBacklog" params="[backlogType:'release']">Release Backlog</g:link></td>
    </tr>
    <tr>
        <td class="levelTwo"><img src="${createLinkTo(dir: 'images/menu', file: 'rightarrow.gif')}" alt="Right Arrow"/>&nbsp;&nbsp;<g:link controller="backlog" action="viewBacklog" params="[backlogType:'sprint']">Sprint Backlog</g:link></td>
    </tr>
</table>


