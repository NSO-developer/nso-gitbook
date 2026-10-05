# StreamNotification <a href="#streamnotification-80461d0dc6f6" id="streamnotification-80461d0dc6f6"></a>

```java
public class com.tailf.notif.StreamNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#notification-b2e7d82d4215)

Data structure for Stream notifications.

## Members

**Constructors**:

- [StreamNotification\(int, ConfDatetime, ConfXMLParam\[\], String\)](#streamnotification-bd5e6ecc4276)

**Fields**:

- [STREAM\_NOTIFICATION\_COMPLETE](#stream_notification_complete-4d6aaf0cda01)
- [STREAM\_NOTIFICATION\_EVENT](#stream_notification_event-3c8329ec2bbc)
- [STREAM\_REPLAY\_COMPLETE](#stream_replay_complete-9b615ef73b1a)
- [STREAM\_REPLAY\_FAILED](#stream_replay_failed-576b43512df8)
- [type](Notification.md#type-6ebb3673fbb6) from Notification

**Methods**:

- [eventTime\(\)](#eventtime-52f779266f34)
- [getErrorString\(\)](#geterrorstring-3b4eba00496b)
- [getNotificationType\(\)](Notification.md#getnotificationtype-f0e32b7b644f) from Notification
- [getStreamEventType\(\)](#getstreameventtype-396b63149e8b)
- [getValues\(\)](#getvalues-06542a92d7fa)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### StreamNotification(int, ConfDatetime, ConfXMLParam[], String) <a href="#streamnotification-bd5e6ecc4276" id="streamnotification-bd5e6ecc4276"></a>

```java
public StreamNotification(
    int streamEventType,
    com.tailf.conf.ConfDatetime eventTime,
    com.tailf.conf.ConfXMLParam[] values,
    String error
)
```

Types: [ConfDatetime](../conf/ConfDatetime.md#confdatetime-8f67d7ff6ae8), [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)

**Parameters**

- `int streamEventType`
- `com.tailf.conf.ConfDatetime eventTime`
- `com.tailf.conf.ConfXMLParam[] values`
- `String error`


## Fields

### STREAM_NOTIFICATION_COMPLETE <a href="#stream_notification_complete-4d6aaf0cda01" id="stream_notification_complete-4d6aaf0cda01"></a>

```java
public static final int STREAM_NOTIFICATION_COMPLETE = 2;
```

### STREAM_NOTIFICATION_EVENT <a href="#stream_notification_event-3c8329ec2bbc" id="stream_notification_event-3c8329ec2bbc"></a>

```java
public static final int STREAM_NOTIFICATION_EVENT = 1;
```

### STREAM_REPLAY_COMPLETE <a href="#stream_replay_complete-9b615ef73b1a" id="stream_replay_complete-9b615ef73b1a"></a>

```java
public static final int STREAM_REPLAY_COMPLETE = 3;
```

### STREAM_REPLAY_FAILED <a href="#stream_replay_failed-576b43512df8" id="stream_replay_failed-576b43512df8"></a>

```java
public static final int STREAM_REPLAY_FAILED = 4;
```


## Methods

### eventTime() <a href="#eventtime-52f779266f34" id="eventtime-52f779266f34"></a>

```java
public com.tailf.conf.ConfDatetime eventTime()
```

Types: [ConfDatetime](../conf/ConfDatetime.md#confdatetime-8f67d7ff6ae8)

### getErrorString() <a href="#geterrorstring-3b4eba00496b" id="geterrorstring-3b4eba00496b"></a>

```java
public String getErrorString()
```

### getStreamEventType() <a href="#getstreameventtype-396b63149e8b" id="getstreameventtype-396b63149e8b"></a>

```java
public int getStreamEventType()
```

Stream event type.


- [`STREAM_NOTIFICATION_EVENT`](StreamNotification.md#stream_notification_event-3c8329ec2bbc)
   - [`STREAM_NOTIFICATION_COMPLETE`](StreamNotification.md#stream_notification_complete-4d6aaf0cda01)
     - [`STREAM_REPLAY_COMPLETE`](StreamNotification.md#stream_replay_complete-9b615ef73b1a)
       - [`STREAM_REPLAY_FAILED`](StreamNotification.md#stream_replay_failed-576b43512df8)

### getValues() <a href="#getvalues-06542a92d7fa" id="getvalues-06542a92d7fa"></a>

```java
public com.tailf.conf.ConfXMLParam[] getValues()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
