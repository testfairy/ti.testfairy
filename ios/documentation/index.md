# TiTestFairy Official TestFairy Titanium Module for iOS

## Description

The TiTestFairy Module extends the Appcelerator Titanium Mobile framework with the TestFairy iOS SDK. The TestFairy SDK allows integration with TestFairy to give you a better understanding of how your app performs on real devices. It tells you when and how people are using your app, and provides you with any metric you need to optimize for better user experience and better code.

More info and SDK reference: http://docs.testfairy.com/index.html


The module is licensed under the Apache license.


## Referencing the module in your Titanium Mobile application ##

Simply add the following lines to your `tiapp.xml` file:
    
    <modules>
        <module platform="iphone">com.testfairy.titestfairy</module> 
    </modules>

Add the module to your Titanium Mobile project via "Help", "Install Mobile Module..." or by unzipping the contents of the module zip file into your Titanium/modules/iphone folder.

To include the module in your code and use it:

var TiTestFairy = require('com.testfairy.titestfairy');

Then connect to TestFairy with your App Token (from your TestFairy welcome email) and initialize a TestFairy session

TiTestFairy.begin("<your API APP token>");


## Reference

For more detailed code examples take a look at the example app

### TiTestFairy.version

Returns the version of the TestFairy SDK, for example:

`titleLabel.text = 'TestFairy SDK v' + TiTestFairy.version;`


### TiTestFairy.setCorrelationId(correlationId)

* *correlationId* - a string containing a correlation identifier

Set a correlation identifier for this session. This value can be looked up via web dashboard. For example, setting correlation to the value of the user-id after they logged in. Can be called only once per session (subsequent calls will be ignored.)


### TiTestFairy.pushFeedbackController()

Pushes the feedback view controller. Hook a button to this method to allow users to provide feedback about the current session. All feedback will appear in your build report page, and in the recorded session page.


### TiTestFairy.sendUserFeedback(string)

* *string* - the feedback text string you wish to send 

Send a feedback on behalf of the user. Call when using a in-house feedback view controller with a custom design and feel. Feedback will be associated with the current session.


### TiTestFairy.updateLocation(locations)

Proxy didUpdateLocation delegate values and these locations will appear in the recorded sessions. Useful for debugging actual long/lat values against what the user sees on screen.

A basic solution to allow the passing of lat/long pairs to the TestFairy SDK the array passed can hold multiple lat/long pairs

* *locations* - an array of location coordinate lat/long pairs in the following format:

    `{
        latitude: 0.0,
        longitude: 0.0
    }`

Where the values of latitude and longitude are *double* 


### TiTestFairy.checkpoint(checkpointName)

Marks a checkpoint in session. Use this text to tag a session with a checkpoint name. Later you can filter sessions where your user passed through this checkpoint, for bettering understanding user experience and behavior.

* *checkpointName* - a string containing the name for the checkpoint


### TiTestFairy.pause()

Pauses the current session until resume() is called.


### TiTestFairy.resume()

Resumes a paused session.


### TiTestFairy.sessionUrl()

Returns the address of the recorded session on TestFairy's developer portal. Will return nil if recording not yet started.


### TiTestFairy.takeScreenshot()

Takes a screenshot.



Please check example/app.js for a full working example of all supported TestFairy SDK methods.



## Changelog

**v1.0**    

* Initial Implementation. 




## License

    Copyright (c) 2015 TestFairy

    Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
