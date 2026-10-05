<a id="cls-UserSessNotification"></a>
# UserSessNotification

```java
public class com.tailf.notif.UserSessNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for user session start/stop notifications.

## Members

**Constructors**:

- [UserSessNotification(int, DpUserInfo, int)](#m-usersessnotification-4c5eb009d958)

**Fields**:

- [type](Notification.md#m-type) from Notification
- [USER_SESS_LOCK](#m-USER_SESS_LOCK)
- [USER_SESS_START](#m-USER_SESS_START)
- [USER_SESS_START_TRANS](#m-USER_SESS_START_TRANS)
- [USER_SESS_STOP](#m-USER_SESS_STOP)
- [USER_SESS_STOP_TRANS](#m-USER_SESS_STOP_TRANS)
- [USER_SESS_UNLOCK](#m-USER_SESS_UNLOCK)

**Methods**:

- [getDatabase()](#m-getdatabase-3c5eb5bcb258)
- [getNotificationType()](Notification.md#m-getnotificationtype-f0e32b7b644f) from Notification
- [getUserInfo()](#m-getuserinfo-3ecef1f24d3d)
- [getUserSessionType()](#m-getusersessiontype-8e4f1d95b050)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-usersessnotification-4c5eb009d958"></a>
### UserSessNotification(int, DpUserInfo, int)

```java
public UserSessNotification(int userSessType, com.tailf.dp.DpUserInfo uinfo, int database)
```

Types: [DpUserInfo](../dp/DpUserInfo.md#cls-DpUserInfo)

**Parameters**

- `int userSessType`
- `com.tailf.dp.DpUserInfo uinfo`
- `int database`


## Fields

<a id="m-USER_SESS_LOCK"></a>
### USER_SESS_LOCK

```java
public static final int USER_SESS_LOCK = 3;
```

<a id="m-USER_SESS_START"></a>
### USER_SESS_START

```java
public static final int USER_SESS_START = 1;
```

<a id="m-USER_SESS_START_TRANS"></a>
### USER_SESS_START_TRANS

```java
public static final int USER_SESS_START_TRANS = 5;
```

<a id="m-USER_SESS_STOP"></a>
### USER_SESS_STOP

```java
public static final int USER_SESS_STOP = 2;
```

<a id="m-USER_SESS_STOP_TRANS"></a>
### USER_SESS_STOP_TRANS

```java
public static final int USER_SESS_STOP_TRANS = 6;
```

<a id="m-USER_SESS_UNLOCK"></a>
### USER_SESS_UNLOCK

```java
public static final int USER_SESS_UNLOCK = 4;
```


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

User information.

<a id="m-getusersessiontype-8e4f1d95b050"></a>
### getUserSessionType()

```java
public int getUserSessionType()
```

User session event type:


- `#USER_SESS_START`
   - `#USER_SESS_STOP`
     - `#USER_SESS_LOCK`
       - `#USER_SESS_UNLOCK`
         - `#USER_SESS_START_TRANS`
           - `#USER_SESS_STOP_TRANS`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
