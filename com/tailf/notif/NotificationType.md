# NotificationType <a href="#notificationtype-1f10f57e184d" id="notificationtype-1f10f57e184d"></a>

```java
public enum com.tailf.notif.NotificationType
```

Types: [NotificationType](NotificationType.md#notificationtype-1f10f57e184d)

Enum describing the different notification types available.

## Members

**Enum Constants**:

- [NOTIF_AUDIT](#notif_audit-6f0218ecc8bf)
- [NOTIF_AUDIT_NETWORK](#notif_audit_network-ca4c25b853f0)
- [NOTIF_AUDIT_NETWORK_SYNC](#notif_audit_network_sync-0ea10c1c0b1b)
- [NOTIF_AUDIT_SYNC](#notif_audit_sync-17bfefc0883b)
- [NOTIF_CALL_HOME_INFO](#notif_call_home_info-23574ca1ae62)
- [NOTIF_COMMIT_DIFF](#notif_commit_diff-6c2f08680904)
- [NOTIF_COMMIT_FAILED](#notif_commit_failed-912625bd5699)
- [NOTIF_COMMIT_PROGRESS](#notif_commit_progress-333a6e755b44)
- [NOTIF_COMMIT_SIMPLE](#notif_commit_simple-77385244eeaf)
- [NOTIF_COMPACTION](#notif_compaction-3c759579b08c)
- [NOTIF_CONFIRMED_COMMIT](#notif_confirmed_commit-160051a03cfb)
- [NOTIF_CQ_PROGRESS](#notif_cq_progress-426acfb71dd0)
- [NOTIF_DAEMON](#notif_daemon-303df64b33ae)
- [NOTIF_DEVEL](#notif_devel-a219d7049a8d)
- [NOTIF_FORWARD_INFO](#notif_forward_info-a10cdcdae573)
- [NOTIF_HA_INFO](#notif_ha_info-9b20b0deabc8)
- [NOTIF_HA_INFO_SYNC](#notif_ha_info_sync-11c7d32ea4f1)
- [NOTIF_HEALTH_CHECK](#notif_health_check-16b040e322ff)
- [NOTIF_HEARTBEAT](#notif_heartbeat-a901d424d5e9)
- [NOTIF_JSONRPC](#notif_jsonrpc-4be7873f995c)
- [NOTIF_NETCONF](#notif_netconf-81b47b039ce6)
- [NOTIF_PACKAGE_RELOAD](#notif_package_reload-4fb5bbfdf8b6)
- [NOTIF_PROGRESS](#notif_progress-824025559a0d)
- [NOTIF_REOPEN_LOGS](#notif_reopen_logs-95839edbabbb)
- [NOTIF_RESTCONF](#notif_restconf-acb8462af7cf)
- [NOTIF_SNMPA](#notif_snmpa-064b11a46034)
- [NOTIF_STREAM_EVENT](#notif_stream_event-32431368050e)
- [NOTIF_SUBAGENT_INFO](#notif_subagent_info-17dacb38b7c2)
- [NOTIF_SYSTEM_GOING_DOWN](#notif_system_going_down-6a8f118871f8)
- [NOTIF_TAKEOVER_SYSLOG](#notif_takeover_syslog-02a246c5f2ea)
- [NOTIF_UPGRADE_EVENT](#notif_upgrade_event-1aad3a285721)
- [NOTIF_USER_SESSION](#notif_user_session-425b13eae42a)
- [NOTIF_WEBUI](#notif_webui-ad3e3f6d8a19)

**Methods**:

- [getValue()](#getvalue-d93864668c40)
- [valueOf(long)](#valueof-82e4f8f2d821)
- [valueOf(String)](#valueof-ac61b3547613)
- [values()](#values-406dfe3ca270)

## Enum Constants

### NOTIF_AUDIT <a href="#notif_audit-6f0218ecc8bf" id="notif_audit-6f0218ecc8bf"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_AUDIT;
```

Flag in eventmask requests ConfD to send audit log events.

### NOTIF_AUDIT_NETWORK <a href="#notif_audit_network-ca4c25b853f0" id="notif_audit_network-ca4c25b853f0"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_AUDIT_NETWORK;
```

Flag in eventmask requests NCS to send audit network events

### NOTIF_AUDIT_NETWORK_SYNC <a href="#notif_audit_network_sync-0ea10c1c0b1b" id="notif_audit_network_sync-0ea10c1c0b1b"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_AUDIT_NETWORK_SYNC;
```

Flag in eventmask which is used in combination with the
  NOTIF_AUDIT_NETWORK flag and then implies that the method
  `Notif#syncAuditNetworkNotification(int usid)`
  must be called for each notification or else the user session
  will hang indefinitely

### NOTIF_AUDIT_SYNC <a href="#notif_audit_sync-17bfefc0883b" id="notif_audit_sync-17bfefc0883b"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_AUDIT_SYNC;
```

Flag in eventmask which is used in combination with the
  NOTIF_AUDIT flag and then implies that the method
  `Notif#syncAuditNotification(int usid)`
  must be called for each notification or else the user session
  will hang indefinitely

### NOTIF_CALL_HOME_INFO <a href="#notif_call_home_info-23574ca1ae62" id="notif_call_home_info-23574ca1ae62"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_CALL_HOME_INFO;
```

Flag in eventmask requests NCS to send events for NETCONF Call Home
 connections.

### NOTIF_COMMIT_DIFF <a href="#notif_commit_diff-6c2f08680904" id="notif_commit_diff-6c2f08680904"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_COMMIT_DIFF;
```

Flag in eventmask requests ConfD to send commit diff events.

### NOTIF_COMMIT_FAILED <a href="#notif_commit_failed-912625bd5699" id="notif_commit_failed-912625bd5699"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_COMMIT_FAILED;
```

Flag in eventmask requests ConfD to send commit failed events.

### NOTIF_COMMIT_PROGRESS <a href="#notif_commit_progress-333a6e755b44" id="notif_commit_progress-333a6e755b44"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_COMMIT_PROGRESS;
```

Flag in eventmask requests ConfD to send commit progress events.

### NOTIF_COMMIT_SIMPLE <a href="#notif_commit_simple-77385244eeaf" id="notif_commit_simple-77385244eeaf"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_COMMIT_SIMPLE;
```

Flag in eventmask requests ConfD to send commit events.

### NOTIF_COMPACTION <a href="#notif_compaction-3c759579b08c" id="notif_compaction-3c759579b08c"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_COMPACTION;
```

Flag in eventmask requests NCS to send compaction events

### NOTIF_CONFIRMED_COMMIT <a href="#notif_confirmed_commit-160051a03cfb" id="notif_confirmed_commit-160051a03cfb"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_CONFIRMED_COMMIT;
```

Flag in eventmask requests ConfD to send confirmed commit events.

### NOTIF_CQ_PROGRESS <a href="#notif_cq_progress-426acfb71dd0" id="notif_cq_progress-426acfb71dd0"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_CQ_PROGRESS;
```

Flag in eventmask requests NCS to send event for the ncs commit queue
 item lifecycle
 reload has completed

### NOTIF_DAEMON <a href="#notif_daemon-303df64b33ae" id="notif_daemon-303df64b33ae"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_DAEMON;
```

Flag in eventmask requests ConfD to send syslog events.

### NOTIF_DEVEL <a href="#notif_devel-a219d7049a8d" id="notif_devel-a219d7049a8d"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_DEVEL;
```

Flag in eventmask requests ConfD to send devel events.

### NOTIF_FORWARD_INFO <a href="#notif_forward_info-a10cdcdae573" id="notif_forward_info-a10cdcdae573"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_FORWARD_INFO;
```

Flag in eventmask requests ConfD to send forward info events.

### NOTIF_HA_INFO <a href="#notif_ha_info-9b20b0deabc8" id="notif_ha_info-9b20b0deabc8"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_HA_INFO;
```

Flag in eventmask requests ConfD to send HA (high availability) info
 events.

### NOTIF_HA_INFO_SYNC <a href="#notif_ha_info_sync-11c7d32ea4f1" id="notif_ha_info_sync-11c7d32ea4f1"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_HA_INFO_SYNC;
```

Flag in eventmask requests ConfD events related to changes of the
  current cluster configuration

### NOTIF_HEALTH_CHECK <a href="#notif_health_check-16b040e322ff" id="notif_health_check-16b040e322ff"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_HEALTH_CHECK;
```

Flag in eventmask requests ConfD to send health check events.

### NOTIF_HEARTBEAT <a href="#notif_heartbeat-a901d424d5e9" id="notif_heartbeat-a901d424d5e9"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_HEARTBEAT;
```

Flag in eventmask requests ConfD to send heartbeat events.

### NOTIF_JSONRPC <a href="#notif_jsonrpc-4be7873f995c" id="notif_jsonrpc-4be7873f995c"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_JSONRPC;
```

Flag in eventmask requests ConfD to send jsonrpc events.

### NOTIF_NETCONF <a href="#notif_netconf-81b47b039ce6" id="notif_netconf-81b47b039ce6"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_NETCONF;
```

Flag in eventmask requests ConfD to send netconf events.

### NOTIF_PACKAGE_RELOAD <a href="#notif_package_reload-4fb5bbfdf8b6" id="notif_package_reload-4fb5bbfdf8b6"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_PACKAGE_RELOAD;
```

Flag in eventmask requests NCS to send event when a package
  reload has completed

### NOTIF_PROGRESS <a href="#notif_progress-824025559a0d" id="notif_progress-824025559a0d"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_PROGRESS;
```

Flag in eventmask requests ConfD to send progress events of
 the commit of a transaction or an action being applied.

### NOTIF_REOPEN_LOGS <a href="#notif_reopen_logs-95839edbabbb" id="notif_reopen_logs-95839edbabbb"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_REOPEN_LOGS;
```

Flag in eventmask requests ConfD/NCS to send an event when it will
  close and reopen its log files

### NOTIF_RESTCONF <a href="#notif_restconf-acb8462af7cf" id="notif_restconf-acb8462af7cf"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_RESTCONF;
```

Flag in eventmask requests ConfD to send RESTCONF log events

### NOTIF_SNMPA <a href="#notif_snmpa-064b11a46034" id="notif_snmpa-064b11a46034"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_SNMPA;
```

Flag in eventmask requests ConfD to send snmpa events.

### NOTIF_STREAM_EVENT <a href="#notif_stream_event-32431368050e" id="notif_stream_event-32431368050e"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_STREAM_EVENT;
```

Flag in eventmask requests ConfD to send event
  for a notification stream

### NOTIF_SUBAGENT_INFO <a href="#notif_subagent_info-17dacb38b7c2" id="notif_subagent_info-17dacb38b7c2"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_SUBAGENT_INFO;
```

Flag in eventmask requests ConfD to send subagent info events.

### NOTIF_SYSTEM_GOING_DOWN <a href="#notif_system_going_down-6a8f118871f8" id="notif_system_going_down-6a8f118871f8"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_SYSTEM_GOING_DOWN;
```

Flag in eventmask requests ConfD to send system going down events

### NOTIF_TAKEOVER_SYSLOG <a href="#notif_takeover_syslog-02a246c5f2ea" id="notif_takeover_syslog-02a246c5f2ea"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_TAKEOVER_SYSLOG;
```

Flag in eventmask requests ConfD to send syslog takeover events.

### NOTIF_UPGRADE_EVENT <a href="#notif_upgrade_event-1aad3a285721" id="notif_upgrade_event-1aad3a285721"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_UPGRADE_EVENT;
```

Flag in eventmask requests ConfD to send upgrade info events.

### NOTIF_USER_SESSION <a href="#notif_user_session-425b13eae42a" id="notif_user_session-425b13eae42a"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_USER_SESSION;
```

Flag in eventmask requests ConfD to send user session events.

### NOTIF_WEBUI <a href="#notif_webui-ad3e3f6d8a19" id="notif_webui-ad3e3f6d8a19"></a>

```java
public static final com.tailf.notif.NotificationType NOTIF_WEBUI;
```

Flag in eventmask requests ConfD to send webui events.


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public long getValue()
```

### valueOf(long) <a href="#valueof-82e4f8f2d821" id="valueof-82e4f8f2d821"></a>

```java
public static com.tailf.notif.NotificationType valueOf(long i)
```

Types: [NotificationType](NotificationType.md#notificationtype-1f10f57e184d)

**Parameters**

- `long i`

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.notif.NotificationType valueOf(String name)
```

Types: [NotificationType](NotificationType.md#notificationtype-1f10f57e184d)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.notif.NotificationType[] values()
```

Types: [NotificationType](NotificationType.md#notificationtype-1f10f57e184d)
