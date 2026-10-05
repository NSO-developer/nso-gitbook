# NotificationType <a href="#cls-NotificationType" id="cls-NotificationType"></a>

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

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(long)](#m-valueOf-82e4f8f2d821)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### NOTIF_AUDIT <a href="#m-NOTIF_AUDIT" id="m-NOTIF_AUDIT"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_AUDIT;
```

Flag in eventmask requests ConfD to send audit log events.

### NOTIF_AUDIT_NETWORK <a href="#m-NOTIF_AUDIT_NETWORK" id="m-NOTIF_AUDIT_NETWORK"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_AUDIT_NETWORK;
```

Flag in eventmask requests NCS to send audit network events

### NOTIF_AUDIT_NETWORK_SYNC <a href="#m-NOTIF_AUDIT_NETWORK_SYNC" id="m-NOTIF_AUDIT_NETWORK_SYNC"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_AUDIT_NETWORK_SYNC;
```

Flag in eventmask which is used in combination with the
  NOTIF_AUDIT_NETWORK flag and then implies that the method
  `Notif#syncAuditNetworkNotification(int usid)`
  must be called for each notification or else the user session
  will hang indefinitely

### NOTIF_AUDIT_SYNC <a href="#m-NOTIF_AUDIT_SYNC" id="m-NOTIF_AUDIT_SYNC"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_AUDIT_SYNC;
```

Flag in eventmask which is used in combination with the
  NOTIF_AUDIT flag and then implies that the method
  `Notif#syncAuditNotification(int usid)`
  must be called for each notification or else the user session
  will hang indefinitely

### NOTIF_CALL_HOME_INFO <a href="#m-NOTIF_CALL_HOME_INFO" id="m-NOTIF_CALL_HOME_INFO"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_CALL_HOME_INFO;
```

Flag in eventmask requests NCS to send events for NETCONF Call Home
 connections.

### NOTIF_COMMIT_DIFF <a href="#m-NOTIF_COMMIT_DIFF" id="m-NOTIF_COMMIT_DIFF"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_COMMIT_DIFF;
```

Flag in eventmask requests ConfD to send commit diff events.

### NOTIF_COMMIT_FAILED <a href="#m-NOTIF_COMMIT_FAILED" id="m-NOTIF_COMMIT_FAILED"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_COMMIT_FAILED;
```

Flag in eventmask requests ConfD to send commit failed events.

### NOTIF_COMMIT_PROGRESS <a href="#m-NOTIF_COMMIT_PROGRESS" id="m-NOTIF_COMMIT_PROGRESS"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_COMMIT_PROGRESS;
```

Flag in eventmask requests ConfD to send commit progress events.

### NOTIF_COMMIT_SIMPLE <a href="#m-NOTIF_COMMIT_SIMPLE" id="m-NOTIF_COMMIT_SIMPLE"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_COMMIT_SIMPLE;
```

Flag in eventmask requests ConfD to send commit events.

### NOTIF_COMPACTION <a href="#m-NOTIF_COMPACTION" id="m-NOTIF_COMPACTION"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_COMPACTION;
```

Flag in eventmask requests NCS to send compaction events

### NOTIF_CONFIRMED_COMMIT <a href="#m-NOTIF_CONFIRMED_COMMIT" id="m-NOTIF_CONFIRMED_COMMIT"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_CONFIRMED_COMMIT;
```

Flag in eventmask requests ConfD to send confirmed commit events.

### NOTIF_CQ_PROGRESS <a href="#m-NOTIF_CQ_PROGRESS" id="m-NOTIF_CQ_PROGRESS"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_CQ_PROGRESS;
```

Flag in eventmask requests NCS to send event for the ncs commit queue
 item lifecycle
 reload has completed

### NOTIF_DAEMON <a href="#m-NOTIF_DAEMON" id="m-NOTIF_DAEMON"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_DAEMON;
```

Flag in eventmask requests ConfD to send syslog events.

### NOTIF_DEVEL <a href="#m-NOTIF_DEVEL" id="m-NOTIF_DEVEL"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_DEVEL;
```

Flag in eventmask requests ConfD to send devel events.

### NOTIF_FORWARD_INFO <a href="#m-NOTIF_FORWARD_INFO" id="m-NOTIF_FORWARD_INFO"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_FORWARD_INFO;
```

Flag in eventmask requests ConfD to send forward info events.

### NOTIF_HA_INFO <a href="#m-NOTIF_HA_INFO" id="m-NOTIF_HA_INFO"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_HA_INFO;
```

Flag in eventmask requests ConfD to send HA (high availability) info
 events.

### NOTIF_HA_INFO_SYNC <a href="#m-NOTIF_HA_INFO_SYNC" id="m-NOTIF_HA_INFO_SYNC"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_HA_INFO_SYNC;
```

Flag in eventmask requests ConfD events related to changes of the
  current cluster configuration

### NOTIF_HEALTH_CHECK <a href="#m-NOTIF_HEALTH_CHECK" id="m-NOTIF_HEALTH_CHECK"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_HEALTH_CHECK;
```

Flag in eventmask requests ConfD to send health check events.

### NOTIF_HEARTBEAT <a href="#m-NOTIF_HEARTBEAT" id="m-NOTIF_HEARTBEAT"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_HEARTBEAT;
```

Flag in eventmask requests ConfD to send heartbeat events.

### NOTIF_JSONRPC <a href="#m-NOTIF_JSONRPC" id="m-NOTIF_JSONRPC"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_JSONRPC;
```

Flag in eventmask requests ConfD to send jsonrpc events.

### NOTIF_NETCONF <a href="#m-NOTIF_NETCONF" id="m-NOTIF_NETCONF"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_NETCONF;
```

Flag in eventmask requests ConfD to send netconf events.

### NOTIF_PACKAGE_RELOAD <a href="#m-NOTIF_PACKAGE_RELOAD" id="m-NOTIF_PACKAGE_RELOAD"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_PACKAGE_RELOAD;
```

Flag in eventmask requests NCS to send event when a package
  reload has completed

### NOTIF_PROGRESS <a href="#m-NOTIF_PROGRESS" id="m-NOTIF_PROGRESS"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_PROGRESS;
```

Flag in eventmask requests ConfD to send progress events of
 the commit of a transaction or an action being applied.

### NOTIF_REOPEN_LOGS <a href="#m-NOTIF_REOPEN_LOGS" id="m-NOTIF_REOPEN_LOGS"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_REOPEN_LOGS;
```

Flag in eventmask requests ConfD/NCS to send an event when it will
  close and reopen its log files

### NOTIF_RESTCONF <a href="#m-NOTIF_RESTCONF" id="m-NOTIF_RESTCONF"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_RESTCONF;
```

Flag in eventmask requests ConfD to send RESTCONF log events

### NOTIF_SNMPA <a href="#m-NOTIF_SNMPA" id="m-NOTIF_SNMPA"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_SNMPA;
```

Flag in eventmask requests ConfD to send snmpa events.

### NOTIF_STREAM_EVENT <a href="#m-NOTIF_STREAM_EVENT" id="m-NOTIF_STREAM_EVENT"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_STREAM_EVENT;
```

Flag in eventmask requests ConfD to send event
  for a notification stream

### NOTIF_SUBAGENT_INFO <a href="#m-NOTIF_SUBAGENT_INFO" id="m-NOTIF_SUBAGENT_INFO"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_SUBAGENT_INFO;
```

Flag in eventmask requests ConfD to send subagent info events.

### NOTIF_SYSTEM_GOING_DOWN <a href="#m-NOTIF_SYSTEM_GOING_DOWN" id="m-NOTIF_SYSTEM_GOING_DOWN"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_SYSTEM_GOING_DOWN;
```

Flag in eventmask requests ConfD to send system going down events

### NOTIF_TAKEOVER_SYSLOG <a href="#m-NOTIF_TAKEOVER_SYSLOG" id="m-NOTIF_TAKEOVER_SYSLOG"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_TAKEOVER_SYSLOG;
```

Flag in eventmask requests ConfD to send syslog takeover events.

### NOTIF_UPGRADE_EVENT <a href="#m-NOTIF_UPGRADE_EVENT" id="m-NOTIF_UPGRADE_EVENT"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_UPGRADE_EVENT;
```

Flag in eventmask requests ConfD to send upgrade info events.

### NOTIF_USER_SESSION <a href="#m-NOTIF_USER_SESSION" id="m-NOTIF_USER_SESSION"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_USER_SESSION;
```

Flag in eventmask requests ConfD to send user session events.

### NOTIF_WEBUI <a href="#m-NOTIF_WEBUI" id="m-NOTIF_WEBUI"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_WEBUI;
```

Flag in eventmask requests ConfD to send webui events.


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public long getValue()
```

### valueOf(long) <a href="#m-valueOf-82e4f8f2d821" id="m-valueOf-82e4f8f2d821"></a>

```java
public static com.tailf.notif.NotificationType valueOf(long i)
```

Types: [NotificationType](NotificationType.md#cls-NotificationType)

**Parameters**

- `long i`

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.notif.NotificationType valueOf(String name)
```

Types: [NotificationType](NotificationType.md#cls-NotificationType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.notif.NotificationType[] values()
```

Types: [NotificationType](NotificationType.md#cls-NotificationType)
