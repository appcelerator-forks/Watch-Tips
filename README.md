# Tip Calculator 

![alt tag](https://raw.githubusercontent.com/magnatronus/Watch-Tips/master/screenshots/Simulator%20Screen%20Shot%205%20Mar%202017%2C%2008.49.12.png)

This project is a working example of creating a Titanium iOS app and an associated Watch App (in Swift). The app is also available on the app store here: 

https://itunes.apple.com/us/app/watch-tips/id1205407902?ls=1&mt=8. 

The app was built using the Ti SDK and CLI only using Sublime Text as the IDE with a custom plugin for Titanium dev.

## Introduction

I attempted to do a similar project over a year ago with Titanium and got all the way to submitting the app to the App Store, but even after successful validation and upload I always got an email back from Apple with a rejection notice (see JIRA here: https://jira.appcelerator.org/browse/TIMOB-23313)

This various issue seemed to finally get resolved in TI SDK 6.0.1.GA  so I decided to create another, simple app to see what happened,  the result is this simple project.


## Running the app

As I have mentioned I used the CLI for all parts of this project and the command used to run the phone and watch app in the simulators is:

```
ti build -p ios --device-id --log-level info  --launch-watch-app
```
This allows you to select the phone model (and iOS version if you have more than 1 installed)


## Notes

My first submission was rejected due to HIG issues, specifically

* The Watch Icon I used had a black background so the icon did not look as though it was round on the black aground of the watch.
* I used custom titles of the dialog views to change the Bill, Tip and Split values of '< calculator'. This is a big no-no as it specifically states that the correct way to close a modal is with the Close button that can be re-named but MUST not include a <.

Note to self - read this first: https://developer.apple.com/watchos/human-interface-guidelines/overview/


## Updates

version 1.0.2 of the Watch App is coded to use the Digital Crown to change the values of the Tip percentage and the Split value rather than pop up a seperate screen 


### Disclaimer

Neither the Titanium project (and especially the Swift code) is supposed to be best practice, it was written to see if the past issue was resolved. But please feel free to take a look and use any of the code.





