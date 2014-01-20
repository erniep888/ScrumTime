ScrumTime
=========

Definition
------
ScrumTime is an open source web-based Scrum project management tool. This tool is intended to be intuitive, flexible, and extensible.

The UI is composed entirely of HTML, javascript, and CSS.  The primary javascript library that makes this possible is AngularJS.  The data is supplied via RESTful interface with JSON data format.

Purpose
------
ScrumTime is focused on distributed agile software development teams. 

###Features###

Identify the Project
* Objective
* Define the Actors
* Define Scrum Teams
	* Define Scrum Roles
	* Assign Roles to ScrumTime Users
* Create Team Wiki

Plan the Project
* Manage the Backlog (epics, stories, bugs)
* Manage / Create Epics
* Manage / Create Stories
* Identify the Source Control System
	* GitHub
	* Git
	* SVN
	* CVS
	* Source Safe
	* Clearcase
	* Team Foundation Server
* Set Iteration Defaults
	* Length
	* Naming pattern
	* Identify typical workdays and time of day
* Maintain / Generate Iteration Schedule
* Maintain a Parking Lot
	* Features and ideas that are nice to haves

Execute the Project
* Maintain the Story Board
* Document the Daily Scrum
* Manage bugs

Sustain the Project
* Manage Support Tickets
* Manage / Generate Client Billing
* Create a Client Wiki

Report on the Project
* Burn Down Chart
* Burn Up Chart
* Resource Reporting
	* Team member work load
	* Team work load
* Alerting
	* Epic status change
	* Story status change
	* Bug status change
	* Support Ticket status change

Design
------
Layers
* MVC UI in Browser - AngularJS, jQuery, HTML, CSS
* Network - JSON / AJAX
* RESTful Server API - Implemented with either Grails or ASP.NET (decision coming Jan 30, 2014)

Future
------
I would like to find someone interested in doing an Android app, an iPhone app, and/or a Windows phone app.  These apps will be relatively simple because they will reuse the RESTful Server API.  It will not make sense to begin these efforts until the API is available.  I expect that to be June 2014.  Please email: epaschall@bytefirm.com if you are intersted.