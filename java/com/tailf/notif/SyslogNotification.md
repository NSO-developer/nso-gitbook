# SyslogNotification <a href="#syslognotification-5d0087332348" id="syslognotification-5d0087332348"></a>

```java
public class com.tailf.notif.SyslogNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#notification-b2e7d82d4215)

Data structure for syslog notifications.

## Members

**Fields**:

- [type](Notification.md#type-6ebb3673fbb6) from Notification

**Methods**:

- [getLogNo\(\)](#getlogno-0a53380cc549)
- [getMessage\(\)](#getmessage-77b7dae8469e)
- [getNotificationType\(\)](Notification.md#getnotificationtype-f0e32b7b644f) from Notification
- [getPrio\(\)](#getprio-c1baed14ad8b)
- [toString\(\)](#tostring-e9d48c5503ef)

## Methods

### getLogNo() <a href="#getlogno-0a53380cc549" id="getlogno-0a53380cc549"></a>

```java
public int getLogNo()
```

Log number (from confd_logsyms.h)

### getMessage() <a href="#getmessage-77b7dae8469e" id="getmessage-77b7dae8469e"></a>

```java
public String getMessage()
```

Syslog Message

### getPrio() <a href="#getprio-c1baed14ad8b" id="getprio-c1baed14ad8b"></a>

```java
public int getPrio()
```

Priority (from syslog.h)

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
