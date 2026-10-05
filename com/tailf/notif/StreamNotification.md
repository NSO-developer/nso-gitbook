# StreamNotification <a href="#cls-StreamNotification" id="cls-StreamNotification"></a>

```java
public class com.tailf.notif.StreamNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for Stream notifications.

## Members

**Constructors**:

- [StreamNotification(int, ConfDatetime, ConfXMLParam[], String)](#m-StreamNotification-bd5e6ecc4276)

**Fields**:

- [STREAM_NOTIFICATION_COMPLETE](#m-STREAM_NOTIFICATION_COMPLETE)
- [STREAM_NOTIFICATION_EVENT](#m-STREAM_NOTIFICATION_EVENT)
- [STREAM_REPLAY_COMPLETE](#m-STREAM_REPLAY_COMPLETE)
- [STREAM_REPLAY_FAILED](#m-STREAM_REPLAY_FAILED)
- [type](Notification.md#m-type) from Notification

**Methods**:

- [eventTime()](#m-eventTime-52f779266f34)
- [getErrorString()](#m-getErrorString-3b4eba00496b)
- [getNotificationType()](Notification.md#m-getNotificationType-f0e32b7b644f) from Notification
- [getStreamEventType()](#m-getStreamEventType-396b63149e8b)
- [getValues()](#m-getValues-06542a92d7fa)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### StreamNotification(int, ConfDatetime, ConfXMLParam[], String) <a href="#m-StreamNotification-bd5e6ecc4276" id="m-StreamNotification-bd5e6ecc4276"></a>

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

### STREAM_NOTIFICATION_COMPLETE <a href="#m-STREAM_NOTIFICATION_COMPLETE" id="m-STREAM_NOTIFICATION_COMPLETE"></a>

```java
public static final int STREAM_NOTIFICATION_COMPLETE = 2;
```

### STREAM_NOTIFICATION_EVENT <a href="#m-STREAM_NOTIFICATION_EVENT" id="m-STREAM_NOTIFICATION_EVENT"></a>

```java
public static final int STREAM_NOTIFICATION_EVENT = 1;
```

### STREAM_REPLAY_COMPLETE <a href="#m-STREAM_REPLAY_COMPLETE" id="m-STREAM_REPLAY_COMPLETE"></a>

```java
public static final int STREAM_REPLAY_COMPLETE = 3;
```

### STREAM_REPLAY_FAILED <a href="#m-STREAM_REPLAY_FAILED" id="m-STREAM_REPLAY_FAILED"></a>

```java
public static final int STREAM_REPLAY_FAILED = 4;
```


## Methods

### eventTime() <a href="#m-eventTime-52f779266f34" id="m-eventTime-52f779266f34"></a>

```java
public com.tailf.conf.ConfDatetime eventTime()
```

Types: [ConfDatetime](../conf/ConfDatetime.md#cls-ConfDatetime)

### getErrorString() <a href="#m-getErrorString-3b4eba00496b" id="m-getErrorString-3b4eba00496b"></a>

```java
public String getErrorString()
```

### getStreamEventType() <a href="#m-getStreamEventType-396b63149e8b" id="m-getStreamEventType-396b63149e8b"></a>

```java
public int getStreamEventType()
```

Stream event type.


- [`STREAM_NOTIFICATION_EVENT`](StreamNotification.md#m-STREAM_NOTIFICATION_EVENT)
   - [`STREAM_NOTIFICATION_COMPLETE`](StreamNotification.md#m-STREAM_NOTIFICATION_COMPLETE)
     - [`STREAM_REPLAY_COMPLETE`](StreamNotification.md#m-STREAM_REPLAY_COMPLETE)
       - [`STREAM_REPLAY_FAILED`](StreamNotification.md#m-STREAM_REPLAY_FAILED)

### getValues() <a href="#m-getValues-06542a92d7fa" id="m-getValues-06542a92d7fa"></a>

```java
public com.tailf.conf.ConfXMLParam[] getValues()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
