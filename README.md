# ScrumTime

The vision of ScrumTime is to provide a simple Agile project management tool to the open source community.

There have been several different implementations of this web application but none were completed to a full production level status.  The 1.0 version is intended to provide the initial production level implementation.

### Microservices API

-Users
Provides the authentication and authorization features.  This includes application-level roles.

-Organizations
Provides the organization create/read/update/delete features.

-Backlog
Provides story backlog create/read/update/delete features.

Tasks
-Provides the task create/read/update/delete features.

Releases
-Provides the release create/read/update/delete features.

Sprints
-Provides the sprint create/read/update/delete features.

-Bugs
Provides the bug management api.

-Stories
Provides the story create/read/update/delete features.

-Artifacts
Provides the artifact create/read/update/delete features.

_**1.0 Minimum Features:**_ stories, tasks, bugs, upload artifacts, releases, sprints, organization

_**Post 1.0 Features:**_ hierarchical epics, hierarchical stories, hierarchical tasks, support tickets, multiple projects, multiple teams

_**Long-Term Desired Features:**_ client billing, project estimating, client wiki, team wiki

_**1.0 Datastore:**_ MongoDB

_**Languages:**_ Javascript, css, html
