<%@ page import="scrumtime.Story" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'story.label', default: 'Story')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-story" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-story" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list story">

        <g:if test="${storyInstance?.narrative}">
            <li class="fieldcontain">
                <span id="narrative-label" class="property-label"><g:message code="story.narrative.label"
                                                                             default="Narrative"/></span>

                <span class="property-value" aria-labelledby="narrative-label"><g:fieldValue bean="${storyInstance}"
                                                                                             field="narrative"/></span>

            </li>
        </g:if>

        <g:if test="${storyInstance?.parent}">
            <li class="fieldcontain">
                <span id="parent-label" class="property-label"><g:message code="story.parent.label"
                                                                          default="Parent"/></span>

                <span class="property-value" aria-labelledby="parent-label"><g:link controller="story" action="show"
                                                                                    id="${storyInstance?.parent?.id}">${storyInstance?.parent?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${storyInstance?.title}">
            <li class="fieldcontain">
                <span id="title-label" class="property-label"><g:message code="story.title.label"
                                                                         default="Title"/></span>

                <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${storyInstance}"
                                                                                         field="title"/></span>

            </li>
        </g:if>

        <g:if test="${storyInstance?.storyPoints}">
            <li class="fieldcontain">
                <span id="storyPoints-label" class="property-label"><g:message code="story.storyPoints.label"
                                                                               default="Story Points"/></span>

                <span class="property-value" aria-labelledby="storyPoints-label"><g:fieldValue bean="${storyInstance}"
                                                                                               field="storyPoints"/></span>

            </li>
        </g:if>

        <g:if test="${storyInstance?.dateCreated}">
            <li class="fieldcontain">
                <span id="dateCreated-label" class="property-label"><g:message code="story.dateCreated.label"
                                                                               default="Date Created"/></span>

                <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate
                        date="${storyInstance?.dateCreated}"/></span>

            </li>
        </g:if>

        <g:if test="${storyInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="story.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                        date="${storyInstance?.lastUpdated}"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: storyInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${storyInstance}"><g:message code="default.button.edit.label"
                                                                                      default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
