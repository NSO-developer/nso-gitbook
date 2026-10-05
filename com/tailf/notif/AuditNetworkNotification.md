# AuditNetworkNotification <a href="#auditnetworknotification-8c937b78f433" id="auditnetworknotification-8c937b78f433"></a>

```java
public class com.tailf.notif.AuditNetworkNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#notification-b2e7d82d4215)

Data structure for audit network notifications.

## Members

**Constructors**:

- [AuditNetworkNotification(int, int, String, String, String, String)](#auditnetworknotification-076e0c2c0987)

**Fields**:

- [type](Notification.md#type-6ebb3673fbb6) from Notification

**Methods**:

- [getConfig()](#getconfig-5f7a3a2878d2)
- [getDevice()](#getdevice-4acac4557fc6)
- [getNotificationType()](Notification.md#getnotificationtype-f0e32b7b644f) from Notification
- [getTraceId()](#gettraceid-c3a30b94d9ce)
- [getTransactionId()](#gettransactionid-c986b15287a0)
- [getUser()](#getuser-fbcccdd28c7c)
- [getUserId()](#getuserid-46c2e98d8db7)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### AuditNetworkNotification(int, int, String, String, String, String) <a href="#auditnetworknotification-076e0c2c0987" id="auditnetworknotification-076e0c2c0987"></a>

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

### getConfig() <a href="#getconfig-5f7a3a2878d2" id="getconfig-5f7a3a2878d2"></a>

```java
public String getConfig()
```

Gets the configuration data as a string.

**Returns:** the configuration data

### getDevice() <a href="#getdevice-4acac4557fc6" id="getdevice-4acac4557fc6"></a>

```java
public String getDevice()
```

Gets the device name or identifier associated with this notification.

**Returns:** the device name or identifier

### getTraceId() <a href="#gettraceid-c3a30b94d9ce" id="gettraceid-c3a30b94d9ce"></a>

```java
public String getTraceId()
```

Gets the trace identifier for tracking purposes.

**Returns:** the trace identifier, or null if not set

### getTransactionId() <a href="#gettransactionid-c986b15287a0" id="gettransactionid-c986b15287a0"></a>

```java
public int getTransactionId()
```

Gets the transaction identifier.

**Returns:** the transaction identifier

### getUser() <a href="#getuser-fbcccdd28c7c" id="getuser-fbcccdd28c7c"></a>

```java
public String getUser()
```

Gets the username associated with this notification.

**Returns:** the username

### getUserId() <a href="#getuserid-46c2e98d8db7" id="getuserid-46c2e98d8db7"></a>

```java
public int getUserId()
```

Gets the user session identifier.

**Returns:** the user session identifier

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Returns a string representation of this AuditNetworkNotification.
 The string includes all fields in a formatted manner, with the trace ID
 included only if it is not null.

**Returns:** a string representation of this notification
