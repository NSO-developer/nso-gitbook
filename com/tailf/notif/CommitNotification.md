# CommitNotification <a href="#cls-CommitNotification" id="cls-CommitNotification"></a>

```java
public class com.tailf.notif.CommitNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for simple commit notifications.

## Members

**Constructors**:

- [CommitNotification(int, boolean, DpUserInfo)](#m-CommitNotification-d12b0ad0627b)

**Fields**:

- [type](Notification.md#m-type) from Notification

**Methods**:

- [getDatabase()](#m-getDatabase-3c5eb5bcb258)
- [getNotificationType()](Notification.md#m-getNotificationType-f0e32b7b644f) from Notification
- [getUserInfo()](#m-getUserInfo-3ecef1f24d3d)
- [isDiffAvailable()](#m-isDiffAvailable-435088c38777)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### CommitNotification(int, boolean, DpUserInfo) <a href="#m-CommitNotification-d12b0ad0627b" id="m-CommitNotification-d12b0ad0627b"></a>

```java
public CommitNotification(int database, boolean diffAvailable, com.tailf.dp.DpUserInfo uinfo)
```

Types: [DpUserInfo](../dp/DpUserInfo.md#cls-DpUserInfo)

**Parameters**

- `int database`
- `boolean diffAvailable`
- `com.tailf.dp.DpUserInfo uinfo`


## Methods

### getDatabase() <a href="#m-getDatabase-3c5eb5bcb258" id="m-getDatabase-3c5eb5bcb258"></a>

```java
public int getDatabase()
```

Database type:


- [`Conf#DB_NONE`](../conf/Conf.md#m-DB_NONE)
   - [`Conf#DB_CANDIDATE`](../conf/Conf.md#m-DB_CANDIDATE)
     - [`Conf#DB_RUNNING`](../conf/Conf.md#m-DB_RUNNING)
       - [`Conf#DB_STARTUP`](../conf/Conf.md#m-DB_STARTUP)

### getUserInfo() <a href="#m-getUserInfo-3ecef1f24d3d" id="m-getUserInfo-3ecef1f24d3d"></a>

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](../dp/DpUserInfo.md#cls-DpUserInfo)

User information

### isDiffAvailable() <a href="#m-isDiffAvailable-435088c38777" id="m-isDiffAvailable-435088c38777"></a>

```java
public boolean isDiffAvailable()
```

Diff is available

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
