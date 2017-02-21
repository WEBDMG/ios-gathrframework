# Gathr Framework

### Requirements 
___

- iOS 9.0+
- Xcode 8.2+
- Swift 3.0

### Installation
___
[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

``` $ gem install cocoapods ``` 

To integrate Alamofire into your Xcode project using CocoaPods, specify it in your `Podfile`:
```

source 'https://github.com/CocoaPods/Specs.git'
source 'https://bitbucket.org/webdmg/wspecs.git'

platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'gathrFramework', '~> 1.0.0'
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