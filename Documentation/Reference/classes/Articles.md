**CLASS**

# `Articles`

```swift
open class Articles
```

> Gathr articles object

## Properties
### `title`

```swift
public var title:String = String()
```

> Title of the article

### `excerpt`

```swift
public var excerpt:String = String()
```

> Excerpt of article

### `featuredImage`

```swift
public var featuredImage:String = String()
```

> Featured image of the article

### `link`

```swift
public var link:String = String()
```

> Link to article on the internet

### `content`

```swift
public var content:String = String()
```

> Main body content of the article post

## Methods
### `init(data:)`

```swift
public init(data: NSDictionary)
```

> Init to create Article object
> - Parameter data: json data set to a dictionary

#### Parameters

| Name | Description |
| ---- | ----------- |
| data | json data set to a dictionary |

### `toDictionary()`

```swift
open func toDictionary() -> NSDictionary
```

> Convert Object to Dictionary
