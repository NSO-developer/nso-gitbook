<a id="cls-StreamNotification"></a>
# StreamNotification

```java
public class com.tailf.notif.StreamNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for Stream notifications.

## Members

**Constructors**:

- [StreamNotification(int, ConfDatetime, ConfXMLParam[], String)](#m-streamnotification-bd5e6ecc4276)

**Fields**:

- [STREAM_NOTIFICATION_COMPLETE](#m-STREAM_NOTIFICATION_COMPLETE)
- [STREAM_NOTIFICATION_EVENT](#m-STREAM_NOTIFICATION_EVENT)
- [STREAM_REPLAY_COMPLETE](#m-STREAM_REPLAY_COMPLETE)
- [STREAM_REPLAY_FAILED](#m-STREAM_REPLAY_FAILED)
- [type](Notification.md#m-type) from Notification

**Methods**:

- [eventTime()](#m-eventtime-52f779266f34)
- [getErrorString()](#m-geterrorstring-3b4eba00496b)
- [getNotificationType()](Notification.md#m-getnotificationtype-f0e32b7b644f) from Notification
- [getStreamEventType()](#m-getstreameventtype-396b63149e8b)
- [getValues()](#m-getvalues-06542a92d7fa)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-streamnotification-bd5e6ecc4276"></a>
### StreamNotification(int, ConfDatetime, ConfXMLParam[], String)

```java
public StreamNotification(
    int streamEventType,
    com.tailf.conf.ConfDatetime eventTime,
    com.tailf.conf.ConfXMLParam[] values,
    String error
)
```

Types: [ConfDatetime](../conf/ConfDatetime.md#cls-ConfDatetime), [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)

**Parameters**

- `int streamEventType`
- `com.tailf.conf.ConfDatetime eventTime`
- `com.tailf.conf.ConfXMLParam[] values`
- `String error`


## Fields

<a id="m-STREAM_NOTIFICATION_COMPLETE"></a>
### STREAM_NOTIFICATION_COMPLETE

```java
public static final int STREAM_NOTIFICATION_COMPLETE = 2;
```

<a id="m-STREAM_NOTIFICATION_EVENT"></a>
### STREAM_NOTIFICATION_EVENT

```java
public static final int STREAM_NOTIFICATION_EVENT = 1;
```

<a id="m-STREAM_REPLAY_COMPLETE"></a>
### STREAM_REPLAY_COMPLETE

```java
public static final int STREAM_REPLAY_COMPLETE = 3;
```

<a id="m-STREAM_REPLAY_FAILED"></a>
### STREAM_REPLAY_FAILED

```java
public static final int STREAM_REPLAY_FAILED = 4;
```


## Methods

<a id="m-eventtime-52f779266f34"></a>
### eventTime()

```java
public com.tailf.conf.ConfDatetime eventTime()
```

Types: [ConfDatetime](../conf/ConfDatetime.md#cls-ConfDatetime)

<a id="m-geterrorstring-3b4eba00496b"></a>
### getErrorString()

```java
public String getErrorString()
```

<a id="m-getstreameventtype-396b63149e8b"></a>
### getStreamEventType()

```java
public int getStreamEventType()
```

Stream event type.


- `#STREAM_NOTIFICATION_EVENT`
   - `#STREAM_NOTIFICATION_COMPLETE`
     - `#STREAM_REPLAY_COMPLETE`
       - `#STREAM_REPLAY_FAILED`

<a id="m-getvalues-06542a92d7fa"></a>
### getValues()

```java
public com.tailf.conf.ConfXMLParam[] getValues()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
