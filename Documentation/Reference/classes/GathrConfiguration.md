**CLASS**

# `GathrConfiguration`

```swift
public class GathrConfiguration: NSObject
```

> Configuration set after reading in playme file.

## Properties
### `configDictionary`

```swift
public var configDictionary : NSDictionary?
```

> Configuration items stored as dictionary

## Methods
### `init()`

```swift
public override init()
```

> Init Method

### `TOKEN()`

```swift
public func TOKEN()-> String?
```

> Gets token from configuration dictonary and returns it as a string.

### `BASE_URL()`

```swift
public func BASE_URL()-> String?
```

> Gets base url for Gathr API with a default set to the lastest stable url from configuration dictonary and returns it as a string.

### `PLAYMEAPPTOKEN()`

```swift
public func PLAYMEAPPTOKEN()-> String?
```

> Gets play me app token from configuration dictonary and returns it as a string.

### `APIKEY()`

```swift
public func APIKEY()-> String?
```

> Gets users api key from configuration dictonary and returns it as a string.
