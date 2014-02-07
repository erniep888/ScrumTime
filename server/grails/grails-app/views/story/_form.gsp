<%@ page import="scrumtime.Story" %>



<div class="fieldcontain ${hasErrors(bean: storyInstance, field: 'narrative', 'error')} required">
    <label for="narrative">
        <g:message code="story.narrative.label" default="Narrative"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textArea name="narrative" cols="40" rows="5" maxlength="1000" required="" value="${storyInstance?.narrative}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: storyInstance, field: 'parent', 'error')} ">
    <label for="parent">
        <g:message code="story.parent.label" default="Parent"/>

    </label>
    <g:select id="parent" name="parent.id" from="${scrumtime.Story.list()}" optionKey="id"
              value="${storyInstance?.parent?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: storyInstance, field: 'title', 'error')} ">
    <label for="title">
        <g:message code="story.title.label" default="Title"/>

    </label>
    <g:textField name="title" value="${storyInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: storyInstance, field: 'storyPoints', 'error')} ">
    <label for="storyPoints">
        <g:message code="story.storyPoints.label" default="Story Points"/>

    </label>
    <g:field name="storyPoints" type="number" value="${storyInstance.storyPoints}"/>
</div>

