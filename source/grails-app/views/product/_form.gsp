<%@ page import="scrumtime.Product" %>



<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="product.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${productInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="product.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${productInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'artifacts', 'error')} ">
	<label for="artifacts">
		<g:message code="product.artifacts.label" default="Artifacts" />
		
	</label>
	<g:select name="artifacts" from="${scrumtime.Artifact.list()}" multiple="multiple" optionKey="id" size="5" value="${productInstance?.artifacts*.id}" class="many-to-many"/>
</div>

