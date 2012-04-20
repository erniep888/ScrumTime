// Guidance
var product = new Product(name, owner name, description [optional]);
var release = product.CreateRelease(name, target date, description [optional]);
var sprint = product.CreateSprint(name, target start, target finish);
sprint.Start();
sprint.StartAsOf(date);
sprint.Cancelled();
sprint.CancelledAsOf(date);
sprint.Finish();
sprint.FinishAsOf(date);
var task = sprint.CreateTask();
// The default ScrumTasks are created by merging most recent Sprint Tasks with most recent ScrumTasks.
var scrum = sprint.CreateScrum();
var scrum = sprint.CreateScrumAsOf(date);  // must be today or in the past
var scrumTasks = scrum.ScrumTasks;

// Object Hierarchy
Product
    Release
    Story
        Task
    Sprint
        Scrum
            ScrumTasks
// Future
Team
    