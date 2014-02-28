var mongoose = require('mongoose');

// Subdocument schema for story tasks
var taskSchema = new mongoose.Schema({ 
	text: String,
	hourEstimate: 'Number'
});

// Subdocument schema for stories
var storySchema = new mongoose.Schema({ 
	title: 'String',
	points: 'Number',
	tasks: [taskSchema]
});
