# ScrumTime

The vision of ScrumTime is to provide a simple Agile project management tool to the open source community.

There have been several different implementations of this web application but none were completed to a full production level status.  The 1.0 version is intended to provide the initial production level implementation.  

**The most important goal of Scrumtime 1.0 is to provide a complete separation between the REST API and the Single Page Application UI.**

### Todo ###
- Get the ScrumTime.Foundation working before renaming to ScrumTime.Core
- Ensure that the db can be switched to SQLServer (do not force MongoDB to be used)
- Consult OWASP to determine the best secure JSON approach
- Standup public service in cloud hosted environment
- Create a new UI that is a Single Page Application
- Evaluate GitHub and BitBucket user authentication mechanisms to determine if both can be supported

### 1.0 Minimum Features
_**API supporting:**_
- **User** - A user is the ScrumTime secured user that belongs to the default organization. This provides the CRUD operations for the user.
- **Authority** - An authority defines the ScrumTime authorization of the user.
- **Backlog** - The organization of stories in priority order of completion.  This provides the CRUD operations for the backlog list.
- **Product** - A product may have stories, tasks, bugs, sprints, releases, or artifacts.
- **Team** - A team belongs to the default organization and has team members and artifacts.
- **TeamMember** - A teamMember belongs to a team and may have artifacts.
- **Story** - A story belongs to a product, may contain artifacts, and may have child tasks or bugs.
- **Task** - A task belongs to a story and/or a bug and may have artifacts.
- **Sprint** - A sprint belongs to a product and may have stories and artifacts.
- **Release** - A release belongs to a product and may have sprints and artifacts.
- **Artifact** - An artifact belongs to a product, teamMember, team, story, task, sprint, bug, or release.  This is an uploadable file.
- **Bug** - A bug belongs to a product, story, or bug and may have tasks and artifacts.

_**Single-Page-Application:**_
    - Separate the UI project completely from the rest-api

### Post 1.0 Features
_**API supporting:**_ 
- **HierarchicalEpic** - Allows epics to be defined with parent/child relationships to other Epics.
- **HierarchicalStory** - Allows stories to be defined with parent/child relationships to other Stories.
- **HierarchicalTask** - Allows tasks to be defined with parent/child relationships to other Tasks.
- **Actor** - An actor belongs to a product and may be used by multiple stories and has artifacts.
- **TeamRole** - A team role belongs to a team member.
- **TeamMember** - A team member belongs to a team and has artifacts.
- **Customer** - A customer belongs to a product and default organization and has support tickets, ideas, feature requests, and invoices.
- **SupportTicket** - A support ticket belongs to a customer and a product and has bugs, stories, sprints, and releases.
- **FeatureRequest** - A feature request belongs to a customer and a product and has bugs, stories, sprints, releases, and artifacts.
- **ParkingLot** - A parking lot belongs to a product and has stories, feature requests, and ideas.
- **Idea** - An idea belongs to a parking lot and has artifacts.
- **Impediment** - An impediment belongs to a sprint and has teams, team members, tasks, stories, customers, support tickets, ideas, and artifacts.
- **CustomerWiki** - A customer wiki belongs to a product and has customer surveys, impediments, ideas, feature requests, support tickets, release notes, invoices, invoice alerts, release alerts, and artifacts.
- **TeamWiki** - A team wiki belongs to a team and/or default organization and has team members, teams, work assignment alerts, sprint notes, release notes, release alerts, impediments, and artifacts.
- **Invoice** - An invoice belongs to a customer and product.
- **CustomerSurvey** - A customer survey belongs to a customer wiki.
- **ReleaseNote** - A release note belongs to a release and has customer wikis and team wikis.
- **SprintNote** - A sprint note belongs to a sprint and has team wikis.
- **InvoiceAlert** - An invoice alert belongs to a customer and has customer wikis.
- **ReleaseAlert** - A release alert belongs to a release and has customer wikis and team wikis.
- **WorkAssignmentAlert** - A work assignment alert belongs to a product and has users.

_**Single-Page-Application:**_
- *The *SPA** UI will likely break release cycle from the REST API at this point to accommodate a quick release cycle for the UI separate from the API.

###Languages
- Javascript
- CSS
- HTML
- SQL/JSON

###API Server Environment
Node.js 

###Data Store
Making use of loopback.io to expose data that was originally stored in MSSQL.  With future 1.x releases, I plan to support the following databases: MySQL, PostgreSQL, MSSQL, and MongoDB.