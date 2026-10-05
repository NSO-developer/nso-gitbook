<a id="s-Notification"></a>
# Notification

```java
public class com.tailf.notif.Notification
```

Base class for notification data structures.

**Related classes**

- [AuditNetworkNotification](AuditNetworkNotification.md#s-AuditNetworkNotification)
- [AuditNotification](AuditNotification.md#s-AuditNotification)
- [CallHomeInfoNotification](CallHomeInfoNotification.md#s-CallHomeInfoNotification)
- [CommitDiffNotification](CommitDiffNotification.md#s-CommitDiffNotification)
- [CommitFailedNotification](CommitFailedNotification.md#s-CommitFailedNotification)
- [CommitNotification](CommitNotification.md#s-CommitNotification)
- [CommitQueueProgressNotification](CommitQueueProgressNotification.md#s-CommitQueueProgressNotification)
- [CompactionNotification](CompactionNotification.md#s-CompactionNotification)
- [ConfirmNotification](ConfirmNotification.md#s-ConfirmNotification)
- [ForwardNotification](ForwardNotification.md#s-ForwardNotification)
- [HaNotification](HaNotification.md#s-HaNotification)
- [HealtCheckNotification](HealtCheckNotification.md#s-HealtCheckNotification)
- [HeartbeatNotification](HeartbeatNotification.md#s-HeartbeatNotification)
- [PackageReloadNotification](PackageReloadNotification.md#s-PackageReloadNotification)
- [ProgressNotification](ProgressNotification.md#s-ProgressNotification)
- [ReopenLogsNotification](ReopenLogsNotification.md#s-ReopenLogsNotification)
- [SnmpaNotification](SnmpaNotification.md#s-SnmpaNotification)
- [StreamNotification](StreamNotification.md#s-StreamNotification)
- [SubagentNotification](SubagentNotification.md#s-SubagentNotification)
- [SyslogNotification](SyslogNotification.md#s-SyslogNotification)
- [SystemGoingDownNotification](SystemGoingDownNotification.md#s-SystemGoingDownNotification)
- [UpgradeNotification](UpgradeNotification.md#s-UpgradeNotification)
- [UserSessNotification](UserSessNotification.md#s-UserSessNotification)

## Members

**Constructors**:

- [Notification()](#s-Notification-1)

**Fields**:

- [type](#s-type)

**Methods**:

- [getNotificationType()](#s-getNotificationType)
- [toString()](#s-toString)

## Constructors

<a id="s-Notification-1"></a>
### Notification()

```java
public Notification()
```


## Fields

<a id="s-type"></a>
### type

```java
protected com.tailf.notif.NotificationType type = null;
```

Types: [NotificationType](NotificationType.md#s-NotificationType)


## Methods

<a id="s-getNotificationType"></a>
### getNotificationType()

```java
public com.tailf.notif.NotificationType getNotificationType()
```

Types: [NotificationType](NotificationType.md#s-NotificationType)

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
