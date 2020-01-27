**CLASS**

# `GathrItem`

```swift
open class GathrItem:NSObject
```

> Gathr Items Objects Arry

## Properties
### `item`

```swift
public var item:[Item] = [Item]()
```

> Gathr Items Objects array

## Methods
### `init()`

```swift
public override init()
```

> init method

### `getAllItems(_:)`

```swift
open func getAllItems(_ completion: @escaping ([Item]?) -> Void)
```

> Gets all items from the Gathr API that is set to active
> - Parameter completion: returns array of Gathr Item Objects

#### Parameters

| Name | Description |
| ---- | ----------- |
| completion | returns array of Gathr Item Objects |