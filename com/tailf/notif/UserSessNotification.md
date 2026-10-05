# UserSessNotification <a href="#cls-UserSessNotification" id="cls-UserSessNotification"></a>

```java
public class com.tailf.notif.UserSessNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for user session start/stop notifications.

## Members

**Constructors**:

- [UserSessNotification(int, DpUserInfo, int)](#m-UserSessNotification-4c5eb009d958)

**Fields**:

- [type](Notification.md#m-type) from Notification
- [USER_SESS_LOCK](#m-USER_SESS_LOCK)
- [USER_SESS_START](#m-USER_SESS_START)
- [USER_SESS_START_TRANS](#m-USER_SESS_START_TRANS)
- [USER_SESS_STOP](#m-USER_SESS_STOP)
- [USER_SESS_STOP_TRANS](#m-USER_SESS_STOP_TRANS)
- [USER_SESS_UNLOCK](#m-USER_SESS_UNLOCK)

**Methods**:

- [getDatabase()](#m-getDatabase-3c5eb5bcb258)
- [getNotificationType()](Notification.md#m-getNotificationType-f0e32b7b644f) from Notification
- [getUserInfo()](#m-getUserInfo-3ecef1f24d3d)
- [getUserSessionType()](#m-getUserSessionType-8e4f1d95b050)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### UserSessNotification(int, DpUserInfo, int) <a href="#m-UserSessNotification-4c5eb009d958" id="m-UserSessNotification-4c5eb009d958"></a>

```java
public UserSessNotification(int userSessType, com.tailf.dp.DpUserInfo uinfo, int database)
```

Types: [DpUserInfo](../dp/DpUserInfo.md#cls-DpUserInfo)

**Parameters**

- `int userSessType`
- `com.tailf.dp.DpUserInfo uinfo`
- `int database`


## Fields

### USER_SESS_LOCK <a href="#m-USER_SESS_LOCK" id="m-USER_SESS_LOCK"></a>

```java
public static final int USER_SESS_LOCK = 3;
```

### USER_SESS_START <a href="#m-USER_SESS_START" id="m-USER_SESS_START"></a>

```java
public static final int USER_SESS_START = 1;
```

### USER_SESS_START_TRANS <a href="#m-USER_SESS_START_TRANS" id="m-USER_SESS_START_TRANS"></a>

```java
public static final int USER_SESS_START_TRANS = 5;
```

### USER_SESS_STOP <a href="#m-USER_SESS_STOP" id="m-USER_SESS_STOP"></a>

```java
public static final int USER_SESS_STOP = 2;
```

### USER_SESS_STOP_TRANS <a href="#m-USER_SESS_STOP_TRANS" id="m-USER_SESS_STOP_TRANS"></a>

```java
public static final int USER_SESS_STOP_TRANS = 6;
```

### USER_SESS_UNLOCK <a href="#m-USER_SESS_UNLOCK" id="m-USER_SESS_UNLOCK"></a>

```java
public static final int USER_SESS_UNLOCK = 4;
```


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

User information.

### getUserSessionType() <a href="#m-getUserSessionType-8e4f1d95b050" id="m-getUserSessionType-8e4f1d95b050"></a>

```java
public int getUserSessionType()
```

User session event type:


- [`USER_SESS_START`](UserSessNotification.md#m-USER_SESS_START)
   - [`USER_SESS_STOP`](UserSessNotification.md#m-USER_SESS_STOP)
     - [`USER_SESS_LOCK`](UserSessNotification.md#m-USER_SESS_LOCK)
       - [`USER_SESS_UNLOCK`](UserSessNotification.md#m-USER_SESS_UNLOCK)
         - [`USER_SESS_START_TRANS`](UserSessNotification.md#m-USER_SESS_START_TRANS)
           - [`USER_SESS_STOP_TRANS`](UserSessNotification.md#m-USER_SESS_STOP_TRANS)

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
