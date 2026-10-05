# NotificationCfg <a href="#cls-NotificationCfg" id="cls-NotificationCfg"></a>

```java
public class com.tailf.notif.NotificationCfg
```

## Members

**Constructors**:

- [NotificationCfg()](#m-NotificationCfg-095bdbf9c2db)
- [NotificationCfg(int, int)](#m-NotificationCfg-3db7173f4b4d)
- [NotificationCfg(int, int, String, ConfValue, ConfValue, String, int, Verbosity)](#m-NotificationCfg-d4b7e7a43fb5)
- [NotificationCfg(Verbosity)](#m-NotificationCfg-c0258cf12ca3)

**Methods**:

- [getHealthCheckInterval()](#m-getHealthCheckInterval-a48eba3bd905)
- [getHeartbeatInterval()](#m-getHeartbeatInterval-e473fe40fa59)
- [getStartTime()](#m-getStartTime-f237c63a0230)
- [getStopTime()](#m-getStopTime-2b002db8cc27)
- [getStreamName()](#m-getStreamName-7146bcdbf461)
- [getUsid()](#m-getUsid-62d0ecfd68fd)
- [getVerbosity()](#m-getVerbosity-6b0b3a4f5e03)
- [getXPathFilter()](#m-getXPathFilter-3bccf218e10c)
- [setHealthCheckInterval(int)](#m-setHealthCheckInterval-75bd7406cd93)
- [setHeartbeatInterval(int)](#m-setHeartbeatInterval-7c6e8a4c4223)
- [setStartTime(ConfValue)](#m-setStartTime-65fd39b07ed3)
- [setStopTime(ConfValue)](#m-setStopTime-01a03233a195)
- [setStreamName(String)](#m-setStreamName-366567b41990)
- [setUsid(int)](#m-setUsid-f5dcd6d3ac5f)
- [setVerbosity(Verbosity)](#m-setVerbosity-72632efb4fb1)
- [setXPathFilter(String)](#m-setXPathFilter-c4e977f0220c)

## Constructors

### NotificationCfg() <a href="#m-NotificationCfg-095bdbf9c2db" id="m-NotificationCfg-095bdbf9c2db"></a>

```java
public NotificationCfg()
```

Default constructor, all values has to be set using
 the setter methods.

### NotificationCfg(int, int) <a href="#m-NotificationCfg-3db7173f4b4d" id="m-NotificationCfg-3db7173f4b4d"></a>

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

### NotificationCfg(int, int, String, ConfValue, ConfValue, String, int, Verbosity) <a href="#m-NotificationCfg-d4b7e7a43fb5" id="m-NotificationCfg-d4b7e7a43fb5"></a>

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

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [Verbosity](../maapi/Maapi/Verbosity.md#cls-Verbosity)

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

### NotificationCfg(Verbosity) <a href="#m-NotificationCfg-c0258cf12ca3" id="m-NotificationCfg-c0258cf12ca3"></a>

```java
public NotificationCfg(com.tailf.maapi.Maapi.Verbosity verbosity)
```

Types: [Verbosity](../maapi/Maapi/Verbosity.md#cls-Verbosity)

Creates a NotificationCfg instance with only the verbosity.

**Parameters**

- `com.tailf.maapi.Maapi.Verbosity verbosity` - default Maapi.Verbosity.NORMAL


## Methods

### getHealthCheckInterval() <a href="#m-getHealthCheckInterval-a48eba3bd905" id="m-getHealthCheckInterval-a48eba3bd905"></a>

```java
public int getHealthCheckInterval()
```

Get configured Healtcheck interval
 used by [`NotificationType#NOTIF_HEALTH_CHECK`](NotificationType.md#m-NOTIF_HEALTH_CHECK)
 notifications.

 Time is in milliseconds.

**Returns:** healthCheckInterval

### getHeartbeatInterval() <a href="#m-getHeartbeatInterval-e473fe40fa59" id="m-getHeartbeatInterval-e473fe40fa59"></a>

```java
public int getHeartbeatInterval()
```

Get configured Heartbeat interval
 used by [`NotificationType#NOTIF_HEARTBEAT`](NotificationType.md#m-NOTIF_HEARTBEAT)
 notifications.

 Time is in milliseconds.

**Returns:** heartbeatInterval

### getStartTime() <a href="#m-getStartTime-f237c63a0230" id="m-getStartTime-f237c63a0230"></a>

```java
public com.tailf.conf.ConfValue getStartTime()
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue)

Get configured startTime
 used by [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#m-NOTIF_STREAM_EVENT)
 notifications to define a replay start time.

 The value is either ConfDatetime or ConfNoExists.

**Returns:** startTime

### getStopTime() <a href="#m-getStopTime-2b002db8cc27" id="m-getStopTime-2b002db8cc27"></a>

```java
public com.tailf.conf.ConfValue getStopTime()
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue)

Get configured stopTime
 used by [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#m-NOTIF_STREAM_EVENT)
 notifications to define a replay stop time.

 The value is either ConfDatetime or ConfNoExists.

**Returns:** stopTime

### getStreamName() <a href="#m-getStreamName-7146bcdbf461" id="m-getStreamName-7146bcdbf461"></a>

```java
public String getStreamName()
```

Get configured stream name
 used by [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#m-NOTIF_STREAM_EVENT)
 notifications.

**Returns:** streamName

### getUsid() <a href="#m-getUsid-62d0ecfd68fd" id="m-getUsid-62d0ecfd68fd"></a>

```java
public int getUsid()
```

Get configured User session id
 used by [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#m-NOTIF_STREAM_EVENT)
 notifications.

**Returns:** usid

### getVerbosity() <a href="#m-getVerbosity-6b0b3a4f5e03" id="m-getVerbosity-6b0b3a4f5e03"></a>

```java
public com.tailf.maapi.Maapi.Verbosity getVerbosity()
```

Types: [Verbosity](../maapi/Maapi/Verbosity.md#cls-Verbosity)

Get the configured verbosity
 used by [`NotificationType#NOTIF_PROGRESS`](NotificationType.md#m-NOTIF_PROGRESS) and
 [`NotificationType#NOTIF_COMMIT_PROGRESS`](NotificationType.md#m-NOTIF_COMMIT_PROGRESS) notifications.

**Returns:** verbosity

### getXPathFilter() <a href="#m-getXPathFilter-3bccf218e10c" id="m-getXPathFilter-3bccf218e10c"></a>

```java
public String getXPathFilter()
```

Get configured XPathFilter
 used by [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#m-NOTIF_STREAM_EVENT)
 notifications.

**Returns:** XPathFilter

### setHealthCheckInterval(int) <a href="#m-setHealthCheckInterval-75bd7406cd93" id="m-setHealthCheckInterval-75bd7406cd93"></a>

```java
public void setHealthCheckInterval(int healthCheckInterval)
```

Required if we wish to generate
 [`NotificationType#NOTIF_HEALTH_CHECK`](NotificationType.md#m-NOTIF_HEALTH_CHECK) events.
 The time is milli seconds.

**Parameters**

- `int healthCheckInterval`

### setHeartbeatInterval(int) <a href="#m-setHeartbeatInterval-7c6e8a4c4223" id="m-setHeartbeatInterval-7c6e8a4c4223"></a>

```java
public void setHeartbeatInterval(int heartbeatInterval)
```

Required if we wish to generate
 [`NotificationType#NOTIF_HEARTBEAT`](NotificationType.md#m-NOTIF_HEARTBEAT) events.
 The time is milli seconds.

**Parameters**

- `int heartbeatInterval`

### setStartTime(ConfValue) <a href="#m-setStartTime-65fd39b07ed3" id="m-setStartTime-65fd39b07ed3"></a>

```java
public void setStartTime(com.tailf.conf.ConfValue startTime)
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue)

Optional for [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#m-NOTIF_STREAM_EVENT).
 Set to request a replay.
 If no value is indicated by ConfNoExists which is the default.

 Allowed values are of type ConfNoExists or ConfDatetime.

**Parameters**

- `com.tailf.conf.ConfValue startTime`

### setStopTime(ConfValue) <a href="#m-setStopTime-01a03233a195" id="m-setStopTime-01a03233a195"></a>

```java
public void setStopTime(com.tailf.conf.ConfValue stopTime)
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue)

Optional for [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#m-NOTIF_STREAM_EVENT).
 If startTime is set stopTime can also be set to
 indicated the end of a replay.
 If no value is indicated by ConfNoExists which is the default.

 Allowed values are of type ConfNoExists or ConfDatetime.

**Parameters**

- `com.tailf.conf.ConfValue stopTime`

### setStreamName(String) <a href="#m-setStreamName-366567b41990" id="m-setStreamName-366567b41990"></a>

```java
public void setStreamName(String streamName)
```

Required for [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#m-NOTIF_STREAM_EVENT).
 The stream name of the Notification Stream (required).

**Parameters**

- `String streamName`

### setUsid(int) <a href="#m-setUsid-f5dcd6d3ac5f" id="m-setUsid-f5dcd6d3ac5f"></a>

```java
public void setUsid(int usid)
```

Optional for [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#m-NOTIF_STREAM_EVENT).
 User session id for AAA restriction.
 Set to 0 for no AAA.

**Parameters**

- `int usid`

### setVerbosity(Verbosity) <a href="#m-setVerbosity-72632efb4fb1" id="m-setVerbosity-72632efb4fb1"></a>

```java
public void setVerbosity(com.tailf.maapi.Maapi.Verbosity verbosity)
```

Types: [Verbosity](../maapi/Maapi/Verbosity.md#cls-Verbosity)

Optional for [`NotificationType#NOTIF_PROGRESS`](NotificationType.md#m-NOTIF_PROGRESS) and
 [`NotificationType#NOTIF_COMMIT_PROGRESS`](NotificationType.md#m-NOTIF_COMMIT_PROGRESS).
 Sets the output verbosity.
 Defaults to Maapi.Verbosity.NORMAL.

**Parameters**

- `com.tailf.maapi.Maapi.Verbosity verbosity`

### setXPathFilter(String) <a href="#m-setXPathFilter-c4e977f0220c" id="m-setXPathFilter-c4e977f0220c"></a>

```java
public void setXPathFilter(String xpathFilter)
```

Optional for [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#m-NOTIF_STREAM_EVENT).
 XPath filter for the stream.
 NULL for no filter.

**Parameters**

- `String xpathFilter`
