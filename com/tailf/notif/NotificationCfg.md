<a id="s-NotificationCfg"></a>
# NotificationCfg

```java
public class com.tailf.notif.NotificationCfg
```

## Members

**Constructors**:

- [NotificationCfg()](#s-NotificationCfg-1)
- [NotificationCfg(int, int)](#s-NotificationCfg-2)
- [NotificationCfg(int, int, String, ConfValue, ConfValue, String, int, Verbosity)](#s-NotificationCfg-3)
- [NotificationCfg(Verbosity)](#s-NotificationCfg-4)

**Methods**:

- [getHealthCheckInterval()](#s-getHealthCheckInterval)
- [getHeartbeatInterval()](#s-getHeartbeatInterval)
- [getStartTime()](#s-getStartTime)
- [getStopTime()](#s-getStopTime)
- [getStreamName()](#s-getStreamName)
- [getUsid()](#s-getUsid)
- [getVerbosity()](#s-getVerbosity)
- [getXPathFilter()](#s-getXPathFilter)
- [setHealthCheckInterval(int)](#s-setHealthCheckInterval)
- [setHeartbeatInterval(int)](#s-setHeartbeatInterval)
- [setStartTime(ConfValue)](#s-setStartTime)
- [setStopTime(ConfValue)](#s-setStopTime)
- [setStreamName(String)](#s-setStreamName)
- [setUsid(int)](#s-setUsid)
- [setVerbosity(Verbosity)](#s-setVerbosity)
- [setXPathFilter(String)](#s-setXPathFilter)

## Constructors

<a id="s-NotificationCfg-1"></a>
### NotificationCfg()

```java
public NotificationCfg()
```

Default constructor, all values has to be set using
 the setter methods.

<a id="s-NotificationCfg-2"></a>
### NotificationCfg(int, int)

```java
public NotificationCfg(int heartbeatInterval, int healthCheckInterval)
```

Creates a NotificationCfg instance with only the
 heartbeatInterval and healthCheckInterval. This
 constructor exist for the internal use of the
 [`Notif`](Notif.md#s-Notif)
 constructor

**Parameters**

- `int heartbeatInterval`
- `int healthCheckInterval`

<a id="s-NotificationCfg-3"></a>
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

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [Verbosity](../maapi/Maapi/Verbosity.md#s-Verbosity)

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

<a id="s-NotificationCfg-4"></a>
### NotificationCfg(Verbosity)

```java
public NotificationCfg(com.tailf.maapi.Maapi.Verbosity verbosity)
```

Types: [Verbosity](../maapi/Maapi/Verbosity.md#s-Verbosity)

Creates a NotificationCfg instance with only the verbosity.

**Parameters**

- `com.tailf.maapi.Maapi.Verbosity verbosity` - default Maapi.Verbosity.NORMAL


## Methods

<a id="s-getHealthCheckInterval"></a>
### getHealthCheckInterval()

```java
public int getHealthCheckInterval()
```

Get configured Healtcheck interval
 used by [`NotificationType`](NotificationType.md#s-NotificationType)
 notifications.

 Time is in milliseconds.

**Returns:** healthCheckInterval

<a id="s-getHeartbeatInterval"></a>
### getHeartbeatInterval()

```java
public int getHeartbeatInterval()
```

Get configured Heartbeat interval
 used by [`NotificationType`](NotificationType.md#s-NotificationType)
 notifications.

 Time is in milliseconds.

**Returns:** heartbeatInterval

<a id="s-getStartTime"></a>
### getStartTime()

```java
public com.tailf.conf.ConfValue getStartTime()
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue)

Get configured startTime
 used by [`NotificationType`](NotificationType.md#s-NotificationType)
 notifications to define a replay start time.

 The value is either ConfDatetime or ConfNoExists.

**Returns:** startTime

<a id="s-getStopTime"></a>
### getStopTime()

```java
public com.tailf.conf.ConfValue getStopTime()
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue)

Get configured stopTime
 used by [`NotificationType`](NotificationType.md#s-NotificationType)
 notifications to define a replay stop time.

 The value is either ConfDatetime or ConfNoExists.

**Returns:** stopTime

<a id="s-getStreamName"></a>
### getStreamName()

```java
public String getStreamName()
```

Get configured stream name
 used by [`NotificationType`](NotificationType.md#s-NotificationType)
 notifications.

**Returns:** streamName

<a id="s-getUsid"></a>
### getUsid()

```java
public int getUsid()
```

Get configured User session id
 used by [`NotificationType`](NotificationType.md#s-NotificationType)
 notifications.

**Returns:** usid

<a id="s-getVerbosity"></a>
### getVerbosity()

```java
public com.tailf.maapi.Maapi.Verbosity getVerbosity()
```

Types: [Verbosity](../maapi/Maapi/Verbosity.md#s-Verbosity)

Get the configured verbosity
 used by [`NotificationType`](NotificationType.md#s-NotificationType) and
 [`NotificationType`](NotificationType.md#s-NotificationType) notifications.

**Returns:** verbosity

<a id="s-getXPathFilter"></a>
### getXPathFilter()

```java
public String getXPathFilter()
```

Get configured XPathFilter
 used by [`NotificationType`](NotificationType.md#s-NotificationType)
 notifications.

**Returns:** XPathFilter

<a id="s-setHealthCheckInterval"></a>
### setHealthCheckInterval(int)

```java
public void setHealthCheckInterval(int healthCheckInterval)
```

Required if we wish to generate
 [`NotificationType`](NotificationType.md#s-NotificationType) events.
 The time is milli seconds.

**Parameters**

- `int healthCheckInterval`

<a id="s-setHeartbeatInterval"></a>
### setHeartbeatInterval(int)

```java
public void setHeartbeatInterval(int heartbeatInterval)
```

Required if we wish to generate
 [`NotificationType`](NotificationType.md#s-NotificationType) events.
 The time is milli seconds.

**Parameters**

- `int heartbeatInterval`

<a id="s-setStartTime"></a>
### setStartTime(ConfValue)

```java
public void setStartTime(com.tailf.conf.ConfValue startTime)
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue)

Optional for [`NotificationType`](NotificationType.md#s-NotificationType).
 Set to request a replay.
 If no value is indicated by ConfNoExists which is the default.

 Allowed values are of type ConfNoExists or ConfDatetime.

**Parameters**

- `com.tailf.conf.ConfValue startTime`

<a id="s-setStopTime"></a>
### setStopTime(ConfValue)

```java
public void setStopTime(com.tailf.conf.ConfValue stopTime)
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue)

Optional for [`NotificationType`](NotificationType.md#s-NotificationType).
 If startTime is set stopTime can also be set to
 indicated the end of a replay.
 If no value is indicated by ConfNoExists which is the default.

 Allowed values are of type ConfNoExists or ConfDatetime.

**Parameters**

- `com.tailf.conf.ConfValue stopTime`

<a id="s-setStreamName"></a>
### setStreamName(String)

```java
public void setStreamName(String streamName)
```

Required for [`NotificationType`](NotificationType.md#s-NotificationType).
 The stream name of the Notification Stream (required).

**Parameters**

- `String streamName`

<a id="s-setUsid"></a>
### setUsid(int)

```java
public void setUsid(int usid)
```

Optional for [`NotificationType`](NotificationType.md#s-NotificationType).
 User session id for AAA restriction.
 Set to 0 for no AAA.

**Parameters**

- `int usid`

<a id="s-setVerbosity"></a>
### setVerbosity(Verbosity)

```java
public void setVerbosity(com.tailf.maapi.Maapi.Verbosity verbosity)
```

Types: [Verbosity](../maapi/Maapi/Verbosity.md#s-Verbosity)

Optional for [`NotificationType`](NotificationType.md#s-NotificationType) and
 [`NotificationType`](NotificationType.md#s-NotificationType).
 Sets the output verbosity.
 Defaults to Maapi.Verbosity.NORMAL.

**Parameters**

- `com.tailf.maapi.Maapi.Verbosity verbosity`

<a id="s-setXPathFilter"></a>
### setXPathFilter(String)

```java
public void setXPathFilter(String xpathFilter)
```

Optional for [`NotificationType`](NotificationType.md#s-NotificationType).
 XPath filter for the stream.
 NULL for no filter.

**Parameters**

- `String xpathFilter`
