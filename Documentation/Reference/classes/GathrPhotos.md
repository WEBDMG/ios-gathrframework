**CLASS**

# `GathrPhotos`

```swift
open class GathrPhotos : NSObject
```

> Creates array of Gathr Photos Objects

## Properties
### `photos`

```swift
public var photos:[Photo] = [Photo]()
```

> Gathr Photos object

## Methods
### `init()`

```swift
public override init()
```

> init method

### `getAllPhotos(_:)`

```swift
open func getAllPhotos(_ completion: @escaping ([Photo]?) -> Void)
```

> Gets all photo objects from images uploaded by the user that have active set to true.
> - Parameter completion: Returns array of photo objects.

#### Parameters

| Name | Description |
| ---- | ----------- |
| completion | Returns array of photo objects. |