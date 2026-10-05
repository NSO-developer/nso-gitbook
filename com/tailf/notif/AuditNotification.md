<a id="s-AuditNotification"></a>
# AuditNotification

```java
public class com.tailf.notif.AuditNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#s-Notification)

Data structure for Audit events

## Members

**Constructors**:

- [AuditNotification(int, String, int, String)](#s-AuditNotification-1)

**Fields**:

- [type](Notification.md#s-type) from Notification

**Methods**:

- [getLogNo()](#s-getLogNo)
- [getMessage()](#s-getMessage)
- [getNotificationType()](Notification.md#s-getNotificationType) from Notification
- [getUser()](#s-getUser)
- [getUserId()](#s-getUserId)
- [toString()](#s-toString)

## Constructors

<a id="s-AuditNotification-1"></a>
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

<a id="s-getLogNo"></a>
### getLogNo()

```java
public int getLogNo()
```

Gets the log number from confd_logsyms.h associated with this audit
 event.

**Returns:** the log number identifying the type of audit event

<a id="s-getMessage"></a>
### getMessage()

```java
public String getMessage()
```

Gets the audit message describing the event that occurred.

**Returns:** the descriptive message for this audit event

<a id="s-getUser"></a>
### getUser()

```java
public String getUser()
```

Gets the username associated with this audit event.

**Returns:** the username

<a id="s-getUserId"></a>
### getUserId()

```java
public int getUserId()
```

Gets the user session identifier associated with this audit event.

**Returns:** the user session ID

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Returns a string representation of this AuditNotification.

**Returns:** a string representation of this audit notification
