# CommitNotification <a href="#commitnotification-30ba63db10de" id="commitnotification-30ba63db10de"></a>

```java
public class com.tailf.notif.CommitNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#notification-b2e7d82d4215)

Data structure for simple commit notifications.

## Members

**Constructors**:

- [CommitNotification(int, boolean, DpUserInfo)](#commitnotification-d12b0ad0627b)

**Fields**:

- [type](Notification.md#type-6ebb3673fbb6) from Notification

**Methods**:

- [getDatabase()](#getdatabase-3c5eb5bcb258)
- [getNotificationType()](Notification.md#getnotificationtype-f0e32b7b644f) from Notification
- [getUserInfo()](#getuserinfo-3ecef1f24d3d)
- [isDiffAvailable()](#isdiffavailable-435088c38777)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### CommitNotification(int, boolean, DpUserInfo) <a href="#commitnotification-d12b0ad0627b" id="commitnotification-d12b0ad0627b"></a>

```java
public CommitNotification(int database, boolean diffAvailable, com.tailf.dp.DpUserInfo uinfo)
```

Types: [DpUserInfo](../dp/DpUserInfo.md#dpuserinfo-c59746285a6e)

**Parameters**

- `int database`
- `boolean diffAvailable`
- `com.tailf.dp.DpUserInfo uinfo`


## Methods

### getDatabase() <a href="#getdatabase-3c5eb5bcb258" id="getdatabase-3c5eb5bcb258"></a>

```java
public int getDatabase()
```

Database type:


- [`Conf#DB_NONE`](../conf/Conf.md#db_none-5069c3fe4466)
   - [`Conf#DB_CANDIDATE`](../conf/Conf.md#db_candidate-8b43a337ac93)
     - [`Conf#DB_RUNNING`](../conf/Conf.md#db_running-c391f371da28)
       - [`Conf#DB_STARTUP`](../conf/Conf.md#db_startup-2ce085259486)

### getUserInfo() <a href="#getuserinfo-3ecef1f24d3d" id="getuserinfo-3ecef1f24d3d"></a>

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](../dp/DpUserInfo.md#dpuserinfo-c59746285a6e)

User information

### isDiffAvailable() <a href="#isdiffavailable-435088c38777" id="isdiffavailable-435088c38777"></a>

```java
public boolean isDiffAvailable()
```

Diff is available

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
