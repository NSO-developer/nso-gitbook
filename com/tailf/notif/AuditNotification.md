<a id="cls-AuditNotification"></a>
# AuditNotification

```java
public class com.tailf.notif.AuditNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for Audit events

## Members

**Constructors**:

- [AuditNotification(int, String, int, String)](#m-auditnotification-0d6674fb37d3)

**Fields**:

- [type](Notification.md#m-type) from Notification

**Methods**:

- [getLogNo()](#m-getlogno-0a53380cc549)
- [getMessage()](#m-getmessage-77b7dae8469e)
- [getNotificationType()](Notification.md#m-getnotificationtype-f0e32b7b644f) from Notification
- [getUser()](#m-getuser-fbcccdd28c7c)
- [getUserId()](#m-getuserid-46c2e98d8db7)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-auditnotification-0d6674fb37d3"></a>
### AuditNotification(int, String, int, String)

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

<a id="m-getlogno-0a53380cc549"></a>
### getLogNo()

```java
public int getLogNo()
```

Gets the log number from confd_logsyms.h associated with this audit
 event.

**Returns:** the log number identifying the type of audit event

<a id="m-getmessage-77b7dae8469e"></a>
### getMessage()

```java
public String getMessage()
```

Gets the audit message describing the event that occurred.

**Returns:** the descriptive message for this audit event

<a id="m-getuser-fbcccdd28c7c"></a>
### getUser()

```java
public String getUser()
```

Gets the username associated with this audit event.

**Returns:** the username

<a id="m-getuserid-46c2e98d8db7"></a>
### getUserId()

```java
public int getUserId()
```

Gets the user session identifier associated with this audit event.

**Returns:** the user session ID

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Returns a string representation of this AuditNotification.

**Returns:** a string representation of this audit notification
