<div id="secondLevelMenuDiv">
    <table class="font14 width100pct" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td style="width:30px"></td>
            <td style="width:88px" class="fontBolder fontDkGray">Content</td>
            <td style="width:78px"><a href="${createLinkTo(file: 'index.gsp')}">Status</a></td>
            <td style="width:78px"><g:link controller="status" action="index">Manage</g:link></td>
            <td style="width:38px">|</td>
            <td style="width:76px"><a href="${createLinkTo(file: 'index.gsp')}">Create</a></td>
            <td style="width:80px"><g:link controller="status" action="index">Find</g:link></td>

            <td style="padding-left:5px;text-align:right;">
                <table cellpadding="0" cellspacing="0" class="width100Pct">
                    <tr>
                        <td style="text-align:right;padding-right:5px;" class="fontDkGray font12 width100Pct">Project:</td>
                        <td style="text-align:right;"><g:select class="font12" name="book.category" from="${['HR - IT Resumes', 'Tuesday', 'Friday']}" valueMessagePrefix="book.category" onchange="alert('test');"/></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
