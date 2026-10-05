# NotificationCfg <a href="#notificationcfg-9d212d006400" id="notificationcfg-9d212d006400"></a>

```java
public class com.tailf.notif.NotificationCfg
```

## Members

**Constructors**:

- [NotificationCfg\(\)](#notificationcfg-095bdbf9c2db)
- [NotificationCfg\(int, int\)](#notificationcfg-3db7173f4b4d)
- [NotificationCfg\(int, int, String, ConfValue, ConfValue, String, int, Verbosity\)](#notificationcfg-d4b7e7a43fb5)
- [NotificationCfg\(Verbosity\)](#notificationcfg-c0258cf12ca3)

**Methods**:

- [getHealthCheckInterval\(\)](#gethealthcheckinterval-a48eba3bd905)
- [getHeartbeatInterval\(\)](#getheartbeatinterval-e473fe40fa59)
- [getStartTime\(\)](#getstarttime-f237c63a0230)
- [getStopTime\(\)](#getstoptime-2b002db8cc27)
- [getStreamName\(\)](#getstreamname-7146bcdbf461)
- [getUsid\(\)](#getusid-62d0ecfd68fd)
- [getVerbosity\(\)](#getverbosity-6b0b3a4f5e03)
- [getXPathFilter\(\)](#getxpathfilter-3bccf218e10c)
- [setHealthCheckInterval\(int\)](#sethealthcheckinterval-75bd7406cd93)
- [setHeartbeatInterval\(int\)](#setheartbeatinterval-7c6e8a4c4223)
- [setStartTime\(ConfValue\)](#setstarttime-65fd39b07ed3)
- [setStopTime\(ConfValue\)](#setstoptime-01a03233a195)
- [setStreamName\(String\)](#setstreamname-366567b41990)
- [setUsid\(int\)](#setusid-f5dcd6d3ac5f)
- [setVerbosity\(Verbosity\)](#setverbosity-72632efb4fb1)
- [setXPathFilter\(String\)](#setxpathfilter-c4e977f0220c)

## Constructors

### NotificationCfg() <a href="#notificationcfg-095bdbf9c2db" id="notificationcfg-095bdbf9c2db"></a>

```java
public NotificationCfg()
```

Default constructor, all values has to be set using
 the setter methods.

### NotificationCfg(int, int) <a href="#notificationcfg-3db7173f4b4d" id="notificationcfg-3db7173f4b4d"></a>

```java
public NotificationCfg(int heartbeatInterval, int healthCheckInterval)
```

Creates a NotificationCfg instance with only the
 heartbeatInterval and healthCheckInterval. This
 constructor exist for the internal use of the
 `Notif#Notif(java.net.Socket, java.util.EnumSet, int, int)`
 constructor

**Parameters**

- `int heartbeatInterval`
- `int healthCheckInterval`

### NotificationCfg(int, int, String, ConfValue, ConfValue, String, int, Verbosity) <a href="#notificationcfg-d4b7e7a43fb5" id="notificationcfg-d4b7e7a43fb5"></a>

```java
public NotificationCfg(
    int heartbeatInterval,
    int healthCheckInterval,
    String streamName,
    com.tailf.conf.ConfValue startTime,
    com.tailf.conf.ConfValue stopTime,
    String xpathFilter,
    int usid,
    com.tailf.maapi.Maapi.Verbosity verbosity
)
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [Verbosity](../maapi/Maapi/Verbosity.md#verbosity-a9c618ec424f)

Convenience constructor setting all values.
 Unused values should be set to their defaults.

**Parameters**

- `int heartbeatInterval` - default 0
- `int healthCheckInterval` - default 0
- `String streamName` - default null
- `com.tailf.conf.ConfValue startTime` - default ConfNoExists
- `com.tailf.conf.ConfValue stopTime` - default ConfNoExists
- `String xpathFilter` - default null
- `int usid` - default 0
- `com.tailf.maapi.Maapi.Verbosity verbosity` - default Maapi.Verbosity.NORMAL

### NotificationCfg(Verbosity) <a href="#notificationcfg-c0258cf12ca3" id="notificationcfg-c0258cf12ca3"></a>

```java
public NotificationCfg(com.tailf.maapi.Maapi.Verbosity verbosity)
```

Types: [Verbosity](../maapi/Maapi/Verbosity.md#verbosity-a9c618ec424f)

Creates a NotificationCfg instance with only the verbosity.

**Parameters**

- `com.tailf.maapi.Maapi.Verbosity verbosity` - default Maapi.Verbosity.NORMAL


## Methods

### getHealthCheckInterval() <a href="#gethealthcheckinterval-a48eba3bd905" id="gethealthcheckinterval-a48eba3bd905"></a>

```java
public int getHealthCheckInterval()
```

Get configured Healtcheck interval
 used by [`NotificationType#NOTIF_HEALTH_CHECK`](NotificationType.md#notif_health_check-16b040e322ff)
 notifications.

 Time is in milliseconds.

**Returns:** healthCheckInterval

### getHeartbeatInterval() <a href="#getheartbeatinterval-e473fe40fa59" id="getheartbeatinterval-e473fe40fa59"></a>

```java
public int getHeartbeatInterval()
```

Get configured Heartbeat interval
 used by [`NotificationType#NOTIF_HEARTBEAT`](NotificationType.md#notif_heartbeat-a901d424d5e9)
 notifications.

 Time is in milliseconds.

**Returns:** heartbeatInterval

### getStartTime() <a href="#getstarttime-f237c63a0230" id="getstarttime-f237c63a0230"></a>

```java
public com.tailf.conf.ConfValue getStartTime()
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d)

Get configured startTime
 used by [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#notif_stream_event-32431368050e)
 notifications to define a replay start time.

 The value is either ConfDatetime or ConfNoExists.

**Returns:** startTime

### getStopTime() <a href="#getstoptime-2b002db8cc27" id="getstoptime-2b002db8cc27"></a>

```java
public com.tailf.conf.ConfValue getStopTime()
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d)

Get configured stopTime
 used by [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#notif_stream_event-32431368050e)
 notifications to define a replay stop time.

 The value is either ConfDatetime or ConfNoExists.

**Returns:** stopTime

### getStreamName() <a href="#getstreamname-7146bcdbf461" id="getstreamname-7146bcdbf461"></a>

```java
public String getStreamName()
```

Get configured stream name
 used by [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#notif_stream_event-32431368050e)
 notifications.

**Returns:** streamName

### getUsid() <a href="#getusid-62d0ecfd68fd" id="getusid-62d0ecfd68fd"></a>

```java
public int getUsid()
```

Get configured User session id
 used by [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#notif_stream_event-32431368050e)
 notifications.

**Returns:** usid

### getVerbosity() <a href="#getverbosity-6b0b3a4f5e03" id="getverbosity-6b0b3a4f5e03"></a>

```java
public com.tailf.maapi.Maapi.Verbosity getVerbosity()
```

Types: [Verbosity](../maapi/Maapi/Verbosity.md#verbosity-a9c618ec424f)

Get the configured verbosity
 used by [`NotificationType#NOTIF_PROGRESS`](NotificationType.md#notif_progress-824025559a0d) and
 [`NotificationType#NOTIF_COMMIT_PROGRESS`](NotificationType.md#notif_commit_progress-333a6e755b44) notifications.

**Returns:** verbosity

### getXPathFilter() <a href="#getxpathfilter-3bccf218e10c" id="getxpathfilter-3bccf218e10c"></a>

```java
public String getXPathFilter()
```

Get configured XPathFilter
 used by [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#notif_stream_event-32431368050e)
 notifications.

**Returns:** XPathFilter

### setHealthCheckInterval(int) <a href="#sethealthcheckinterval-75bd7406cd93" id="sethealthcheckinterval-75bd7406cd93"></a>

```java
public void setHealthCheckInterval(int healthCheckInterval)
```

Required if we wish to generate
 [`NotificationType#NOTIF_HEALTH_CHECK`](NotificationType.md#notif_health_check-16b040e322ff) events.
 The time is milli seconds.

**Parameters**

- `int healthCheckInterval`

### setHeartbeatInterval(int) <a href="#setheartbeatinterval-7c6e8a4c4223" id="setheartbeatinterval-7c6e8a4c4223"></a>

```java
public void setHeartbeatInterval(int heartbeatInterval)
```

Required if we wish to generate
 [`NotificationType#NOTIF_HEARTBEAT`](NotificationType.md#notif_heartbeat-a901d424d5e9) events.
 The time is milli seconds.

**Parameters**

- `int heartbeatInterval`

### setStartTime(ConfValue) <a href="#setstarttime-65fd39b07ed3" id="setstarttime-65fd39b07ed3"></a>

```java
public void setStartTime(com.tailf.conf.ConfValue startTime)
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d)

Optional for [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#notif_stream_event-32431368050e).
 Set to request a replay.
 If no value is indicated by ConfNoExists which is the default.

 Allowed values are of type ConfNoExists or ConfDatetime.

**Parameters**

- `com.tailf.conf.ConfValue startTime`

### setStopTime(ConfValue) <a href="#setstoptime-01a03233a195" id="setstoptime-01a03233a195"></a>

```java
public void setStopTime(com.tailf.conf.ConfValue stopTime)
```

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d)

Optional for [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#notif_stream_event-32431368050e).
 If startTime is set stopTime can also be set to
 indicated the end of a replay.
 If no value is indicated by ConfNoExists which is the default.

 Allowed values are of type ConfNoExists or ConfDatetime.

**Parameters**

- `com.tailf.conf.ConfValue stopTime`

### setStreamName(String) <a href="#setstreamname-366567b41990" id="setstreamname-366567b41990"></a>

```java
public void setStreamName(String streamName)
```

Required for [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#notif_stream_event-32431368050e).
 The stream name of the Notification Stream (required).

**Parameters**

- `String streamName`

### setUsid(int) <a href="#setusid-f5dcd6d3ac5f" id="setusid-f5dcd6d3ac5f"></a>

```java
public void setUsid(int usid)
```

Optional for [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#notif_stream_event-32431368050e).
 User session id for AAA restriction.
 Set to 0 for no AAA.

**Parameters**

- `int usid`

### setVerbosity(Verbosity) <a href="#setverbosity-72632efb4fb1" id="setverbosity-72632efb4fb1"></a>

```java
public void setVerbosity(com.tailf.maapi.Maapi.Verbosity verbosity)
```

Types: [Verbosity](../maapi/Maapi/Verbosity.md#verbosity-a9c618ec424f)

Optional for [`NotificationType#NOTIF_PROGRESS`](NotificationType.md#notif_progress-824025559a0d) and
 [`NotificationType#NOTIF_COMMIT_PROGRESS`](NotificationType.md#notif_commit_progress-333a6e755b44).
 Sets the output verbosity.
 Defaults to Maapi.Verbosity.NORMAL.

**Parameters**

- `com.tailf.maapi.Maapi.Verbosity verbosity`

### setXPathFilter(String) <a href="#setxpathfilter-c4e977f0220c" id="setxpathfilter-c4e977f0220c"></a>

```java
public void setXPathFilter(String xpathFilter)
```

Optional for [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#notif_stream_event-32431368050e).
 XPath filter for the stream.
 NULL for no filter.

**Parameters**

- `String xpathFilter`
