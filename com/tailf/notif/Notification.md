# Notification <a href="#notification-b2e7d82d4215" id="notification-b2e7d82d4215"></a>

```java
public class com.tailf.notif.Notification
```

Base class for notification data structures.

**Related classes**

- [AuditNetworkNotification](AuditNetworkNotification.md#auditnetworknotification-8c937b78f433)
- [AuditNotification](AuditNotification.md#auditnotification-7a35f4700e9c)
- [CallHomeInfoNotification](CallHomeInfoNotification.md#callhomeinfonotification-d29c7e74561c)
- [CommitDiffNotification](CommitDiffNotification.md#commitdiffnotification-c6f5ad668010)
- [CommitFailedNotification](CommitFailedNotification.md#commitfailednotification-bef571382961)
- [CommitNotification](CommitNotification.md#commitnotification-30ba63db10de)
- [CommitQueueProgressNotification](CommitQueueProgressNotification.md#commitqueueprogressnotification-a2a32afaa4c3)
- [CompactionNotification](CompactionNotification.md#compactionnotification-401ddf1907af)
- [ConfirmNotification](ConfirmNotification.md#confirmnotification-10447869c375)
- [ForwardNotification](ForwardNotification.md#forwardnotification-1c104ab318e3)
- [HaNotification](HaNotification.md#hanotification-18807803b5fa)
- [HealtCheckNotification](HealtCheckNotification.md#healtchecknotification-ed82ebc35dd0)
- [HeartbeatNotification](HeartbeatNotification.md#heartbeatnotification-0af557025d11)
- [PackageReloadNotification](PackageReloadNotification.md#packagereloadnotification-d077e4cc2049)
- [ProgressNotification](ProgressNotification.md#progressnotification-97286de4fe31)
- [ReopenLogsNotification](ReopenLogsNotification.md#reopenlogsnotification-1b749f5f2295)
- [SnmpaNotification](SnmpaNotification.md#snmpanotification-1dc17468977a)
- [StreamNotification](StreamNotification.md#streamnotification-80461d0dc6f6)
- [SubagentNotification](SubagentNotification.md#subagentnotification-d8adb6073ef3)
- [SyslogNotification](SyslogNotification.md#syslognotification-5d0087332348)
- [SystemGoingDownNotification](SystemGoingDownNotification.md#systemgoingdownnotification-b2014b44eb10)
- [UpgradeNotification](UpgradeNotification.md#upgradenotification-8f9e3ffbdab5)
- [UserSessNotification](UserSessNotification.md#usersessnotification-da9415293f94)

## Members

**Constructors**:

- [Notification\(\)](#notification-7fae6ec3923e)

**Fields**:

- [type](#type-6ebb3673fbb6)

**Methods**:

- [getNotificationType\(\)](#getnotificationtype-f0e32b7b644f)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### Notification() <a href="#notification-7fae6ec3923e" id="notification-7fae6ec3923e"></a>

```java
public Notification()
```


## Fields

### type <a href="#type-6ebb3673fbb6" id="type-6ebb3673fbb6"></a>

```java
protected com.tailf.notif.NotificationType type = null;
```

Types: [NotificationType](NotificationType.md#notificationtype-1f10f57e184d)


## Methods

### getNotificationType() <a href="#getnotificationtype-f0e32b7b644f" id="getnotificationtype-f0e32b7b644f"></a>

```java
public com.tailf.notif.NotificationType getNotificationType()
```

Types: [NotificationType](NotificationType.md#notificationtype-1f10f57e184d)

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
