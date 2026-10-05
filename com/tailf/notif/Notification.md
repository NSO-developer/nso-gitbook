# Notification <a href="#cls-Notification" id="cls-Notification"></a>

```java
public class com.tailf.notif.Notification
```

Base class for notification data structures.

**Related classes**

- [AuditNetworkNotification](AuditNetworkNotification.md#cls-AuditNetworkNotification)
- [AuditNotification](AuditNotification.md#cls-AuditNotification)
- [CallHomeInfoNotification](CallHomeInfoNotification.md#cls-CallHomeInfoNotification)
- [CommitDiffNotification](CommitDiffNotification.md#cls-CommitDiffNotification)
- [CommitFailedNotification](CommitFailedNotification.md#cls-CommitFailedNotification)
- [CommitNotification](CommitNotification.md#cls-CommitNotification)
- [CommitQueueProgressNotification](CommitQueueProgressNotification.md#cls-CommitQueueProgressNotification)
- [CompactionNotification](CompactionNotification.md#cls-CompactionNotification)
- [ConfirmNotification](ConfirmNotification.md#cls-ConfirmNotification)
- [ForwardNotification](ForwardNotification.md#cls-ForwardNotification)
- [HaNotification](HaNotification.md#cls-HaNotification)
- [HealtCheckNotification](HealtCheckNotification.md#cls-HealtCheckNotification)
- [HeartbeatNotification](HeartbeatNotification.md#cls-HeartbeatNotification)
- [PackageReloadNotification](PackageReloadNotification.md#cls-PackageReloadNotification)
- [ProgressNotification](ProgressNotification.md#cls-ProgressNotification)
- [ReopenLogsNotification](ReopenLogsNotification.md#cls-ReopenLogsNotification)
- [SnmpaNotification](SnmpaNotification.md#cls-SnmpaNotification)
- [StreamNotification](StreamNotification.md#cls-StreamNotification)
- [SubagentNotification](SubagentNotification.md#cls-SubagentNotification)
- [SyslogNotification](SyslogNotification.md#cls-SyslogNotification)
- [SystemGoingDownNotification](SystemGoingDownNotification.md#cls-SystemGoingDownNotification)
- [UpgradeNotification](UpgradeNotification.md#cls-UpgradeNotification)
- [UserSessNotification](UserSessNotification.md#cls-UserSessNotification)

## Members

**Constructors**:

- [Notification()](#m-Notification-7fae6ec3923e)

**Fields**:

- [type](#m-type)

**Methods**:

- [getNotificationType()](#m-getNotificationType-f0e32b7b644f)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### Notification() <a href="#m-Notification-7fae6ec3923e" id="m-Notification-7fae6ec3923e"></a>

```java
public Notification()
```


## Fields

### type <a href="#m-type" id="m-type"></a>

```java
protected com.tailf.notif.NotificationType type = null;
```

Types: [NotificationType](NotificationType.md#cls-NotificationType)


## Methods

### getNotificationType() <a href="#m-getNotificationType-f0e32b7b644f" id="m-getNotificationType-f0e32b7b644f"></a>

```java
public com.tailf.notif.NotificationType getNotificationType()
```

Types: [NotificationType](NotificationType.md#cls-NotificationType)

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
