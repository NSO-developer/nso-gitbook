<a id="cls-Notification"></a>
# Notification

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

- [Notification()](#m-notification-7fae6ec3923e)

**Fields**:

- [type](#m-type)

**Methods**:

- [getNotificationType()](#m-getnotificationtype-f0e32b7b644f)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-notification-7fae6ec3923e"></a>
### Notification()

```java
public Notification()
```


## Fields

<a id="m-type"></a>
### type

```java
protected com.tailf.notif.NotificationType type = null;
```

Types: [NotificationType](NotificationType.md#cls-NotificationType)


## Methods

<a id="m-getnotificationtype-f0e32b7b644f"></a>
### getNotificationType()

```java
public com.tailf.notif.NotificationType getNotificationType()
```

Types: [NotificationType](NotificationType.md#cls-NotificationType)

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
