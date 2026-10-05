<a id="s-StreamNotification"></a>
# StreamNotification

```java
public class com.tailf.notif.StreamNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#s-Notification)

Data structure for Stream notifications.

## Members

**Constructors**:

- [StreamNotification(int, ConfDatetime, ConfXMLParam[], String)](#s-StreamNotification-1)

**Fields**:

- [STREAM_NOTIFICATION_COMPLETE](#s-STREAM_NOTIFICATION_COMPLETE)
- [STREAM_NOTIFICATION_EVENT](#s-STREAM_NOTIFICATION_EVENT)
- [STREAM_REPLAY_COMPLETE](#s-STREAM_REPLAY_COMPLETE)
- [STREAM_REPLAY_FAILED](#s-STREAM_REPLAY_FAILED)
- [type](Notification.md#s-type) from Notification

**Methods**:

- [eventTime()](#s-eventTime)
- [getErrorString()](#s-getErrorString)
- [getNotificationType()](Notification.md#s-getNotificationType) from Notification
- [getStreamEventType()](#s-getStreamEventType)
- [getValues()](#s-getValues)
- [toString()](#s-toString)

## Constructors

<a id="s-StreamNotification-1"></a>
### StreamNotification(int, ConfDatetime, ConfXMLParam[], String)

```java
public StreamNotification(
    int streamEventType,
    com.tailf.conf.ConfDatetime eventTime,
    com.tailf.conf.ConfXMLParam[] values,
    String error
)
```

Types: [ConfDatetime](../conf/ConfDatetime.md#s-ConfDatetime), [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam)

**Parameters**

- `int streamEventType`
- `com.tailf.conf.ConfDatetime eventTime`
- `com.tailf.conf.ConfXMLParam[] values`
- `String error`


## Fields

<a id="s-STREAM_NOTIFICATION_COMPLETE"></a>
### STREAM_NOTIFICATION_COMPLETE

```java
public static final int STREAM_NOTIFICATION_COMPLETE = 2;
```

<a id="s-STREAM_NOTIFICATION_EVENT"></a>
### STREAM_NOTIFICATION_EVENT

```java
public static final int STREAM_NOTIFICATION_EVENT = 1;
```

<a id="s-STREAM_REPLAY_COMPLETE"></a>
### STREAM_REPLAY_COMPLETE

```java
public static final int STREAM_REPLAY_COMPLETE = 3;
```

<a id="s-STREAM_REPLAY_FAILED"></a>
### STREAM_REPLAY_FAILED

```java
public static final int STREAM_REPLAY_FAILED = 4;
```


## Methods

<a id="s-eventTime"></a>
### eventTime()

```java
public com.tailf.conf.ConfDatetime eventTime()
```

Types: [ConfDatetime](../conf/ConfDatetime.md#s-ConfDatetime)

<a id="s-getErrorString"></a>
### getErrorString()

```java
public String getErrorString()
```

<a id="s-getStreamEventType"></a>
### getStreamEventType()

```java
public int getStreamEventType()
```

Stream event type.


- `#STREAM_NOTIFICATION_EVENT`
   - `#STREAM_NOTIFICATION_COMPLETE`
     - `#STREAM_REPLAY_COMPLETE`
       - `#STREAM_REPLAY_FAILED`

<a id="s-getValues"></a>
### getValues()

```java
public com.tailf.conf.ConfXMLParam[] getValues()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam)

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
