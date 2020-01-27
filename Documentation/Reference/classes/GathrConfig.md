**CLASS**

# `GathrConfig`

```swift
open class GathrConfig : NSObject
```

> Creates Gathr Config object

## Properties
### `config`

```swift
open var config: Config!
```

> Config object

## Methods
### `init()`

```swift
public override init()
```

> Init Method

### `getConfigApi(_:)`

```swift
open func getConfigApi(_ completion: @escaping (Config) -> Void)
```

> Gets remote config data and passes it back as a dictionary. After reading Playme.plist to get the base url and user token.
>  - Parameter completion: NSDictionary of result

#### Parameters

| Name | Description |
| ---- | ----------- |
| completion | NSDictionary of result |