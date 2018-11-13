# Gathr Framework

![alt text](https://img.shields.io/badge/Vers%3A-3-333.svg?style=flat "Version 3")
![alt text](https://img.shields.io/badge/Gathr%20API%20Vers%3A-4-lightgrey.svg?style=flat "Gathr API Verson")
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![alt text](https://img.shields.io/badge/Cocoapods%3A-compatible-red.svg?style=flat "Cocoapods compatible")
![alt text](https://img.shields.io/badge/Platform%3A-iOS-blue.svg?style=flat "Platforms")
[![Twitter](https://img.shields.io/badge/Twitter%3A-%40WEBDMG-blue.svg?style=flat)](http://twitter.com/WEBDMG)
### Requirements 
___

- iOS 9.0+
- Xcode 8.2+
- Swift 3.0

### Installation
___
[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

To integrate GathrFramework into your Xcode project using CocoaPods, specify it in your `Podfile`:
```

source 'https://github.com/CocoaPods/Specs.git'
source 'https://bitbucket.org/webdmg/wspecs.git'

platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'gathrFramework', '~> 3.0.0'
end

```

Then, run the following command:

``` $ pod install ```


### Usage

```
import  gathrFramework
_ = GConfiguration()

```
In app delegate inside ```func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {``` Method
