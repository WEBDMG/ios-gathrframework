**CLASS**

# `GathrArticles`

```swift
open class GathrArticles : NSObject
```

> Creates array of Gathr Articles Objects

## Properties
### `articles`

```swift
public var articles:[Articles] = [Articles]()
```

> Gathr Article Objects array

## Methods
### `init()`

```swift
public override init()
```

> Init method

### `getAllArticles(_:completion:)`

```swift
open func getAllArticles(_ blogURL:String, completion: @escaping ([Articles]?) -> Void)
```

> Gets all articles from the provided Wordpress URL.
> - Parameters:
>   - blogURL: URL to WP Blog. Base url to blog should be set in the config object pulled from Gathr.
>   - completion: returns array of article objects.

#### Parameters

| Name | Description |
| ---- | ----------- |
| blogURL | URL to WP Blog. Base url to blog should be set in the config object pulled from Gathr. |
| completion | returns array of article objects. |