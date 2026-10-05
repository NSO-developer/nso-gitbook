<a id="cls-NotificationCfg"></a>
# NotificationCfg

```java
public class com.tailf.notif.NotificationCfg
```

## Members

**Constructors**:

- [NotificationCfg()](#m-notificationcfg-095bdbf9c2db)
- [NotificationCfg(int, int)](#m-notificationcfg-3db7173f4b4d)
- [NotificationCfg(int, int, String, ConfValue, ConfValue, String, int, Verbosity)](#m-notificationcfg-d4b7e7a43fb5)
- [NotificationCfg(Verbosity)](#m-notificationcfg-c0258cf12ca3)

**Methods**:

- [getHealthCheckInterval()](#m-gethealthcheckinterval-a48eba3bd905)
- [getHeartbeatInterval()](#m-getheartbeatinterval-e473fe40fa59)
- [getStartTime()](#m-getstarttime-f237c63a0230)
- [getStopTime()](#m-getstoptime-2b002db8cc27)
- [getStreamName()](#m-getstreamname-7146bcdbf461)
- [getUsid()](#m-getusid-62d0ecfd68fd)
- [getVerbosity()](#m-getverbosity-6b0b3a4f5e03)
- [getXPathFilter()](#m-getxpathfilter-3bccf218e10c)
- [setHealthCheckInterval(int)](#m-sethealthcheckinterval-75bd7406cd93)
- [setHeartbeatInterval(int)](#m-setheartbeatinterval-7c6e8a4c4223)
- [setStartTime(ConfValue)](#m-setstarttime-65fd39b07ed3)
- [setStopTime(ConfValue)](#m-setstoptime-01a03233a195)
- [setStreamName(String)](#m-setstreamname-366567b41990)
- [setUsid(int)](#m-setusid-f5dcd6d3ac5f)
- [setVerbosity(Verbosity)](#m-setverbosity-72632efb4fb1)
- [setXPathFilter(String)](#m-setxpathfilter-c4e977f0220c)

## Constructors

<a id="m-notificationcfg-095bdbf9c2db"></a>
### NotificationCfg()

```java
public NotificationCfg()
```

Default constructor, all values has to be set using
 the setter methods.

<a id="m-notificationcfg-3db7173f4b4d"></a>
### NotificationCfg(int, int)

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

<a id="m-notificationcfg-d4b7e7a43fb5"></a>
### NotificationCfg(int, int, String, ConfValue, ConfValue, String, int, Verbosity)

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

<a id="m-notificationcfg-c0258cf12ca3"></a>
### NotificationCfg(Verbosity)

```java
public NotificationCfg(com.tailf.maapi.Maapi.Verbosity verbosity)
```

Types: [Verbosity](../maapi/Maapi/Verbosity.md#cls-Verbosity)

Creates a NotificationCfg instance with only the verbosity.

**Parameters**

- `com.tailf.maapi.Maapi.Verbosity verbosity` - default Maapi.Verbosity.NORMAL


## Methods

<a id="m-gethealthcheckinterval-a48eba3bd905"></a>
### getHealthCheckInterval()

```java
public int getHealthCheckInterval()
```

Get configured Healtcheck interval
 used by [`NotificationType#NOTIF_HEALTH_CHECK`](NotificationType.md#m-NOTIF_HEALTH_CHECK)
 notifications.

 Time is in milliseconds.

**Returns:** healthCheckInterval

<a id="m-getheartbeatinterval-e473fe40fa59"></a>
### getHeartbeatInterval()

```java
public int getHeartbeatInterval()
```

Get configured Heartbeat interval
 used by [`NotificationType#NOTIF_HEARTBEAT`](NotificationType.md#m-NOTIF_HEARTBEAT)
 notifications.

 Time is in milliseconds.

**Returns:** heartbeatInterval

<a id="m-getstarttime-f237c63a0230"></a>
### getStartTime()

```java
public com.tailf.conf.ConfValue getStartTime()
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue)

Get configured startTime
 used by [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#m-NOTIF_STREAM_EVENT)
 notifications to define a replay start time.

 The value is either ConfDatetime or ConfNoExists.

**Returns:** startTime

<a id="m-getstoptime-2b002db8cc27"></a>
### getStopTime()

```java
public com.tailf.conf.ConfValue getStopTime()
```

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue)

Get configured stopTime
 used by [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#m-NOTIF_STREAM_EVENT)
 notifications to define a replay stop time.

 The value is either ConfDatetime or ConfNoExists.

**Returns:** stopTime

<a id="m-getstreamname-7146bcdbf461"></a>
### getStreamName()

```java
public String getStreamName()
```

Get configured stream name
 used by [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#m-NOTIF_STREAM_EVENT)
 notifications.

**Returns:** streamName

<a id="m-getusid-62d0ecfd68fd"></a>
### getUsid()

```java
public int getUsid()
```

Get configured User session id
 used by [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#m-NOTIF_STREAM_EVENT)
 notifications.

**Returns:** usid

<a id="m-getverbosity-6b0b3a4f5e03"></a>
### getVerbosity()

```java
public com.tailf.maapi.Maapi.Verbosity getVerbosity()
```

Types: [Verbosity](../maapi/Maapi/Verbosity.md#cls-Verbosity)

Get the configured verbosity
 used by [`NotificationType#NOTIF_PROGRESS`](NotificationType.md#m-NOTIF_PROGRESS) and
 [`NotificationType#NOTIF_COMMIT_PROGRESS`](NotificationType.md#m-NOTIF_COMMIT_PROGRESS) notifications.

**Returns:** verbosity

<a id="m-getxpathfilter-3bccf218e10c"></a>
### getXPathFilter()

```java
public String getXPathFilter()
```

Get configured XPathFilter
 used by [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#m-NOTIF_STREAM_EVENT)
 notifications.

**Returns:** XPathFilter

<a id="m-sethealthcheckinterval-75bd7406cd93"></a>
### setHealthCheckInterval(int)

```java
public void setHealthCheckInterval(int healthCheckInterval)
```

Required if we wish to generate
 [`NotificationType#NOTIF_HEALTH_CHECK`](NotificationType.md#m-NOTIF_HEALTH_CHECK) events.
 The time is milli seconds.

**Parameters**

- `int healthCheckInterval`

<a id="m-setheartbeatinterval-7c6e8a4c4223"></a>
### setHeartbeatInterval(int)

```java
public void setHeartbeatInterval(int heartbeatInterval)
```

Required if we wish to generate
 [`NotificationType#NOTIF_HEARTBEAT`](NotificationType.md#m-NOTIF_HEARTBEAT) events.
 The time is milli seconds.

**Parameters**

- `int heartbeatInterval`

<a id="m-setstarttime-65fd39b07ed3"></a>
### setStartTime(ConfValue)

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

<a id="m-setstoptime-01a03233a195"></a>
### setStopTime(ConfValue)

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

<a id="m-setstreamname-366567b41990"></a>
### setStreamName(String)

```java
public void setStreamName(String streamName)
```

Required for [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#m-NOTIF_STREAM_EVENT).
 The stream name of the Notification Stream (required).

**Parameters**

- `String streamName`

<a id="m-setusid-f5dcd6d3ac5f"></a>
### setUsid(int)

```java
public void setUsid(int usid)
```

Optional for [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#m-NOTIF_STREAM_EVENT).
 User session id for AAA restriction.
 Set to 0 for no AAA.

**Parameters**

- `int usid`

<a id="m-setverbosity-72632efb4fb1"></a>
### setVerbosity(Verbosity)

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

<a id="m-setxpathfilter-c4e977f0220c"></a>
### setXPathFilter(String)

```java
public void setXPathFilter(String xpathFilter)
```

Optional for [`NotificationType#NOTIF_STREAM_EVENT`](NotificationType.md#m-NOTIF_STREAM_EVENT).
 XPath filter for the stream.
 NULL for no filter.

**Parameters**

- `String xpathFilter`
