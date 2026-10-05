<a id="s-CommitFailedNotification"></a>
# CommitFailedNotification

```java
public class com.tailf.notif.CommitFailedNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#s-Notification)

Data structure for failing commit notifications.

## Members

**Constructors**:

- [CommitFailedNotification(int, int, DpUserInfo, String, InetAddress, ConfObject, int)](#s-CommitFailedNotification-1)

**Fields**:

- [DATABASE_CANDIDATE](#s-DATABASE_CANDIDATE)
- [DATABASE_NO_DB](#s-DATABASE_NO_DB)
- [DATABASE_RUNNING](#s-DATABASE_RUNNING)
- [DATABASE_STARTUP](#s-DATABASE_STARTUP)
- [DP_CDB](#s-DP_CDB)
- [DP_EXTERNAL](#s-DP_EXTERNAL)
- [DP_JAVASCRIPT](#s-DP_JAVASCRIPT)
- [DP_NETCONF](#s-DP_NETCONF)
- [DP_SNMPGW](#s-DP_SNMPGW)
- [type](Notification.md#s-type) from Notification

**Methods**:

- [getDaemonName()](#s-getDaemonName)
- [getDataProvider()](#s-getDataProvider)
- [getDBName()](#s-getDBName)
- [getIP()](#s-getIP)
- [getIPValue()](#s-getIPValue)
- [getNotificationType()](Notification.md#s-getNotificationType) from Notification
- [getPort()](#s-getPort)
- [getUserInfo()](#s-getUserInfo)
- [toString()](#s-toString)

## Constructors

<a id="s-CommitFailedNotification-1"></a>
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

Types: [DpUserInfo](../dp/DpUserInfo.md#s-DpUserInfo), [ConfObject](../conf/ConfObject.md#s-ConfObject)

**Parameters**

- `int dataProvider`
- `int dbName`
- `com.tailf.dp.DpUserInfo uinfo`
- `String daemonName`
- `java.net.InetAddress ip`
- `com.tailf.conf.ConfObject ipValue`
- `int port`


## Fields

<a id="s-DATABASE_CANDIDATE"></a>
### DATABASE_CANDIDATE

```java
public static final int DATABASE_CANDIDATE = 1;
```

<a id="s-DATABASE_NO_DB"></a>
### DATABASE_NO_DB

```java
public static final int DATABASE_NO_DB = 0;
```

<a id="s-DATABASE_RUNNING"></a>
### DATABASE_RUNNING

```java
public static final int DATABASE_RUNNING = 2;
```

<a id="s-DATABASE_STARTUP"></a>
### DATABASE_STARTUP

```java
public static final int DATABASE_STARTUP = 3;
```

<a id="s-DP_CDB"></a>
### DP_CDB

```java
public static final int DP_CDB = 1;
```

<a id="s-DP_EXTERNAL"></a>
### DP_EXTERNAL

```java
public static final int DP_EXTERNAL = 3;
```

<a id="s-DP_JAVASCRIPT"></a>
### DP_JAVASCRIPT

```java
public static final int DP_JAVASCRIPT = 5;
```

<a id="s-DP_NETCONF"></a>
### DP_NETCONF

```java
public static final int DP_NETCONF = 2;
```

<a id="s-DP_SNMPGW"></a>
### DP_SNMPGW

```java
public static final int DP_SNMPGW = 4;
```


## Methods

<a id="s-getDaemonName"></a>
### getDaemonName()

```java
public String getDaemonName()
```

<a id="s-getDataProvider"></a>
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

<a id="s-getDBName"></a>
### getDBName()

```java
public int getDBName()
```

target name in confd.conf

<a id="s-getIP"></a>
### getIP()

```java
public java.net.InetAddress getIP()
```

<a id="s-getIPValue"></a>
### getIPValue()

```java
public com.tailf.conf.ConfObject getIPValue()
```

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject)

<a id="s-getPort"></a>
### getPort()

```java
public int getPort()
```

<a id="s-getUserInfo"></a>
### getUserInfo()

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](../dp/DpUserInfo.md#s-DpUserInfo)

User information

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
