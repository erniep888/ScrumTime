<g:if test="${labelClassValue}">
    <g:set var="labelClassString" value="class='${labelClassValue}'" />
</g:if>
<g:if test="${fieldClassValue}">
    <g:set var="fieldClassString" value="class='${fieldClassValue}'" />
</g:if>
<g:if test="${textAreaClassValue}">
    <g:set var="textAreaClassString" value="class='${textAreaClassValue}'" />
</g:if>
<g:if test="${rowCount == null}">
    <g:set var="rowCount" value="5" />
</g:if>
<g:if test="${colCount == null}">
    <g:set var="colCount" value="60" />
</g:if>
<g:if test="${useSemiColon}">
    <g:set var="semiColon" value=":"/>
</g:if>
<g:if test="${onkeyup}">
    <g:set var="onKeyUpString" value="onkeyup='${onkeyup}'" />
</g:if>
<g:if test="${id}">
    <g:set var="idValue" value="id='${id}'"/>
</g:if>

<td ${labelClassString}>
    <label for='${fieldName}'>${labelValue}${semiColon}</label>
</td>
<td ${fieldClassString}>
    <textarea ${idValue} name='${fieldName}' rows='${rowCount}' cols='${colCount}' ${textAreaClassString} ${onKeyUpString}>${fieldValue?.encodeAsHTML()}</textarea>
</td>