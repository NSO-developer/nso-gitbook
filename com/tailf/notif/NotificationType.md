# NotificationType <a href="#notificationtype-1f10f57e184d" id="notificationtype-1f10f57e184d"></a>

```java
public enum com.tailf.notif.NotificationType
```

Enum describing the different notification types available.

## Members

**Enum Constants**:

- [NOTIF\_AUDIT](#notif_audit-6f0218ecc8bf)
- [NOTIF\_AUDIT\_NETWORK](#notif_audit_network-ca4c25b853f0)
- [NOTIF\_AUDIT\_NETWORK\_SYNC](#notif_audit_network_sync-0ea10c1c0b1b)
- [NOTIF\_AUDIT\_SYNC](#notif_audit_sync-17bfefc0883b)
- [NOTIF\_CALL\_HOME\_INFO](#notif_call_home_info-23574ca1ae62)
- [NOTIF\_COMMIT\_DIFF](#notif_commit_diff-6c2f08680904)
- [NOTIF\_COMMIT\_FAILED](#notif_commit_failed-912625bd5699)
- [NOTIF\_COMMIT\_PROGRESS](#notif_commit_progress-333a6e755b44)
- [NOTIF\_COMMIT\_SIMPLE](#notif_commit_simple-77385244eeaf)
- [NOTIF\_COMPACTION](#notif_compaction-3c759579b08c)
- [NOTIF\_CONFIRMED\_COMMIT](#notif_confirmed_commit-160051a03cfb)
- [NOTIF\_CQ\_PROGRESS](#notif_cq_progress-426acfb71dd0)
- [NOTIF\_DAEMON](#notif_daemon-303df64b33ae)
- [NOTIF\_DEVEL](#notif_devel-a219d7049a8d)
- [NOTIF\_FORWARD\_INFO](#notif_forward_info-a10cdcdae573)
- [NOTIF\_HA\_INFO](#notif_ha_info-9b20b0deabc8)
- [NOTIF\_HA\_INFO\_SYNC](#notif_ha_info_sync-11c7d32ea4f1)
- [NOTIF\_HEALTH\_CHECK](#notif_health_check-16b040e322ff)
- [NOTIF\_HEARTBEAT](#notif_heartbeat-a901d424d5e9)
- [NOTIF\_JSONRPC](#notif_jsonrpc-4be7873f995c)
- [NOTIF\_NETCONF](#notif_netconf-81b47b039ce6)
- [NOTIF\_PACKAGE\_RELOAD](#notif_package_reload-4fb5bbfdf8b6)
- [NOTIF\_PROGRESS](#notif_progress-824025559a0d)
- [NOTIF\_REOPEN\_LOGS](#notif_reopen_logs-95839edbabbb)
- [NOTIF\_RESTCONF](#notif_restconf-acb8462af7cf)
- [NOTIF\_SNMPA](#notif_snmpa-064b11a46034)
- [NOTIF\_STREAM\_EVENT](#notif_stream_event-32431368050e)
- [NOTIF\_SUBAGENT\_INFO](#notif_subagent_info-17dacb38b7c2)
- [NOTIF\_SYSTEM\_GOING\_DOWN](#notif_system_going_down-6a8f118871f8)
- [NOTIF\_TAKEOVER\_SYSLOG](#notif_takeover_syslog-02a246c5f2ea)
- [NOTIF\_UPGRADE\_EVENT](#notif_upgrade_event-1aad3a285721)
- [NOTIF\_USER\_SESSION](#notif_user_session-425b13eae42a)
- [NOTIF\_WEBUI](#notif_webui-ad3e3f6d8a19)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(long\)](#valueof-82e4f8f2d821)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### NOTIF_AUDIT <a href="#notif_audit-6f0218ecc8bf" id="notif_audit-6f0218ecc8bf"></a>

```java
NOTIF_AUDIT(1L << 0);
```

Flag in eventmask requests ConfD to send audit log events.

### NOTIF_AUDIT_NETWORK <a href="#notif_audit_network-ca4c25b853f0" id="notif_audit_network-ca4c25b853f0"></a>

```java
NOTIF_AUDIT_NETWORK(1L << 28);
```

Flag in eventmask requests NCS to send audit network events

### NOTIF_AUDIT_NETWORK_SYNC <a href="#notif_audit_network_sync-0ea10c1c0b1b" id="notif_audit_network_sync-0ea10c1c0b1b"></a>

```java
NOTIF_AUDIT_NETWORK_SYNC(1L << 29);
```

Flag in eventmask which is used in combination with the
  NOTIF_AUDIT_NETWORK flag and then implies that the method
  `Notif#syncAuditNetworkNotification(int usid)`
  must be called for each notification or else the user session
  will hang indefinitely

### NOTIF_AUDIT_SYNC <a href="#notif_audit_sync-17bfefc0883b" id="notif_audit_sync-17bfefc0883b"></a>

```java
NOTIF_AUDIT_SYNC(1L << 17);
```

Flag in eventmask which is used in combination with the
  NOTIF_AUDIT flag and then implies that the method
  `Notif#syncAuditNotification(int usid)`
  must be called for each notification or else the user session
  will hang indefinitely

### NOTIF_CALL_HOME_INFO <a href="#notif_call_home_info-23574ca1ae62" id="notif_call_home_info-23574ca1ae62"></a>

```java
NOTIF_CALL_HOME_INFO(1L << 25);
```

Flag in eventmask requests NCS to send events for NETCONF Call Home
 connections.

### NOTIF_COMMIT_DIFF <a href="#notif_commit_diff-6c2f08680904" id="notif_commit_diff-6c2f08680904"></a>

```java
NOTIF_COMMIT_DIFF(1L << 4);
```

Flag in eventmask requests ConfD to send commit diff events.

### NOTIF_COMMIT_FAILED <a href="#notif_commit_failed-912625bd5699" id="notif_commit_failed-912625bd5699"></a>

```java
NOTIF_COMMIT_FAILED(1L << 8);
```

Flag in eventmask requests ConfD to send commit failed events.

### NOTIF_COMMIT_PROGRESS <a href="#notif_commit_progress-333a6e755b44" id="notif_commit_progress-333a6e755b44"></a>

```java
NOTIF_COMMIT_PROGRESS(1L << 16);
```

Flag in eventmask requests ConfD to send commit progress events.

### NOTIF_COMMIT_SIMPLE <a href="#notif_commit_simple-77385244eeaf" id="notif_commit_simple-77385244eeaf"></a>

```java
NOTIF_COMMIT_SIMPLE(1L << 3);
```

Flag in eventmask requests ConfD to send commit events.

### NOTIF_COMPACTION <a href="#notif_compaction-3c759579b08c" id="notif_compaction-3c759579b08c"></a>

```java
NOTIF_COMPACTION(1L << 30);
```

Flag in eventmask requests NCS to send compaction events

### NOTIF_CONFIRMED_COMMIT <a href="#notif_confirmed_commit-160051a03cfb" id="notif_confirmed_commit-160051a03cfb"></a>

```java
NOTIF_CONFIRMED_COMMIT(1L << 14);
```

Flag in eventmask requests ConfD to send confirmed commit events.

### NOTIF_CQ_PROGRESS <a href="#notif_cq_progress-426acfb71dd0" id="notif_cq_progress-426acfb71dd0"></a>

```java
NOTIF_CQ_PROGRESS(1L << 22);
```

Flag in eventmask requests NCS to send event for the ncs commit queue
 item lifecycle
 reload has completed

### NOTIF_DAEMON <a href="#notif_daemon-303df64b33ae" id="notif_daemon-303df64b33ae"></a>

```java
NOTIF_DAEMON(1 << 1);
```

Flag in eventmask requests ConfD to send syslog events.

### NOTIF_DEVEL <a href="#notif_devel-a219d7049a8d" id="notif_devel-a219d7049a8d"></a>

```java
NOTIF_DEVEL(1L << 12);
```

Flag in eventmask requests ConfD to send devel events.

### NOTIF_FORWARD_INFO <a href="#notif_forward_info-a10cdcdae573" id="notif_forward_info-a10cdcdae573"></a>

```java
NOTIF_FORWARD_INFO(1L << 10);
```

Flag in eventmask requests ConfD to send forward info events.

### NOTIF_HA_INFO <a href="#notif_ha_info-9b20b0deabc8" id="notif_ha_info-9b20b0deabc8"></a>

```java
NOTIF_HA_INFO(1L << 6);
```

Flag in eventmask requests ConfD to send HA (high availability) info
 events.

### NOTIF_HA_INFO_SYNC <a href="#notif_ha_info_sync-11c7d32ea4f1" id="notif_ha_info_sync-11c7d32ea4f1"></a>

```java
NOTIF_HA_INFO_SYNC(1L << 20);
```

Flag in eventmask requests ConfD events related to changes of the
  current cluster configuration

### NOTIF_HEALTH_CHECK <a href="#notif_health_check-16b040e322ff" id="notif_health_check-16b040e322ff"></a>

```java
NOTIF_HEALTH_CHECK(1L << 18);
```

Flag in eventmask requests ConfD to send health check events.

### NOTIF_HEARTBEAT <a href="#notif_heartbeat-a901d424d5e9" id="notif_heartbeat-a901d424d5e9"></a>

```java
NOTIF_HEARTBEAT(1L << 13);
```

Flag in eventmask requests ConfD to send heartbeat events.

### NOTIF_JSONRPC <a href="#notif_jsonrpc-4be7873f995c" id="notif_jsonrpc-4be7873f995c"></a>

```java
NOTIF_JSONRPC(1L << 26);
```

Flag in eventmask requests ConfD to send jsonrpc events.

### NOTIF_NETCONF <a href="#notif_netconf-81b47b039ce6" id="notif_netconf-81b47b039ce6"></a>

```java
NOTIF_NETCONF(1L << 11);
```

Flag in eventmask requests ConfD to send netconf events.

### NOTIF_PACKAGE_RELOAD <a href="#notif_package_reload-4fb5bbfdf8b6" id="notif_package_reload-4fb5bbfdf8b6"></a>

```java
NOTIF_PACKAGE_RELOAD(1L << 21);
```

Flag in eventmask requests NCS to send event when a package
  reload has completed

### NOTIF_PROGRESS <a href="#notif_progress-824025559a0d" id="notif_progress-824025559a0d"></a>

```java
NOTIF_PROGRESS(1L << 24);
```

Flag in eventmask requests ConfD to send progress events of
 the commit of a transaction or an action being applied.

### NOTIF_REOPEN_LOGS <a href="#notif_reopen_logs-95839edbabbb" id="notif_reopen_logs-95839edbabbb"></a>

```java
NOTIF_REOPEN_LOGS(1L << 23);
```

Flag in eventmask requests ConfD/NCS to send an event when it will
  close and reopen its log files

### NOTIF_RESTCONF <a href="#notif_restconf-acb8462af7cf" id="notif_restconf-acb8462af7cf"></a>

```java
NOTIF_RESTCONF(1L << 32);
```

Flag in eventmask requests ConfD to send RESTCONF log events

### NOTIF_SNMPA <a href="#notif_snmpa-064b11a46034" id="notif_snmpa-064b11a46034"></a>

```java
NOTIF_SNMPA(1L << 9);
```

Flag in eventmask requests ConfD to send snmpa events.

### NOTIF_STREAM_EVENT <a href="#notif_stream_event-32431368050e" id="notif_stream_event-32431368050e"></a>

```java
NOTIF_STREAM_EVENT(1L << 19);
```

Flag in eventmask requests ConfD to send event
  for a notification stream

### NOTIF_SUBAGENT_INFO <a href="#notif_subagent_info-17dacb38b7c2" id="notif_subagent_info-17dacb38b7c2"></a>

```java
NOTIF_SUBAGENT_INFO(1L << 7);
```

Flag in eventmask requests ConfD to send subagent info events.

### NOTIF_SYSTEM_GOING_DOWN <a href="#notif_system_going_down-6a8f118871f8" id="notif_system_going_down-6a8f118871f8"></a>

```java
NOTIF_SYSTEM_GOING_DOWN(1L << 31);
```

Flag in eventmask requests ConfD to send system going down events

### NOTIF_TAKEOVER_SYSLOG <a href="#notif_takeover_syslog-02a246c5f2ea" id="notif_takeover_syslog-02a246c5f2ea"></a>

```java
NOTIF_TAKEOVER_SYSLOG(1L << 2);
```

Flag in eventmask requests ConfD to send syslog takeover events.

### NOTIF_UPGRADE_EVENT <a href="#notif_upgrade_event-1aad3a285721" id="notif_upgrade_event-1aad3a285721"></a>

```java
NOTIF_UPGRADE_EVENT(1L << 15);
```

Flag in eventmask requests ConfD to send upgrade info events.

### NOTIF_USER_SESSION <a href="#notif_user_session-425b13eae42a" id="notif_user_session-425b13eae42a"></a>

```java
NOTIF_USER_SESSION(1L << 5);
```

Flag in eventmask requests ConfD to send user session events.

### NOTIF_WEBUI <a href="#notif_webui-ad3e3f6d8a19" id="notif_webui-ad3e3f6d8a19"></a>

```java
NOTIF_WEBUI(1L << 27);
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
