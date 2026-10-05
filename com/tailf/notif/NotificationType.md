<a id="cls-NotificationType"></a>
# NotificationType

```java
public enum com.tailf.notif.NotificationType
```

Types: [NotificationType](NotificationType.md#cls-NotificationType)

Enum describing the different notification types available.

## Members

**Enum Constants**:

- [NOTIF_AUDIT](#m-NOTIF_AUDIT)
- [NOTIF_AUDIT_NETWORK](#m-NOTIF_AUDIT_NETWORK)
- [NOTIF_AUDIT_NETWORK_SYNC](#m-NOTIF_AUDIT_NETWORK_SYNC)
- [NOTIF_AUDIT_SYNC](#m-NOTIF_AUDIT_SYNC)
- [NOTIF_CALL_HOME_INFO](#m-NOTIF_CALL_HOME_INFO)
- [NOTIF_COMMIT_DIFF](#m-NOTIF_COMMIT_DIFF)
- [NOTIF_COMMIT_FAILED](#m-NOTIF_COMMIT_FAILED)
- [NOTIF_COMMIT_PROGRESS](#m-NOTIF_COMMIT_PROGRESS)
- [NOTIF_COMMIT_SIMPLE](#m-NOTIF_COMMIT_SIMPLE)
- [NOTIF_COMPACTION](#m-NOTIF_COMPACTION)
- [NOTIF_CONFIRMED_COMMIT](#m-NOTIF_CONFIRMED_COMMIT)
- [NOTIF_CQ_PROGRESS](#m-NOTIF_CQ_PROGRESS)
- [NOTIF_DAEMON](#m-NOTIF_DAEMON)
- [NOTIF_DEVEL](#m-NOTIF_DEVEL)
- [NOTIF_FORWARD_INFO](#m-NOTIF_FORWARD_INFO)
- [NOTIF_HA_INFO](#m-NOTIF_HA_INFO)
- [NOTIF_HA_INFO_SYNC](#m-NOTIF_HA_INFO_SYNC)
- [NOTIF_HEALTH_CHECK](#m-NOTIF_HEALTH_CHECK)
- [NOTIF_HEARTBEAT](#m-NOTIF_HEARTBEAT)
- [NOTIF_JSONRPC](#m-NOTIF_JSONRPC)
- [NOTIF_NETCONF](#m-NOTIF_NETCONF)
- [NOTIF_PACKAGE_RELOAD](#m-NOTIF_PACKAGE_RELOAD)
- [NOTIF_PROGRESS](#m-NOTIF_PROGRESS)
- [NOTIF_REOPEN_LOGS](#m-NOTIF_REOPEN_LOGS)
- [NOTIF_RESTCONF](#m-NOTIF_RESTCONF)
- [NOTIF_SNMPA](#m-NOTIF_SNMPA)
- [NOTIF_STREAM_EVENT](#m-NOTIF_STREAM_EVENT)
- [NOTIF_SUBAGENT_INFO](#m-NOTIF_SUBAGENT_INFO)
- [NOTIF_SYSTEM_GOING_DOWN](#m-NOTIF_SYSTEM_GOING_DOWN)
- [NOTIF_TAKEOVER_SYSLOG](#m-NOTIF_TAKEOVER_SYSLOG)
- [NOTIF_UPGRADE_EVENT](#m-NOTIF_UPGRADE_EVENT)
- [NOTIF_USER_SESSION](#m-NOTIF_USER_SESSION)
- [NOTIF_WEBUI](#m-NOTIF_WEBUI)

**Methods**:

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(long)](#m-valueof-82e4f8f2d821)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-NOTIF_AUDIT"></a>
### NOTIF_AUDIT

```java
public static final com.tailf.notif.NotificationType NOTIF_AUDIT;
```

Flag in eventmask requests ConfD to send audit log events.

<a id="m-NOTIF_AUDIT_NETWORK"></a>
### NOTIF_AUDIT_NETWORK

```java
public static final com.tailf.notif.NotificationType NOTIF_AUDIT_NETWORK;
```

Flag in eventmask requests NCS to send audit network events

<a id="m-NOTIF_AUDIT_NETWORK_SYNC"></a>
### NOTIF_AUDIT_NETWORK_SYNC

```java
public static final com.tailf.notif.NotificationType NOTIF_AUDIT_NETWORK_SYNC;
```

Flag in eventmask which is used in combination with the
  NOTIF_AUDIT_NETWORK flag and then implies that the method
  `Notif#syncAuditNetworkNotification(int usid)`
  must be called for each notification or else the user session
  will hang indefinitely

<a id="m-NOTIF_AUDIT_SYNC"></a>
### NOTIF_AUDIT_SYNC

```java
public static final com.tailf.notif.NotificationType NOTIF_AUDIT_SYNC;
```

Flag in eventmask which is used in combination with the
  NOTIF_AUDIT flag and then implies that the method
  `Notif#syncAuditNotification(int usid)`
  must be called for each notification or else the user session
  will hang indefinitely

<a id="m-NOTIF_CALL_HOME_INFO"></a>
### NOTIF_CALL_HOME_INFO

```java
public static final com.tailf.notif.NotificationType NOTIF_CALL_HOME_INFO;
```

Flag in eventmask requests NCS to send events for NETCONF Call Home
 connections.

<a id="m-NOTIF_COMMIT_DIFF"></a>
### NOTIF_COMMIT_DIFF

```java
public static final com.tailf.notif.NotificationType NOTIF_COMMIT_DIFF;
```

Flag in eventmask requests ConfD to send commit diff events.

<a id="m-NOTIF_COMMIT_FAILED"></a>
### NOTIF_COMMIT_FAILED

```java
public static final com.tailf.notif.NotificationType NOTIF_COMMIT_FAILED;
```

Flag in eventmask requests ConfD to send commit failed events.

<a id="m-NOTIF_COMMIT_PROGRESS"></a>
### NOTIF_COMMIT_PROGRESS

```java
public static final com.tailf.notif.NotificationType NOTIF_COMMIT_PROGRESS;
```

Flag in eventmask requests ConfD to send commit progress events.

<a id="m-NOTIF_COMMIT_SIMPLE"></a>
### NOTIF_COMMIT_SIMPLE

```java
public static final com.tailf.notif.NotificationType NOTIF_COMMIT_SIMPLE;
```

Flag in eventmask requests ConfD to send commit events.

<a id="m-NOTIF_COMPACTION"></a>
### NOTIF_COMPACTION

```java
public static final com.tailf.notif.NotificationType NOTIF_COMPACTION;
```

Flag in eventmask requests NCS to send compaction events

<a id="m-NOTIF_CONFIRMED_COMMIT"></a>
### NOTIF_CONFIRMED_COMMIT

```java
public static final com.tailf.notif.NotificationType NOTIF_CONFIRMED_COMMIT;
```

Flag in eventmask requests ConfD to send confirmed commit events.

<a id="m-NOTIF_CQ_PROGRESS"></a>
### NOTIF_CQ_PROGRESS

```java
public static final com.tailf.notif.NotificationType NOTIF_CQ_PROGRESS;
```

Flag in eventmask requests NCS to send event for the ncs commit queue
 item lifecycle
 reload has completed

<a id="m-NOTIF_DAEMON"></a>
### NOTIF_DAEMON

```java
public static final com.tailf.notif.NotificationType NOTIF_DAEMON;
```

Flag in eventmask requests ConfD to send syslog events.

<a id="m-NOTIF_DEVEL"></a>
### NOTIF_DEVEL

```java
public static final com.tailf.notif.NotificationType NOTIF_DEVEL;
```

Flag in eventmask requests ConfD to send devel events.

<a id="m-NOTIF_FORWARD_INFO"></a>
### NOTIF_FORWARD_INFO

```java
public static final com.tailf.notif.NotificationType NOTIF_FORWARD_INFO;
```

Flag in eventmask requests ConfD to send forward info events.

<a id="m-NOTIF_HA_INFO"></a>
### NOTIF_HA_INFO

```java
public static final com.tailf.notif.NotificationType NOTIF_HA_INFO;
```

Flag in eventmask requests ConfD to send HA (high availability) info
 events.

<a id="m-NOTIF_HA_INFO_SYNC"></a>
### NOTIF_HA_INFO_SYNC

```java
public static final com.tailf.notif.NotificationType NOTIF_HA_INFO_SYNC;
```

Flag in eventmask requests ConfD events related to changes of the
  current cluster configuration

<a id="m-NOTIF_HEALTH_CHECK"></a>
### NOTIF_HEALTH_CHECK

```java
public static final com.tailf.notif.NotificationType NOTIF_HEALTH_CHECK;
```

Flag in eventmask requests ConfD to send health check events.

<a id="m-NOTIF_HEARTBEAT"></a>
### NOTIF_HEARTBEAT

```java
public static final com.tailf.notif.NotificationType NOTIF_HEARTBEAT;
```

Flag in eventmask requests ConfD to send heartbeat events.

<a id="m-NOTIF_JSONRPC"></a>
### NOTIF_JSONRPC

```java
public static final com.tailf.notif.NotificationType NOTIF_JSONRPC;
```

Flag in eventmask requests ConfD to send jsonrpc events.

<a id="m-NOTIF_NETCONF"></a>
### NOTIF_NETCONF

```java
public static final com.tailf.notif.NotificationType NOTIF_NETCONF;
```

Flag in eventmask requests ConfD to send netconf events.

<a id="m-NOTIF_PACKAGE_RELOAD"></a>
### NOTIF_PACKAGE_RELOAD

```java
public static final com.tailf.notif.NotificationType NOTIF_PACKAGE_RELOAD;
```

Flag in eventmask requests NCS to send event when a package
  reload has completed

<a id="m-NOTIF_PROGRESS"></a>
### NOTIF_PROGRESS

```java
public static final com.tailf.notif.NotificationType NOTIF_PROGRESS;
```

Flag in eventmask requests ConfD to send progress events of
 the commit of a transaction or an action being applied.

<a id="m-NOTIF_REOPEN_LOGS"></a>
### NOTIF_REOPEN_LOGS

```java
public static final com.tailf.notif.NotificationType NOTIF_REOPEN_LOGS;
```

Flag in eventmask requests ConfD/NCS to send an event when it will
  close and reopen its log files

<a id="m-NOTIF_RESTCONF"></a>
### NOTIF_RESTCONF

```java
public static final com.tailf.notif.NotificationType NOTIF_RESTCONF;
```

Flag in eventmask requests ConfD to send RESTCONF log events

<a id="m-NOTIF_SNMPA"></a>
### NOTIF_SNMPA

```java
public static final com.tailf.notif.NotificationType NOTIF_SNMPA;
```

Flag in eventmask requests ConfD to send snmpa events.

<a id="m-NOTIF_STREAM_EVENT"></a>
### NOTIF_STREAM_EVENT

```java
public static final com.tailf.notif.NotificationType NOTIF_STREAM_EVENT;
```

Flag in eventmask requests ConfD to send event
  for a notification stream

<a id="m-NOTIF_SUBAGENT_INFO"></a>
### NOTIF_SUBAGENT_INFO

```java
public static final com.tailf.notif.NotificationType NOTIF_SUBAGENT_INFO;
```

Flag in eventmask requests ConfD to send subagent info events.

<a id="m-NOTIF_SYSTEM_GOING_DOWN"></a>
### NOTIF_SYSTEM_GOING_DOWN

```java
public static final com.tailf.notif.NotificationType NOTIF_SYSTEM_GOING_DOWN;
```

Flag in eventmask requests ConfD to send system going down events

<a id="m-NOTIF_TAKEOVER_SYSLOG"></a>
### NOTIF_TAKEOVER_SYSLOG

```java
public static final com.tailf.notif.NotificationType NOTIF_TAKEOVER_SYSLOG;
```

Flag in eventmask requests ConfD to send syslog takeover events.

<a id="m-NOTIF_UPGRADE_EVENT"></a>
### NOTIF_UPGRADE_EVENT

```java
public static final com.tailf.notif.NotificationType NOTIF_UPGRADE_EVENT;
```

Flag in eventmask requests ConfD to send upgrade info events.

<a id="m-NOTIF_USER_SESSION"></a>
### NOTIF_USER_SESSION

```java
public static final com.tailf.notif.NotificationType NOTIF_USER_SESSION;
```

Flag in eventmask requests ConfD to send user session events.

<a id="m-NOTIF_WEBUI"></a>
### NOTIF_WEBUI

```java
public static final com.tailf.notif.NotificationType NOTIF_WEBUI;
```

Flag in eventmask requests ConfD to send webui events.


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public long getValue()
```

<a id="m-valueof-82e4f8f2d821"></a>
### valueOf(long)

```java
public static com.tailf.notif.NotificationType valueOf(long i)
```

Types: [NotificationType](NotificationType.md#cls-NotificationType)

**Parameters**

- `long i`

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.notif.NotificationType valueOf(String name)
```

Types: [NotificationType](NotificationType.md#cls-NotificationType)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.notif.NotificationType[] values()
```

Types: [NotificationType](NotificationType.md#cls-NotificationType)
