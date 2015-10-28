<html>
<head>
    <meta name="layout" content="main_anyheight"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonSubWindow.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonTable.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'commonEdit.css')}"/>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'backlog.css')}"/>
</head>
<body onload="setBacklogHeight(${backlog?.size()});">
<center>
    <div id="mainBacklogViewWindow" class="backlogViewDiv">
       <g:render template="/org/scrumtime/web/views/backlog/mainBacklogViewWindow"/> 
    </div>
    <div id="backlogInformation">
        <g:render template="/org/scrumtime/web/views/backlog/currentSettings"/>
    </div>

</center>
<g:javascript>
    function setBacklogHeight(backlogSize){
        if (backlogSize < 50){
            $('mainBacklogViewWindow').style.height = 390;
        }
    }

    function createDraggable(id){
        new Draggable('draggable_' + id, {
            revert: true,
            handle: 'dragHandle_' + id
        });
    }


    Droppables.add('productBacklog', {
        accept: 'draggableBacklogItem',
        hoverclass: 'dragHover',
        onDrop: function(element) {
            window.location = "${createLink(controller: 'backlog',
                action: 'dragToProductBacklog')}" + "?id=" + element.identify().substring(10);
    }
    });
    Droppables.add('releaseBacklog', {
      accept: 'draggableBacklogItem',
      hoverclass: 'dragHover',
      onDrop: function(element) {
        window.location = "${createLink(controller: 'backlog',
            action: 'dragToReleaseBacklog')}" + "?id=" + element.identify().substring(10);
    }
    });
    Droppables.add('sprintBacklog', {
        accept: 'draggableBacklogItem',
        hoverclass: 'dragHover',
        onDrop: function(element) {
            window.location = "${createLink(controller: 'backlog',
                action: 'dragToSprintBacklog')}" + "?id=" + element.identify().substring(10);
    }
    });

</g:javascript>

</body>
</html>


