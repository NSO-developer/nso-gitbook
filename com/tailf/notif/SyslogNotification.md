# SyslogNotification <a href="#cls-SyslogNotification" id="cls-SyslogNotification"></a>

```java
public class com.tailf.notif.SyslogNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for syslog notifications.

## Members

**Constructors**:

- [SyslogNotification(NotificationType, int, int, String)](#m-SyslogNotification-b7a94aea9504)

**Fields**:

- [type](Notification.md#m-type) from Notification

**Methods**:

- [getLogNo()](#m-getLogNo-0a53380cc549)
- [getMessage()](#m-getMessage-77b7dae8469e)
- [getNotificationType()](Notification.md#m-getNotificationType-f0e32b7b644f) from Notification
- [getPrio()](#m-getPrio-c1baed14ad8b)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### SyslogNotification(NotificationType, int, int, String) <a href="#m-SyslogNotification-b7a94aea9504" id="m-SyslogNotification-b7a94aea9504"></a>

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

### getLogNo() <a href="#m-getLogNo-0a53380cc549" id="m-getLogNo-0a53380cc549"></a>

```java
public int getLogNo()
```

Log number (from confd_logsyms.h)

### getMessage() <a href="#m-getMessage-77b7dae8469e" id="m-getMessage-77b7dae8469e"></a>

```java
public String getMessage()
```

Syslog Message

### getPrio() <a href="#m-getPrio-c1baed14ad8b" id="m-getPrio-c1baed14ad8b"></a>

```java
public int getPrio()
```

Priority (from syslog.h)

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
