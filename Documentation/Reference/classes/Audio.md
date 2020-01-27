**CLASS**

# `Audio`

```swift
open class Audio
```

> Gathr audio object

## Properties
### `sidid`

```swift
public var sidid:String = String()
```

> Audio id assigned by Gathr

### `title`

```swift
public var title:String = String()
```

> Title of audio file set by user on upload

### `songs`

```swift
public var songs:String = String()
```

> ???

### `video`

```swift
public var video:String = String()
```

> Video URL

### `link`

```swift
public var link:String = String()
```

> URL to audio file

### `aboutTrack`

```swift
public var aboutTrack:String = String()
```

> String description of the content of audio file. Set by the user.

### `writtenBy`

```swift
public var writtenBy:String = String()
```

> Production credits for the person that wrote the content of the auiod file. Set by the user at upload.

### `source`

```swift
public var source:String = String()
```

> Can be "uploaded" of "soundcloud"

### `artistName`

```swift
public var artistName:String = String()
```

> String name of person or persons that performed the audio. Set by the user at upload.

### `facebook`

```swift
public var facebook:String = String()
```

> Social media link to app owners social media. Set by the user at upload.

### `twitter`

```swift
public var twitter:String = String()
```

> Social media link to app owners social media. Set by the user at upload.

### `image`

```swift
public var image:String = String()
```

> Social media link to app owners social media. Set by the user at upload.

## Methods
### `init(data:)`

```swift
public init(data: NSDictionary)
```

> Init method
> - Parameter data: json data set to a dictionary

#### Parameters

| Name | Description |
| ---- | ----------- |
| data | json data set to a dictionary |

### `init(dictionary:)`

```swift
public init(dictionary: NSDictionary)
```

> If data is already a dictionary and you need to convert it to an audio object
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
