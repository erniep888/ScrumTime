# ScrumTime #

## Definition ##

The vision of ScrumTime is to provide a simple Agile project management tool to the open source community.

There have been several different implementations of this web application but none were completed to a full production level status. The 1.0 version will provide the initial production level implementation.  The current version is 0.9.1 Alpha.

**The most important goals of Scrumtime 1.0 are to provide an open source Agile project management tool that is free to use in the cloud and is available to install locally.**

## Requirements of ScrumTime ##

> There are four primary questions that should be answered when starting any software application regardless of the project management methodology being used.  ScrumTime 1.0 is required allow users to address each question for their project.
> * **WHAT** is being created?
> * **HOW** is it being created?
> * **WHO** is concerned?
> * **WHEN** is it being created?

> ### **WHAT** is being created? ###
> The completeness of the answer to the "WHAT question" usually varies based on the project management methodology.  For example, a project following an Agile or Rapid methodology, tends to work on detailed requirements and design throughout the application implementation process.  Conversely, a Waterfall Model strives to figure out requirements and design before one line of code has been written.  In all cases there should at least be a skeleton of the entire proposed application.  When there is no forethought about what is being requested, there will be little chance of success.  Therefore, ScrumTime expects **Requirements** to be gathered and **Features** to be documented that address each requirement.  It is possible for one Feature to address multiple requirements.  Each level supports hierarchical relationships to allow for further breakdown to the lowest desired detail.  In other words, a Requirement may be a child of another Requirement and a Feature may be the child of another Feature. **Constraints** are also associated with "What" is being built.  A Constraint may include budget, time, people, hardware, or other.  When defining "What" an application is to be, Constraints must be considered.

> ### **HOW** is it being created? ###
> The "HOW question" addresses the **Epics**, **Stories**, and **Tasks** that derive from the "WHAT question." The **Epics** are created to address Features, **Stories** are created to breakdown Epics, and **Tasks** breakdown Stories.  Each level may have a hierarchy for further breakdown to the lowest desired detail.  For example, an Epic may have one or more Epic children or Story children. But, an Epic may have only one Epic parent.  Likewise, a Story may have only one Epic or Story parent and a Task may have only one Story or Task parent. **Bugs** are also tracked as part of "How" and they may be tied to an Epic, Story, or Task.

> ### **WHO** is concerned? ###
> The "WHO question" relates to the people who are **Responsible**, **Accountable**, **Consulted**, and **Informed** (RACI) concerning the application. 

> ### **WHEN** is it being created? ###
> The "WHEN question" addresses the entire schedule for the project.  This involves the creation of an **Iteration Plan**, **Milestone Plan**, and **Release Plan**.

---------------------------------------

## Features for 0.9.1 Release ##

* Epic microservice
  * Epics can have one and only one parent Epic
* Story microservice
  * Stories can have an Epic parent or a Story parent
* Task microservice
  * Tasks can have a Story parent or a Task parent
* Bug microservice
  * Bugs can have a Task parent, a Story parent, or an Epic parent
* User Interface for management of Epics, Stories, Tasks, and Bugs.
* Deploy API services as microservice architecture
  * Make use of [Ocelot](https://github.com/ThreeMammals/Ocelot) for the Web API Gateway.

---------------------------------------

## Features for 0.9.2 Release ##

* Add GitHub as user authentication mechanism
* User microservice
* Sprint microservice
* Milestone microservice
* Release microservice
* User Interface for management of users, sprints, milestones, and releases.
* Event Queue
  * Allows services to get updates from other services

---------------------------------------

## Features for 0.9.3 Release ##

* Organization microservice
* Team microservice
  * Allows TeamMembers to be created...mapping of a non-user or user to a team.
  * Teams are associated with Organizations
* Project microservice
  * Projects are associated with organizations
  * Teams are associated with Projects
* Artifact microservice

---------------------------------------

## Features for 0.9.4 Release ##

* Dashboard microservice
    * Card - Bug count per project
    * Card - Burn down per Sprint
    * Card - Milestone schedule per project
    * Card - Release schedule per project

---------------------------------------

## Features for 0.9.7 Release ##

* Document the architecture
* Document the User Interface
* Document the development, installation, build, and testing steps.
* Bug fixes

---------------------------------------

## Features for 0.9.8 Release ##

* Provide an export data mechanism that allows users to download all their data for import into other systems.
* Bug fixes

---------------------------------------

## Features for 0.9.9 Release ##

* Standup public service in cloud hosted environment
  * Allow others to use the service freely as long as my own funds allow
  * Ensure https is configured properly using a legitimate certificate
  
---------------------------------------

## Development ##

### Installation Steps ###

* TBD - Will be part of 0.9.7 Release.

### Build ###

* TBD - Will be part of 0.9.7 Release.

### Development Run ###

* TBD - Will be part of 0.9.7 Release.

### Unit Test ###

* SUT is System Under Test
* xunit, Moq, and AutoFixture are used to provide a testing framework, an injection framework, and a mock data framework respectively.

### End-to-End Test ###

* TBD - Will be part of 0.9.7 Release.

### All Tests ###

* TBD - Will be part of 0.9.7 Release.

### Version ###

0.9.1 Alpha

### Languages ###

* [TypeScript 2.7](https://www.typescriptlang.org/)
* [C# 7.3](https://docs.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-7-3)

### ChangeLog ###

* 0.9.1 Alpha
  * README.md addition of requirements and features.
* 0.9.0 Beta1
  * ASP.NET MVC 3 release
  * Used Entity Framework and SQL Server
* 0.7.0
  * Last release in Grails
  * New backlog editor
  * New management editor
* 0.6.0
  * Grails continued
* 0.5.0
  * Grails continued
* 0.4.0
  * initial creation in Grails
