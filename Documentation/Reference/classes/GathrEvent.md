**CLASS**

# `GathrEvent`

```swift
open class GathrEvent : NSObject
```

> Creates array of Gathr Event Objects

## Properties
### `event`

```swift
public var event:[Event] = [Event]()
```

> Gathr Event Objects Array

## Methods
### `init()`

```swift
public override init()
```

> Init method

### `getAllEvents(_:)`

```swift
open func getAllEvents(_ completion: @escaping ([Event]?) -> Void)
```

> Gets all events from the Gathr API that is set to active and the date for the event is not in the past.
> - Parameter completion: returns array of Gathr Event Objects

#### Parameters

| Name | Description |
| ---- | ----------- |
| completion | returns array of Gathr Event Objects |