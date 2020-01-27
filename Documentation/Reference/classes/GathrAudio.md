**CLASS**

# `GathrAudio`

```swift
open class GathrAudio : NSObject
```

> Creates array of Gathr Audio objects

## Properties
### `audio`

```swift
public var audio:[Audio] = [Audio]()
```

> Gathr Audio Objects Array

## Methods
### `init()`

```swift
public override init()
```

> Init method

### `getAllSongs(_:)`

```swift
open func getAllSongs(_ completion: @escaping ([Audio]?) -> Void)
```

> gets all audio objects from Gathr Api that have an active status flag set to true.
> - Parameter completion: Return optional array of audio objects.

#### Parameters

| Name | Description |
| ---- | ----------- |
| completion | Return optional array of audio objects. |