<g:if test="${labelClassValue}">
    <g:set var="labelClassString" value="class='${labelClassValue}'"/>
</g:if>
<g:if test="${fieldTdClassValue}">
    <g:set var="fieldTrClassString" value="class='${fieldTdClassValue}'"/>
</g:if>
<g:if test="${fieldClassValue}">
    <g:set var="fieldClassString" value="class='${fieldClassValue}'"/>
</g:if>
<g:if test="${useSemiColon}">
    <g:set var="semiColon" value=":"/>
</g:if>
<g:if test="${passwordType}">
    <g:set var="inputType" value="type='password'"/>
</g:if>
<g:else>
    <g:set var="inputType" value="type='text'"/>
</g:else>
<g:if test="${fieldSize}">
    <g:set var="sizeString" value="size='${fieldSize}'"/>
</g:if>
<g:if test="${fieldMaxLenth}">
    <g:set var="maxLengthString" value="maxlength='${fieldMaxLenth}'"/>
</g:if>
<g:if test="${id}">
    <g:set var="idValue" value="id='${id}'"/>
</g:if>

<td ${labelClassString}>
    <label for='${fieldName}'>${labelValue}${semiColon}</label>
</td>
<td ${fieldTrClassString}>
    <input ${idValue} ${fieldClassString} ${inputType}
        ${sizeString} ${maxLengthString}
        name='${fieldName}' value="${fieldValue?.encodeAsHTML()}"/>${postHtml}
</td>