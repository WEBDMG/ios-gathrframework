**CLASS**

# `Item`

```swift
open class Item
```

> Gathr Items object

## Properties
### `id`

```swift
public var id:String = String()
```

> Item id assigned by Gathr

### `name`

```swift
public var name:String = String()
```

> String name of item. Set by the user.

### `desc`

```swift
public var desc:String = String()
```

> String description of the item. Set by the user.

### `price`

```swift
public var price:String = String()
```

> Price of the item. Set by the user.

### `image`

```swift
public var image:String = String()
```

> URL to an image uploaded by the user.

### `status`

```swift
public var status:String = String()
```

> A acitvie non-active status. Set by the user.

### `inventory`

```swift
public var inventory:String = String()
```

> Quantity of item the user has. Set by the user.

## Methods
### `init(data:)`

```swift
public init(data: NSDictionary)
```

> Init to create Item object
> - Parameter data: json data set to a dictionary

#### Parameters

| Name | Description |
| ---- | ----------- |
| data | json data set to a dictionary |

### `init(dictionary:)`

```swift
public init(dictionary: NSDictionary)
```

> If data is already a dictionary and you need to convert it to an Item object
> - Parameter dictionary: NSDictionary data to be passed in.

#### Parameters

| Name | Description |
| ---- | ----------- |
| dictionary | NSDictionary data to be passed in. |

### `toDictionary()`

```swift
open func toDictionary() -> NSDictionary
```

> Convert Object to Dictionary
