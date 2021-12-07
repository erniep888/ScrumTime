# ScrumTime 2.0 #

I initially created ScrumTime in 2007 as a side project to keep track of work done professionally.  By 2012, I happily moved on to use non-open-source Scrum and Kanban products but I am starting to miss the simplicity of what I had with ScrumTime.  I like many of the features that come with the large Agile project management tools available today, but sometimes I just want to organize with my team in Scrum fashion without a lot of overhead.

Therefore, the purpose of ScrumTime 2.0 is to stay aligned to the vision of Scrum itself and to provide a tool for other open-source projects to leverage freely.

*(Side note: Technically, Scrum does not require a tool; just a whiteboard.  So, I understand that a "Scrum tool" is an oxymoron.  However, with the pandemic continuing to keep my teammates from meeting in the same room with any regularity, I need some sort of simplified tool to act as the whiteboard of stories and the focal-point for organizing work.)*

## Fundamental Requirements ##

- Must be a simplified, functional, and practical representation of pure Scrum
- Must be extensible by anyone via an extensions interface
- It is not expected to run as a multi-tenat application with multiple organizations
- User security cannot be coupled to one implementation and is open by default
- Multiple projects must be supported
- Multiple teams must be supported
- Files/Artifacts may be associated with Projects, Users, Teams, Epics, Stories, Tasks, or Bugs

## Features ##

- Microservices architecture that allows components to be switched out as desired
- Web front-end must be mobile-first in design

## Questions and Answers ##

- Will you provide example extensions?
  - Yes
- Will there be a hosted version like before?
  - Yes, there is a strong possibility, but I am working through the particulars of how an SLA could work for this.  Also, this may require the implementation of Google Drive, Dropbox, Box, OneDrive, and other cloud provider extensions so that artifacts function properly.  
- Will there be an Active Directory NTLM user authentication extension?
  - The order of priority for user authentication extenstions is currently: GitHub, Google, Microsoft (OAuth 2.0), Twitter, Facebook, and then NTLM authentication.  The community may implement an extension for this sooner.
- Will there be an integration with Teams, Slack, or other similar collaboration platform?
  - This is a secondary goal for ScrumTime.  The long-term plan is to have extensions that promote visibility and action-taking within these collaborative platforms.
- Will there be an integration with build tools such as Jenkins, Bamboo, Azure Pipelines, etc.?
  - This is a secondary goal for ScrumTime.  The long-term plan is to have extensions that interface with these build tools.
- Will there be a timesheet and invoice generation feature within ScrumTime?
  - These are examples of extensions that can be added.  Ideally, these features would reside in other systems and an interface can be developed between ScrumTime and the other system in order to have the best of both worlds.

