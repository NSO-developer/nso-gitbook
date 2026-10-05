# AuditNotification <a href="#auditnotification-7a35f4700e9c" id="auditnotification-7a35f4700e9c"></a>

```java
public class com.tailf.notif.AuditNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#notification-b2e7d82d4215)

Data structure for Audit events

## Members

**Constructors**:

- [AuditNotification(int, String, int, String)](#auditnotification-0d6674fb37d3)

**Fields**:

- [type](Notification.md#type-6ebb3673fbb6) from Notification

**Methods**:

- [getLogNo()](#getlogno-0a53380cc549)
- [getMessage()](#getmessage-77b7dae8469e)
- [getNotificationType()](Notification.md#getnotificationtype-f0e32b7b644f) from Notification
- [getUser()](#getuser-fbcccdd28c7c)
- [getUserId()](#getuserid-46c2e98d8db7)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### AuditNotification(int, String, int, String) <a href="#auditnotification-0d6674fb37d3" id="auditnotification-0d6674fb37d3"></a>

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

### getLogNo() <a href="#getlogno-0a53380cc549" id="getlogno-0a53380cc549"></a>

```java
public int getLogNo()
```

Gets the log number from confd_logsyms.h associated with this audit
 event.

**Returns:** the log number identifying the type of audit event

### getMessage() <a href="#getmessage-77b7dae8469e" id="getmessage-77b7dae8469e"></a>

```java
public String getMessage()
```

Gets the audit message describing the event that occurred.

**Returns:** the descriptive message for this audit event

### getUser() <a href="#getuser-fbcccdd28c7c" id="getuser-fbcccdd28c7c"></a>

```java
public String getUser()
```

Gets the username associated with this audit event.

**Returns:** the username

### getUserId() <a href="#getuserid-46c2e98d8db7" id="getuserid-46c2e98d8db7"></a>

```java
public int getUserId()
```

Gets the user session identifier associated with this audit event.

**Returns:** the user session ID

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Returns a string representation of this AuditNotification.

**Returns:** a string representation of this audit notification
