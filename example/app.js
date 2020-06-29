// This is a test harness for the TiTestFairy module
//
// The following code presents a screen with test buttons for all of the
// applicable TestFairy SDK API methods
//
// Copyright (c) 2015 TestFairy

var correlationId = 'TiTestFairyExample';
var checkpointName = 'CheckPointExample';


// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white',
  	layout: 'vertical'
});
var titleLabel = Ti.UI.createLabel({
  top: 50,
  textAlign: Ti.UI.TEXT_ALIGNMENT_CENTER
});
win.add(titleLabel);


// module tests - show SDK version in the title text label

var TiTestFairy = require('com.testfairy.titestfairy');
Ti.API.info("module is => " + TiTestFairy);

titleLabel.text = 'TestFairy SDK v' + TiTestFairy.version;


// connect with your App Token (from your TestFairy welcome email) and initialize a TestFairy session

TiTestFairy.begin("<Enter your API APP token here>");

// Sets a correlation identifier for this session. This value can
// be looked up via web dashboard. For example, setting correlation
// to the value of the user-id after they logged in. Can be called
// only once per session (subsequent calls will be ignored.)

TiTestFairy.setCorrelationId(correlationId);

// Pushes the feedback view controller. Hook a button
// to this method to allow users to provide feedback about the current
// session. All feedback will appear in your build report page, and in
// the recorded session page.

var feedbackButton = Ti.UI.createButton({ title: 'Push Feedback VC', width: 300, top: 20 });
win.add(feedbackButton);

feedbackButton.addEventListener('click', function() {
	TiTestFairy.pushFeedbackController();
});


// Send a feedback on behalf of the user. Call when using a in-house
// feedback view controller with a custom design and feel. Feedback will
// be associated with the current session.
var userFeedbackTextField = Ti.UI.createTextField({
	borderStyle: Ti.UI.INPUT_BORDERSTYLE_LINE,
	color: '#666',
	top: 20, left: 15, right: 15,
	height: 'auto',
	hintText: 'Test User Feedback Text',
	keyboardType: Titanium.UI.KEYBOARD_DEFAULT,
	returnKeyType: Titanium.UI.RETURNKEY_DEFAULT
});
win.add(userFeedbackTextField);

var userFeedbackButton = Ti.UI.createButton({ title: 'Send User Feedback', width: 300, top: 20 });
win.add(userFeedbackButton);

userFeedbackButton.addEventListener('click', function() {
	if (userFeedbackTextField.hasText()) {
  		TiTestFairy.sendUserFeedback(userFeedbackTextField.getValue());
 	} else {
 		var dialog = Ti.UI.createAlertDialog({
		    message: 'Enter some text in the above TextField to test this method call',
		    ok: 'OK',
		    title: 'No string to send'
		}).show();
 	}
});


// Proxy didUpdateLocation delegate values and these
// locations will appear in the recorded sessions. Useful for debugging
// actual long/lat values against what the user sees on screen.

// basic solution to allow the passing of lat/long pairs to the TestFairy SDK
// the array passed can hold multiple lat/long pairs

var locationCoordinates = {
	latitude: 0.0,
	longitude: 0.0
};

var locations = [];
locations.push(locationCoordinates);

var updateLocationButton = Ti.UI.createButton({ title: 'Update Location to 0.0, 0.0', top: 20 });
win.add(updateLocationButton);

updateLocationButton.addEventListener('click', function() {
	TiTestFairy.updateLocation(locations);
});

// Marks a checkpoint in session. Use this text to tag a session
// with a checkpoint name. Later you can filter sessions where your
// user passed through this checkpoint, for bettering understanding
// user experience and behavior.

var checkpointButton = Ti.UI.createButton({ title: 'Create Checkpoint "' + checkpointName +'"', width: 300, top: 20 });
win.add(checkpointButton);

checkpointButton.addEventListener('click', function() {
	TiTestFairy.checkpoint(checkpointName);
});


// Pauses/resumes the current session. The pause() method stops recoding of
// the current session until resume() has been called.

var pauseResumeButton = Ti.UI.createButton({ title: 'Pause', width: 300, top: 20 });
win.add(pauseResumeButton);

var isPaused = false;

pauseResumeButton.addEventListener('click', function() {

	if (isPaused) {
		TiTestFairy.resume();
		pauseResumeButton.title = 'Pause';
	} else {
		TiTestFairy.pause();
		pauseResumeButton.title = 'Resume';
	}
	isPaused = !isPaused;

});


// Returns the address of the recorded session on testfairy's
// developer portal. Will return nil if recording not yet started.

var sessionUrlButton = Ti.UI.createButton({ title: 'Fetch Session URL', width: 300, top: 20 });
win.add(sessionUrlButton);

sessionUrlButton.addEventListener('click', function() {
	alert(TiTestFairy.sessionUrl());
});

// Takes a screenshot.
var screenshotButton = Ti.UI.createButton({ title: 'Take a Screenshot', width: 300, top: 20 });
win.add(screenshotButton);

screenshotButton.addEventListener('click', function() {
	TiTestFairy.takeScreenshot();
});

win.open();
