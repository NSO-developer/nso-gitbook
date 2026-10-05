<a id="s-AuditNetworkNotification"></a>
# AuditNetworkNotification

```java
public class com.tailf.notif.AuditNetworkNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#s-Notification)

Data structure for audit network notifications.

## Members

**Constructors**:

- [AuditNetworkNotification(int, int, String, String, String, String)](#s-AuditNetworkNotification-1)

**Fields**:

- [type](Notification.md#s-type) from Notification

**Methods**:

- [getConfig()](#s-getConfig)
- [getDevice()](#s-getDevice)
- [getNotificationType()](Notification.md#s-getNotificationType) from Notification
- [getTraceId()](#s-getTraceId)
- [getTransactionId()](#s-getTransactionId)
- [getUser()](#s-getUser)
- [getUserId()](#s-getUserId)
- [toString()](#s-toString)

## Constructors

<a id="s-AuditNetworkNotification-1"></a>
### AuditNetworkNotification(int, int, String, String, String, String)

```java
public AuditNetworkNotification(
    int usid,
    int tid,
    String user,
    String device,
    String traceId,
    String config
)
```

Constructs a new AuditNetworkNotification with the specified parameters.

**Parameters**

- `int usid` - the user session identifier
- `int tid` - the transaction identifier
- `String user` - the username
- `String device` - the device name or identifier
- `String traceId` - the trace identifier
- `String config` - the configuration data as a string


## Methods

<a id="s-getConfig"></a>
### getConfig()

```java
public String getConfig()
```

Gets the configuration data as a string.

**Returns:** the configuration data

<a id="s-getDevice"></a>
### getDevice()

```java
public String getDevice()
```

Gets the device name or identifier associated with this notification.

**Returns:** the device name or identifier

<a id="s-getTraceId"></a>
### getTraceId()

```java
public String getTraceId()
```

Gets the trace identifier for tracking purposes.

**Returns:** the trace identifier, or null if not set

<a id="s-getTransactionId"></a>
### getTransactionId()

```java
public int getTransactionId()
```

Gets the transaction identifier.

**Returns:** the transaction identifier

<a id="s-getUser"></a>
### getUser()

```java
public String getUser()
```

Gets the username associated with this notification.

**Returns:** the username

<a id="s-getUserId"></a>
### getUserId()

```java
public int getUserId()
```

Gets the user session identifier.

**Returns:** the user session identifier

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Returns a string representation of this AuditNetworkNotification.
 The string includes all fields in a formatted manner, with the trace ID
 included only if it is not null.

**Returns:** a string representation of this notification
