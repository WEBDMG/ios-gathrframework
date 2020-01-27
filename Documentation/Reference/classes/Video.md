**CLASS**

# `Video`

```swift
open class Video
```

> Gathr Video object

## Properties
### `sidvid`

```swift
public var sidvid:String = String()
```

> Video id assigned by Gathr

### `title`

```swift
public var title:String = String()
```

> TItile of video. Set by the user.

### `video`

```swift
public var video:String = String()
```

> URL to youtube video.

### `videoM`

```swift
public var videoM:String = String()
```

> URL to video uploaded into the Gathr System.

### `image`

```swift
public var image:String = String()
```

> URL to poster image for video that was uploaded bu the user.

### `type`

```swift
public var type:String = String()
```

> Can only be Youtube or uploaded.

## Methods
### `init(data:)`

```swift
public init(data: NSDictionary)
```

> Init to create Video object
> - Parameter data: json data set to a dictionary

#### Parameters

| Name | Description |
| ---- | ----------- |
| data | json data set to a dictionary |

### `init(dictionary:)`

```swift
public init(dictionary: NSDictionary)
```

> If data is already a dictionary and you need to convert it to an Video object
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
