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

_**1.0 Datastore:**_ Varied based on Microservice backend implementation.  The 1.0 release will reuse the Java and Groovy implementation from the 0.6 release to implement the datastore API.  This allows connectivity to multiple relational databases.  Hypothetically, it will allow connection to No-Sql db's too.  I just do not know yet.

_**Languages:**_ Javascript, Java, C#, css, html
