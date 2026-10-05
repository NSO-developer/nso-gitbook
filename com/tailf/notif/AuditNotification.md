# AuditNotification <a href="#cls-AuditNotification" id="cls-AuditNotification"></a>

```java
public class com.tailf.notif.AuditNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for Audit events

## Members

**Constructors**:

- [AuditNotification(int, String, int, String)](#m-AuditNotification-0d6674fb37d3)

**Fields**:

- [type](Notification.md#m-type) from Notification

**Methods**:

- [getLogNo()](#m-getLogNo-0a53380cc549)
- [getMessage()](#m-getMessage-77b7dae8469e)
- [getNotificationType()](Notification.md#m-getNotificationType-f0e32b7b644f) from Notification
- [getUser()](#m-getUser-fbcccdd28c7c)
- [getUserId()](#m-getUserId-46c2e98d8db7)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### AuditNotification(int, String, int, String) <a href="#m-AuditNotification-0d6674fb37d3" id="m-AuditNotification-0d6674fb37d3"></a>

```java
public AuditNotification(int logno, String user, int usid, String msg)
```

Constructs a new AuditNotification with the specified parameters.

**Parameters**

- `int logno` - the log number from confd_logsyms.h
- `String user` - the username associated with the audit event
- `int usid` - the user session identifier
- `String msg` - the audit message describing the event


## Methods

### getLogNo() <a href="#m-getLogNo-0a53380cc549" id="m-getLogNo-0a53380cc549"></a>

```java
public int getLogNo()
```

Gets the log number from confd_logsyms.h associated with this audit
 event.

**Returns:** the log number identifying the type of audit event

### getMessage() <a href="#m-getMessage-77b7dae8469e" id="m-getMessage-77b7dae8469e"></a>

```java
public String getMessage()
```

Gets the audit message describing the event that occurred.

**Returns:** the descriptive message for this audit event

### getUser() <a href="#m-getUser-fbcccdd28c7c" id="m-getUser-fbcccdd28c7c"></a>

```java
public String getUser()
```

Gets the username associated with this audit event.

**Returns:** the username

### getUserId() <a href="#m-getUserId-46c2e98d8db7" id="m-getUserId-46c2e98d8db7"></a>

```java
public int getUserId()
```

Gets the user session identifier associated with this audit event.

**Returns:** the user session ID

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Returns a string representation of this AuditNotification.

**Returns:** a string representation of this audit notification
