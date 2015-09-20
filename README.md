# TestFairy Titanium Module for iOS (TiTestFairy)

The TiTestFairy Module extends the Appcelerator Titanium Mobile framework with the TestFairy iOS SDK. The TestFairy SDK allows integration with TestFairy to give you a better understanding of how your app performs on real devices. It tells you when and how people are using your app, and provides you with any metric you need to optimize for better user experience and better code.

More info and SDK reference: http://docs.testfairy.com/index.html


The module is licensed under the Apache license.


### Installation

* Simply add the following lines to your `tiapp.xml` file:
```xml
<modules>
	<module platform="iphone">com.testfairy.titestfairy</module> 
</modules>
```

* Download the [latest release.](https://github.com/testfairy/ti.testfairy/releases/latest/)

* Add the module to your Titanium Mobiles
  - via “Help”, "Install Mobile Module..." 
  - or by unzipping the contents of the module zip file into your Titanium/modules/iphone folder.

* Include the module in your code and use it:

```javascript
	var TiTestFairy = require('com.testfairy.titestfairy');
	TiTestFairy.begin("API_APP");
```

For more detailed code examples take a look at the example app ????

## Reference

Returns the version of the TestFairy SDK, for example:
`TiTestFairy.version;`

Set an identifier that can be looked up through dashboard
`TiTestFairy.setCorrelationId(correlationId)`

Present a feedback dialog to the user
`TiTestFairy.pushFeedbackController()`

Send a feedback on behalf of the user. Call when using a in-house feedback view controller with a custom design and feel. Feedback will be associated with the current session.
* *string* - the feedback text string you wish to send
`TiTestFairy.sendUserFeedback(string)`

Mark geo location at this point (to be used with `navigator.geolocation.getCurrentPosition`)
* *locations* - an array of location coordinate lat/long pairs in the following format:`{latitude: 0.0, longitude: 0.0}`
`TiTestFairy.updateLocation(locations)`

Mark a checkpoint in session
* *checkpointName* - a string containing the name for the checkpoint
`TiTestFairy.checkpoint(checkpointName)`

Pauses the current session until resume() is called.
`TiTestFairy.pause()`

Resumes a paused session.
`TiTestFairy.resume()`

Returns the address of the recorded session on TestFairy's developer portal. Will return nil if recording not yet started.
`TiTestFairy.sessionUrl()`

Takes a screenshot.
`TiTestFairy.takeScreenshot()`


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
