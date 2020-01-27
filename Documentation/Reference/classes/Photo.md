**CLASS**

# `Photo`

```swift
open class Photo
```

> Gathr Photo object

## Properties
### `title`

```swift
public var title:String = String()
```

> String title of the Photo. Set by the user.

### `url`

```swift
public var url:String = String()
```

> URL to the photo. Set by Gathr during image upload.

### `source`

```swift
public var source:String = String()
```

> can be uploaded or instagram. Set by Gathr

### `active`

```swift
public var active:Bool?
```

> Active or inactive flag.

## Methods
### `init(data:)`

```swift
public init(data: NSDictionary)
```

> Init to create Photo object
> - Parameter data: json data set to a dictionary

#### Parameters

| Name | Description |
| ---- | ----------- |
| data | json data set to a dictionary |

### `init(dictionary:)`

```swift
public init(dictionary: NSDictionary)
```

> If data is already a dictionary and you need to convert it to an Photo object
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
