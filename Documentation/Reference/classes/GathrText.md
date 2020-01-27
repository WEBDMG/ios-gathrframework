**CLASS**

# `GathrText`

```swift
open class GathrText: NSObject
```

> Creates array of Gathr Photos Objects

## Properties
### `text`

```swift
public var text:[Text] = [Text]()
```

> Gathr Photos object

## Methods
### `init()`

```swift
public override init()
```

> init method

### `getAllTexts(_:)`

```swift
open func getAllTexts(_ completion: @escaping ([Text]?) -> Void)
```

> Get all text objects from the Gathr API that have the active flag set to true
> - Parameter completion: Returns array of Gathr Text objects.

#### Parameters

| Name | Description |
| ---- | ----------- |
| completion | Returns array of Gathr Text objects. |