<a id="cls-SyslogNotification"></a>
# SyslogNotification

```java
public class com.tailf.notif.SyslogNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for syslog notifications.

## Members

**Constructors**:

- [SyslogNotification(NotificationType, int, int, String)](#m-syslognotification-b7a94aea9504)

**Fields**:

- [type](Notification.md#m-type) from Notification

**Methods**:

- [getLogNo()](#m-getlogno-0a53380cc549)
- [getMessage()](#m-getmessage-77b7dae8469e)
- [getNotificationType()](Notification.md#m-getnotificationtype-f0e32b7b644f) from Notification
- [getPrio()](#m-getprio-c1baed14ad8b)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-syslognotification-b7a94aea9504"></a>
### SyslogNotification(NotificationType, int, int, String)

**Package-private**

```java
SyslogNotification(com.tailf.notif.NotificationType type, int logno, int prio, String msg)
```

Types: [NotificationType](NotificationType.md#cls-NotificationType)

**Parameters**

- `com.tailf.notif.NotificationType type`
- `int logno`
- `int prio`
- `String msg`


## Methods

<a id="m-getlogno-0a53380cc549"></a>
### getLogNo()

```java
public int getLogNo()
```

Log number (from confd_logsyms.h)

<a id="m-getmessage-77b7dae8469e"></a>
### getMessage()

```java
public String getMessage()
```

Syslog Message

<a id="m-getprio-c1baed14ad8b"></a>
### getPrio()

```java
public int getPrio()
```

Priority (from syslog.h)

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
