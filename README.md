# ScrumTime

ScrumTime will provide an end-to-end agile project management tool that has a goal of being simple to use, simple
to change, and simple to integrate with other systems.  With this in mind, I have decided to go with a node.js backend 
and angularjs front end that will be deployed via the "public" folder of the node.js Express web application.  However,
the angularjs portion is developed separately from the express portion.

## Update - Nov 2014
My wife had the baby...

Now, there is a lot todo.  I am getting rid of the dependency on yeoman and I plan to adhere the project structure guidelines outlined by Google for enterprise level applications.

### Next Release

1.0 GA ( 2015 )

_**Projects:**_ 

		- scrumtime-angularjs (web browser UI)
		- [backlog-json-api](https://github.com/erniep888/backlog-json-api "backlog-json-api") (JSON server)		

_**Datastore:**_ MongoDB

_**Languages:**_ Javascript, css, html

_**Features:**_ hierarchical epics, hierarchical stories, tasks, bugs, support tickets, upload attachments, releases, sprints

_**Stretch Features:**_ client billing, project estimating, client wiki, team wiki