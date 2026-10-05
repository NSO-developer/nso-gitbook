# AuditNetworkNotification <a href="#cls-AuditNetworkNotification" id="cls-AuditNetworkNotification"></a>

```java
public class com.tailf.notif.AuditNetworkNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for audit network notifications.

## Members

**Constructors**:

- [AuditNetworkNotification(int, int, String, String, String, String)](#m-AuditNetworkNotification-076e0c2c0987)

**Fields**:

- [type](Notification.md#m-type) from Notification

**Methods**:

- [getConfig()](#m-getConfig-5f7a3a2878d2)
- [getDevice()](#m-getDevice-4acac4557fc6)
- [getNotificationType()](Notification.md#m-getNotificationType-f0e32b7b644f) from Notification
- [getTraceId()](#m-getTraceId-c3a30b94d9ce)
- [getTransactionId()](#m-getTransactionId-c986b15287a0)
- [getUser()](#m-getUser-fbcccdd28c7c)
- [getUserId()](#m-getUserId-46c2e98d8db7)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### AuditNetworkNotification(int, int, String, String, String, String) <a href="#m-AuditNetworkNotification-076e0c2c0987" id="m-AuditNetworkNotification-076e0c2c0987"></a>

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

### getConfig() <a href="#m-getConfig-5f7a3a2878d2" id="m-getConfig-5f7a3a2878d2"></a>

```java
public String getConfig()
```

Gets the configuration data as a string.

**Returns:** the configuration data

### getDevice() <a href="#m-getDevice-4acac4557fc6" id="m-getDevice-4acac4557fc6"></a>

```java
public String getDevice()
```

Gets the device name or identifier associated with this notification.

**Returns:** the device name or identifier

### getTraceId() <a href="#m-getTraceId-c3a30b94d9ce" id="m-getTraceId-c3a30b94d9ce"></a>

```java
public String getTraceId()
```

Gets the trace identifier for tracking purposes.

**Returns:** the trace identifier, or null if not set

### getTransactionId() <a href="#m-getTransactionId-c986b15287a0" id="m-getTransactionId-c986b15287a0"></a>

```java
public int getTransactionId()
```

Gets the transaction identifier.

**Returns:** the transaction identifier

### getUser() <a href="#m-getUser-fbcccdd28c7c" id="m-getUser-fbcccdd28c7c"></a>

```java
public String getUser()
```

Gets the username associated with this notification.

**Returns:** the username

### getUserId() <a href="#m-getUserId-46c2e98d8db7" id="m-getUserId-46c2e98d8db7"></a>

```java
public int getUserId()
```

Gets the user session identifier.

**Returns:** the user session identifier

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Returns a string representation of this AuditNetworkNotification.
 The string includes all fields in a formatted manner, with the trace ID
 included only if it is not null.

**Returns:** a string representation of this notification
