# CommitFailedNotification <a href="#cls-CommitFailedNotification" id="cls-CommitFailedNotification"></a>

```java
public class com.tailf.notif.CommitFailedNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for failing commit notifications.

## Members

**Constructors**:

- [CommitFailedNotification(int, int, DpUserInfo, String, InetAddress, ConfObject, int)](#m-CommitFailedNotification-83e5ff60e780)

**Fields**:

- [DATABASE_CANDIDATE](#m-DATABASE_CANDIDATE)
- [DATABASE_NO_DB](#m-DATABASE_NO_DB)
- [DATABASE_RUNNING](#m-DATABASE_RUNNING)
- [DATABASE_STARTUP](#m-DATABASE_STARTUP)
- [DP_CDB](#m-DP_CDB)
- [DP_EXTERNAL](#m-DP_EXTERNAL)
- [DP_JAVASCRIPT](#m-DP_JAVASCRIPT)
- [DP_NETCONF](#m-DP_NETCONF)
- [DP_SNMPGW](#m-DP_SNMPGW)
- [type](Notification.md#m-type) from Notification

**Methods**:

- [getDaemonName()](#m-getDaemonName-ad12d8093443)
- [getDataProvider()](#m-getDataProvider-9e4cec2ec805)
- [getDBName()](#m-getDBName-65ff0bdb2339)
- [getIP()](#m-getIP-c2f1d3db411f)
- [getIPValue()](#m-getIPValue-7154021b2d96)
- [getNotificationType()](Notification.md#m-getNotificationType-f0e32b7b644f) from Notification
- [getPort()](#m-getPort-a2225f868a2b)
- [getUserInfo()](#m-getUserInfo-3ecef1f24d3d)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### CommitFailedNotification(int, int, DpUserInfo, String, InetAddress, ConfObject, int) <a href="#m-CommitFailedNotification-83e5ff60e780" id="m-CommitFailedNotification-83e5ff60e780"></a>

```java
public CommitFailedNotification(
    int dataProvider,
    int dbName,
    com.tailf.dp.DpUserInfo uinfo,
    String daemonName,
    java.net.InetAddress ip,
    com.tailf.conf.ConfObject ipValue,
    int port
)
```

Types: [DpUserInfo](../dp/DpUserInfo.md#cls-DpUserInfo), [ConfObject](../conf/ConfObject.md#cls-ConfObject)

**Parameters**

- `int dataProvider`
- `int dbName`
- `com.tailf.dp.DpUserInfo uinfo`
- `String daemonName`
- `java.net.InetAddress ip`
- `com.tailf.conf.ConfObject ipValue`
- `int port`


## Fields

### DATABASE_CANDIDATE <a href="#m-DATABASE_CANDIDATE" id="m-DATABASE_CANDIDATE"></a>

```java
public static final int DATABASE_CANDIDATE = 1;
```

### DATABASE_NO_DB <a href="#m-DATABASE_NO_DB" id="m-DATABASE_NO_DB"></a>

```java
public static final int DATABASE_NO_DB = 0;
```

### DATABASE_RUNNING <a href="#m-DATABASE_RUNNING" id="m-DATABASE_RUNNING"></a>

```java
public static final int DATABASE_RUNNING = 2;
```

### DATABASE_STARTUP <a href="#m-DATABASE_STARTUP" id="m-DATABASE_STARTUP"></a>

```java
public static final int DATABASE_STARTUP = 3;
```

### DP_CDB <a href="#m-DP_CDB" id="m-DP_CDB"></a>

```java
public static final int DP_CDB = 1;
```

### DP_EXTERNAL <a href="#m-DP_EXTERNAL" id="m-DP_EXTERNAL"></a>

```java
public static final int DP_EXTERNAL = 3;
```

### DP_JAVASCRIPT <a href="#m-DP_JAVASCRIPT" id="m-DP_JAVASCRIPT"></a>

```java
public static final int DP_JAVASCRIPT = 5;
```

### DP_NETCONF <a href="#m-DP_NETCONF" id="m-DP_NETCONF"></a>

```java
public static final int DP_NETCONF = 2;
```

### DP_SNMPGW <a href="#m-DP_SNMPGW" id="m-DP_SNMPGW"></a>

```java
public static final int DP_SNMPGW = 4;
```


## Methods

### getDaemonName() <a href="#m-getDaemonName-ad12d8093443" id="m-getDaemonName-ad12d8093443"></a>

```java
public String getDaemonName()
```

### getDataProvider() <a href="#m-getDataProvider-9e4cec2ec805" id="m-getDataProvider-9e4cec2ec805"></a>

```java
public int getDataProvider()
```

forward event type:


- [`DP_CDB`](CommitFailedNotification.md#m-DP_CDB)
   - [`DP_NETCONF`](CommitFailedNotification.md#m-DP_NETCONF)
     - [`DP_EXTERNAL`](CommitFailedNotification.md#m-DP_EXTERNAL)
       - [`DP_SNMPGW`](CommitFailedNotification.md#m-DP_SNMPGW)
         - [`DP_JAVASCRIPT`](CommitFailedNotification.md#m-DP_JAVASCRIPT)

### getDBName() <a href="#m-getDBName-65ff0bdb2339" id="m-getDBName-65ff0bdb2339"></a>

```java
public int getDBName()
```

target name in confd.conf

### getIP() <a href="#m-getIP-c2f1d3db411f" id="m-getIP-c2f1d3db411f"></a>

```java
public java.net.InetAddress getIP()
```

### getIPValue() <a href="#m-getIPValue-7154021b2d96" id="m-getIPValue-7154021b2d96"></a>

```java
public com.tailf.conf.ConfObject getIPValue()
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

### getPort() <a href="#m-getPort-a2225f868a2b" id="m-getPort-a2225f868a2b"></a>

```java
public int getPort()
```

### getUserInfo() <a href="#m-getUserInfo-3ecef1f24d3d" id="m-getUserInfo-3ecef1f24d3d"></a>

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](../dp/DpUserInfo.md#cls-DpUserInfo)

User information

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
