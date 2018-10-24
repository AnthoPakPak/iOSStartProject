fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios beta
```
fastlane ios beta
```
Push a new adhoc build to HockeyApp
### ios deployProd
```
fastlane ios deployProd
```
Deploy the app on HockeyApp with Prod status
### ios deployStaging
```
fastlane ios deployStaging
```
Deploy the app on HockeyApp with Staging status
### ios hockeyAppEnterprise
```
fastlane ios hockeyAppEnterprise
```
Push a new enterprise build to HockeyApp

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
