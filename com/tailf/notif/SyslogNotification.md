<a id="s-SyslogNotification"></a>
# SyslogNotification

```java
public class com.tailf.notif.SyslogNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#s-Notification)

Data structure for syslog notifications.

## Members

**Constructors**:

- [SyslogNotification(NotificationType, int, int, String)](#s-SyslogNotification-1)

**Fields**:

- [type](Notification.md#s-type) from Notification

**Methods**:

- [getLogNo()](#s-getLogNo)
- [getMessage()](#s-getMessage)
- [getNotificationType()](Notification.md#s-getNotificationType) from Notification
- [getPrio()](#s-getPrio)
- [toString()](#s-toString)

## Constructors

<a id="s-SyslogNotification-1"></a>
### SyslogNotification(NotificationType, int, int, String)

**Package-private**

```java
SyslogNotification(com.tailf.notif.NotificationType type, int logno, int prio, String msg)
```

Types: [NotificationType](NotificationType.md#s-NotificationType)

**Parameters**

- `com.tailf.notif.NotificationType type`
- `int logno`
- `int prio`
- `String msg`


## Methods

<a id="s-getLogNo"></a>
### getLogNo()

```java
public int getLogNo()
```

Log number (from confd_logsyms.h)

<a id="s-getMessage"></a>
### getMessage()

```java
public String getMessage()
```

Syslog Message

<a id="s-getPrio"></a>
### getPrio()

```java
public int getPrio()
```

Priority (from syslog.h)

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
