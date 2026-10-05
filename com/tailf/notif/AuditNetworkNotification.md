<a id="cls-AuditNetworkNotification"></a>
# AuditNetworkNotification

```java
public class com.tailf.notif.AuditNetworkNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for audit network notifications.

## Members

**Constructors**:

- [AuditNetworkNotification(int, int, String, String, String, String)](#m-auditnetworknotification-076e0c2c0987)

**Fields**:

- [type](Notification.md#m-type) from Notification

**Methods**:

- [getConfig()](#m-getconfig-5f7a3a2878d2)
- [getDevice()](#m-getdevice-4acac4557fc6)
- [getNotificationType()](Notification.md#m-getnotificationtype-f0e32b7b644f) from Notification
- [getTraceId()](#m-gettraceid-c3a30b94d9ce)
- [getTransactionId()](#m-gettransactionid-c986b15287a0)
- [getUser()](#m-getuser-fbcccdd28c7c)
- [getUserId()](#m-getuserid-46c2e98d8db7)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-auditnetworknotification-076e0c2c0987"></a>
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

<a id="m-getconfig-5f7a3a2878d2"></a>
### getConfig()

```java
public String getConfig()
```

Gets the configuration data as a string.

**Returns:** the configuration data

<a id="m-getdevice-4acac4557fc6"></a>
### getDevice()

```java
public String getDevice()
```

Gets the device name or identifier associated with this notification.

**Returns:** the device name or identifier

<a id="m-gettraceid-c3a30b94d9ce"></a>
### getTraceId()

```java
public String getTraceId()
```

Gets the trace identifier for tracking purposes.

**Returns:** the trace identifier, or null if not set

<a id="m-gettransactionid-c986b15287a0"></a>
### getTransactionId()

```java
public int getTransactionId()
```

Gets the transaction identifier.

**Returns:** the transaction identifier

<a id="m-getuser-fbcccdd28c7c"></a>
### getUser()

```java
public String getUser()
```

Gets the username associated with this notification.

**Returns:** the username

<a id="m-getuserid-46c2e98d8db7"></a>
### getUserId()

```java
public int getUserId()
```

Gets the user session identifier.

**Returns:** the user session identifier

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Returns a string representation of this AuditNetworkNotification.
 The string includes all fields in a formatted manner, with the trace ID
 included only if it is not null.

**Returns:** a string representation of this notification
