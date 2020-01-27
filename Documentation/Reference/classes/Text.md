**CLASS**

# `Text`

```swift
open class Text
```

> Gathr Text object

## Properties
### `textid`

```swift
public var textid:String = String()
```

> Text id assigned by Gathr

### `title`

```swift
public var title:String = String()
```

> String title of Text. Set by the user.

### `text`

```swift
public var text:String = String()
```

> Body of the text. Set by the user.

### `author`

```swift
public var author:String = String()
```

> The name of the person or persons that wrote the test. Set by the user.

### `type`

```swift
public var type:String = String()
```

> Can be quote or atricle. Set by the user.

### `date`

```swift
public var date:String = String()
```

> Date created

## Methods
### `init(data:)`

```swift
public init(data: NSDictionary)
```

> Init to create Text object
>  - Parameter data: json data set to a dictionary

#### Parameters

| Name | Description |
| ---- | ----------- |
| data | json data set to a dictionary |

### `init(dictionary:)`

```swift
public init(dictionary: NSDictionary)
```

> If data is already a dictionary and you need to convert it to an Text object
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
