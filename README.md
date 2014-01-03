ScrumTime
=========

Definition
------
ScrumTime is an open source web-based Scrum project management tool. This tool is intended to be intuitive, flexible, and extensible.

The UI is composed entirely of HTML, javascript, and CSS.  The primary javascript library that makes this possible is AngularJS.  The data is supplied via RESTful interface with JSON data format.

Purpose
------
ScrumTime is intended to facilitate the management of geographically dispersed Agile software development teams. 

Design
------
Layers
* MVC UI in Browser - AngularJS, jQuery, HTML, CSS
* Network - JSON / AJAX
* RESTful Server API - Implemented with either Grails or ASP.NET (decision coming Jan 30, 2014)

Future
------
I would like to find someone interested in doing an Android app, an iPhone app, and/or a Windows phone app.  These apps will be relatively simple because they will reuse the RESTful Server API.  It will not make sense to begin these efforts until the API is available.  I expect that to be June 2014.  Please email: epaschall@bytefirm.com if you are intersted.