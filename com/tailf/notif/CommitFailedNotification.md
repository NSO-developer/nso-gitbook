# CommitFailedNotification <a href="#commitfailednotification-bef571382961" id="commitfailednotification-bef571382961"></a>

```java
public class com.tailf.notif.CommitFailedNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#notification-b2e7d82d4215)

Data structure for failing commit notifications.

## Members

**Constructors**:

- [CommitFailedNotification(int, int, DpUserInfo, String, InetAddress, ConfObject, int)](#commitfailednotification-83e5ff60e780)

**Fields**:

- [DATABASE_CANDIDATE](#database_candidate-ee8195cef3f3)
- [DATABASE_NO_DB](#database_no_db-1cc64ed340de)
- [DATABASE_RUNNING](#database_running-0d20bbf469d7)
- [DATABASE_STARTUP](#database_startup-8fb31f1f04a2)
- [DP_CDB](#dp_cdb-c81c7c7903c3)
- [DP_EXTERNAL](#dp_external-8c510f8bd5c3)
- [DP_JAVASCRIPT](#dp_javascript-0603146d46a2)
- [DP_NETCONF](#dp_netconf-cbf8cf2a3cba)
- [DP_SNMPGW](#dp_snmpgw-d58125586f4c)
- [type](Notification.md#type-6ebb3673fbb6) from Notification

**Methods**:

- [getDaemonName()](#getdaemonname-ad12d8093443)
- [getDataProvider()](#getdataprovider-9e4cec2ec805)
- [getDBName()](#getdbname-65ff0bdb2339)
- [getIP()](#getip-c2f1d3db411f)
- [getIPValue()](#getipvalue-7154021b2d96)
- [getNotificationType()](Notification.md#getnotificationtype-f0e32b7b644f) from Notification
- [getPort()](#getport-a2225f868a2b)
- [getUserInfo()](#getuserinfo-3ecef1f24d3d)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### CommitFailedNotification(int, int, DpUserInfo, String, InetAddress, ConfObject, int) <a href="#commitfailednotification-83e5ff60e780" id="commitfailednotification-83e5ff60e780"></a>

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

Types: [DpUserInfo](../dp/DpUserInfo.md#dpuserinfo-c59746285a6e), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2)

**Parameters**

- `int dataProvider`
- `int dbName`
- `com.tailf.dp.DpUserInfo uinfo`
- `String daemonName`
- `java.net.InetAddress ip`
- `com.tailf.conf.ConfObject ipValue`
- `int port`


## Fields

### DATABASE_CANDIDATE <a href="#database_candidate-ee8195cef3f3" id="database_candidate-ee8195cef3f3"></a>

```java
public static final int DATABASE_CANDIDATE = 1;
```

### DATABASE_NO_DB <a href="#database_no_db-1cc64ed340de" id="database_no_db-1cc64ed340de"></a>

```java
public static final int DATABASE_NO_DB = 0;
```

### DATABASE_RUNNING <a href="#database_running-0d20bbf469d7" id="database_running-0d20bbf469d7"></a>

```java
public static final int DATABASE_RUNNING = 2;
```

### DATABASE_STARTUP <a href="#database_startup-8fb31f1f04a2" id="database_startup-8fb31f1f04a2"></a>

```java
public static final int DATABASE_STARTUP = 3;
```

### DP_CDB <a href="#dp_cdb-c81c7c7903c3" id="dp_cdb-c81c7c7903c3"></a>

```java
public static final int DP_CDB = 1;
```

### DP_EXTERNAL <a href="#dp_external-8c510f8bd5c3" id="dp_external-8c510f8bd5c3"></a>

```java
public static final int DP_EXTERNAL = 3;
```

### DP_JAVASCRIPT <a href="#dp_javascript-0603146d46a2" id="dp_javascript-0603146d46a2"></a>

```java
public static final int DP_JAVASCRIPT = 5;
```

### DP_NETCONF <a href="#dp_netconf-cbf8cf2a3cba" id="dp_netconf-cbf8cf2a3cba"></a>

```java
public static final int DP_NETCONF = 2;
```

### DP_SNMPGW <a href="#dp_snmpgw-d58125586f4c" id="dp_snmpgw-d58125586f4c"></a>

```java
public static final int DP_SNMPGW = 4;
```


## Methods

### getDaemonName() <a href="#getdaemonname-ad12d8093443" id="getdaemonname-ad12d8093443"></a>

```java
public String getDaemonName()
```

### getDataProvider() <a href="#getdataprovider-9e4cec2ec805" id="getdataprovider-9e4cec2ec805"></a>

```java
public int getDataProvider()
```

forward event type:


- [`DP_CDB`](CommitFailedNotification.md#dp_cdb-c81c7c7903c3)
   - [`DP_NETCONF`](CommitFailedNotification.md#dp_netconf-cbf8cf2a3cba)
     - [`DP_EXTERNAL`](CommitFailedNotification.md#dp_external-8c510f8bd5c3)
       - [`DP_SNMPGW`](CommitFailedNotification.md#dp_snmpgw-d58125586f4c)
         - [`DP_JAVASCRIPT`](CommitFailedNotification.md#dp_javascript-0603146d46a2)

### getDBName() <a href="#getdbname-65ff0bdb2339" id="getdbname-65ff0bdb2339"></a>

```java
public int getDBName()
```

target name in confd.conf

### getIP() <a href="#getip-c2f1d3db411f" id="getip-c2f1d3db411f"></a>

```java
public java.net.InetAddress getIP()
```

### getIPValue() <a href="#getipvalue-7154021b2d96" id="getipvalue-7154021b2d96"></a>

```java
public com.tailf.conf.ConfObject getIPValue()
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2)

### getPort() <a href="#getport-a2225f868a2b" id="getport-a2225f868a2b"></a>

```java
public int getPort()
```

### getUserInfo() <a href="#getuserinfo-3ecef1f24d3d" id="getuserinfo-3ecef1f24d3d"></a>

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](../dp/DpUserInfo.md#dpuserinfo-c59746285a6e)

User information

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
