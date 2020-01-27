**CLASS**

# `Event`

```swift
open class Event
```

> Gathr event object

## Properties
### `eventid`

```swift
public var eventid:String = String()
```

> Id for an event generated by  Gathr

### `venuename`

```swift
public var venuename:String = String()
```

> The name of the location of the event Set by the user at upload.

### `address`

```swift
public var address:String = String()
```

> The full address of the event. Set by the user at upload. Can be used to reverse geolocate a place.

### `date`

```swift
public var date:String = String()
```

> The date of the event Set by the user at upload.

### `time`

```swift
public var time:String = String()
```

> Time of the event in 24hr format Set by the user at upload.

### `notes`

```swift
public var notes:String = String()
```

> Any notes about the event that a user would need to know.  Set by the user at upload.

### `ticketlink`

```swift
public var ticketlink:String = String()
```

> A url to where a user cna purchase tickets or RSVP. Set by the user at upload.

### `marketinglink`

```swift
public var marketinglink:String = String()
```

> A url to a micro site or other web-based item that give users more info about the event. Set by the user at upload.

### `image`

```swift
public var image:String = String()
```

> A URL to a promotional image or flyer of the event. Set by the user at upload.

## Methods
### `init(data:)`

```swift
public init(data: NSDictionary)
```

> Init to create Event object
>  - Parameter data: json data set to a dictionary

#### Parameters

| Name | Description |
| ---- | ----------- |
| data | json data set to a dictionary |

### `init(dictionary:)`

```swift
public init(dictionary: NSDictionary)
```

> If data is already a dictionary and you need to convert it to an Event object
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