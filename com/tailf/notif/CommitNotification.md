<a id="cls-CommitNotification"></a>
# CommitNotification

```java
public class com.tailf.notif.CommitNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for simple commit notifications.

## Members

**Constructors**:

- [CommitNotification(int, boolean, DpUserInfo)](#m-commitnotification-d12b0ad0627b)

**Fields**:

- [type](Notification.md#m-type) from Notification

**Methods**:

- [getDatabase()](#m-getdatabase-3c5eb5bcb258)
- [getNotificationType()](Notification.md#m-getnotificationtype-f0e32b7b644f) from Notification
- [getUserInfo()](#m-getuserinfo-3ecef1f24d3d)
- [isDiffAvailable()](#m-isdiffavailable-435088c38777)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-commitnotification-d12b0ad0627b"></a>
### CommitNotification(int, boolean, DpUserInfo)

```java
public CommitNotification(int database, boolean diffAvailable, com.tailf.dp.DpUserInfo uinfo)
```

Types: [DpUserInfo](../dp/DpUserInfo.md#cls-DpUserInfo)

**Parameters**

- `int database`
- `boolean diffAvailable`
- `com.tailf.dp.DpUserInfo uinfo`


## Methods

<a id="m-getdatabase-3c5eb5bcb258"></a>
### getDatabase()

```java
public int getDatabase()
```

Database type:


- [`Conf#DB_NONE`](../conf/Conf.md#m-DB_NONE)
   - [`Conf#DB_CANDIDATE`](../conf/Conf.md#m-DB_CANDIDATE)
     - [`Conf#DB_RUNNING`](../conf/Conf.md#m-DB_RUNNING)
       - [`Conf#DB_STARTUP`](../conf/Conf.md#m-DB_STARTUP)

<a id="m-getuserinfo-3ecef1f24d3d"></a>
### getUserInfo()

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](../dp/DpUserInfo.md#cls-DpUserInfo)

User information

<a id="m-isdiffavailable-435088c38777"></a>
### isDiffAvailable()

```java
public boolean isDiffAvailable()
```

Diff is available

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
