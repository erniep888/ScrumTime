<%@ page import="scrumtime.Story" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'story.label', default: 'Story')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-story" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-story" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="narrative"
                              title="${message(code: 'story.narrative.label', default: 'Narrative')}"/>

            <th><g:message code="story.parent.label" default="Parent"/></th>

            <g:sortableColumn property="title" title="${message(code: 'story.title.label', default: 'Title')}"/>

            <g:sortableColumn property="storyPoints"
                              title="${message(code: 'story.storyPoints.label', default: 'Story Points')}"/>

            <g:sortableColumn property="dateCreated"
                              title="${message(code: 'story.dateCreated.label', default: 'Date Created')}"/>

            <g:sortableColumn property="lastUpdated"
                              title="${message(code: 'story.lastUpdated.label', default: 'Last Updated')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${storyInstanceList}" status="i" var="storyInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${storyInstance.id}">${fieldValue(bean: storyInstance, field: "narrative")}</g:link></td>

                <td>${fieldValue(bean: storyInstance, field: "parent")}</td>

                <td>${fieldValue(bean: storyInstance, field: "title")}</td>

                <td>${fieldValue(bean: storyInstance, field: "storyPoints")}</td>

                <td><g:formatDate date="${storyInstance.dateCreated}"/></td>

                <td><g:formatDate date="${storyInstance.lastUpdated}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${storyInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
