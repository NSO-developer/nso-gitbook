<a id="cls-CommitFailedNotification"></a>
# CommitFailedNotification

```java
public class com.tailf.notif.CommitFailedNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for failing commit notifications.

## Members

**Constructors**:

- [CommitFailedNotification(int, int, DpUserInfo, String, InetAddress, ConfObject, int)](#m-commitfailednotification-83e5ff60e780)

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

- [getDaemonName()](#m-getdaemonname-ad12d8093443)
- [getDataProvider()](#m-getdataprovider-9e4cec2ec805)
- [getDBName()](#m-getdbname-65ff0bdb2339)
- [getIP()](#m-getip-c2f1d3db411f)
- [getIPValue()](#m-getipvalue-7154021b2d96)
- [getNotificationType()](Notification.md#m-getnotificationtype-f0e32b7b644f) from Notification
- [getPort()](#m-getport-a2225f868a2b)
- [getUserInfo()](#m-getuserinfo-3ecef1f24d3d)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-commitfailednotification-83e5ff60e780"></a>
### CommitFailedNotification(int, int, DpUserInfo, String, InetAddress, ConfObject, int)

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

<a id="m-DATABASE_CANDIDATE"></a>
### DATABASE_CANDIDATE

```java
public static final int DATABASE_CANDIDATE = 1;
```

<a id="m-DATABASE_NO_DB"></a>
### DATABASE_NO_DB

```java
public static final int DATABASE_NO_DB = 0;
```

<a id="m-DATABASE_RUNNING"></a>
### DATABASE_RUNNING

```java
public static final int DATABASE_RUNNING = 2;
```

<a id="m-DATABASE_STARTUP"></a>
### DATABASE_STARTUP

```java
public static final int DATABASE_STARTUP = 3;
```

<a id="m-DP_CDB"></a>
### DP_CDB

```java
public static final int DP_CDB = 1;
```

<a id="m-DP_EXTERNAL"></a>
### DP_EXTERNAL

```java
public static final int DP_EXTERNAL = 3;
```

<a id="m-DP_JAVASCRIPT"></a>
### DP_JAVASCRIPT

```java
public static final int DP_JAVASCRIPT = 5;
```

<a id="m-DP_NETCONF"></a>
### DP_NETCONF

```java
public static final int DP_NETCONF = 2;
```

<a id="m-DP_SNMPGW"></a>
### DP_SNMPGW

```java
public static final int DP_SNMPGW = 4;
```


## Methods

<a id="m-getdaemonname-ad12d8093443"></a>
### getDaemonName()

```java
public String getDaemonName()
```

<a id="m-getdataprovider-9e4cec2ec805"></a>
### getDataProvider()

```java
public int getDataProvider()
```

forward event type:


- `#DP_CDB`
   - `#DP_NETCONF`
     - `#DP_EXTERNAL`
       - `#DP_SNMPGW`
         - `#DP_JAVASCRIPT`

<a id="m-getdbname-65ff0bdb2339"></a>
### getDBName()

```java
public int getDBName()
```

target name in confd.conf

<a id="m-getip-c2f1d3db411f"></a>
### getIP()

```java
public java.net.InetAddress getIP()
```

<a id="m-getipvalue-7154021b2d96"></a>
### getIPValue()

```java
public com.tailf.conf.ConfObject getIPValue()
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

<a id="m-getport-a2225f868a2b"></a>
### getPort()

```java
public int getPort()
```

<a id="m-getuserinfo-3ecef1f24d3d"></a>
### getUserInfo()

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](../dp/DpUserInfo.md#cls-DpUserInfo)

User information

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
