**CLASS**

# `GathrVideo`

```swift
open class GathrVideo: NSObject
```

> Get Gathr Videos from API

## Properties
### `video`

```swift
public var video:[Video] = [Video]()
```

> Array of Gathr Video objects

## Methods
### `init()`

```swift
public override init()
```

> init method

### `getAllVideos(_:)`

```swift
open func getAllVideos(_ completion: @escaping ([Video]?) -> Void)
```

> Get all videos for a given token and playme app.
> - Parameter completion: returns array of video objects.

#### Parameters

| Name | Description |
| ---- | ----------- |
| completion | returns array of video objects. |