# UserSessNotification <a href="#usersessnotification-da9415293f94" id="usersessnotification-da9415293f94"></a>

```java
public class com.tailf.notif.UserSessNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#notification-b2e7d82d4215)

Data structure for user session start/stop notifications.

## Members

**Constructors**:

- [UserSessNotification(int, DpUserInfo, int)](#usersessnotification-4c5eb009d958)

**Fields**:

- [type](Notification.md#type-6ebb3673fbb6) from Notification
- [USER_SESS_LOCK](#user_sess_lock-34c897714a94)
- [USER_SESS_START](#user_sess_start-d8b438e37824)
- [USER_SESS_START_TRANS](#user_sess_start_trans-99506d33777a)
- [USER_SESS_STOP](#user_sess_stop-78fe6cc524c3)
- [USER_SESS_STOP_TRANS](#user_sess_stop_trans-87c697cda9df)
- [USER_SESS_UNLOCK](#user_sess_unlock-aa3ec8c61fe5)

**Methods**:

- [getDatabase()](#getdatabase-3c5eb5bcb258)
- [getNotificationType()](Notification.md#getnotificationtype-f0e32b7b644f) from Notification
- [getUserInfo()](#getuserinfo-3ecef1f24d3d)
- [getUserSessionType()](#getusersessiontype-8e4f1d95b050)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### UserSessNotification(int, DpUserInfo, int) <a href="#usersessnotification-4c5eb009d958" id="usersessnotification-4c5eb009d958"></a>

```java
public UserSessNotification(int userSessType, com.tailf.dp.DpUserInfo uinfo, int database)
```

Types: [DpUserInfo](../dp/DpUserInfo.md#dpuserinfo-c59746285a6e)

**Parameters**

- `int userSessType`
- `com.tailf.dp.DpUserInfo uinfo`
- `int database`


## Fields

### USER_SESS_LOCK <a href="#user_sess_lock-34c897714a94" id="user_sess_lock-34c897714a94"></a>

```java
public static final int USER_SESS_LOCK = 3;
```

### USER_SESS_START <a href="#user_sess_start-d8b438e37824" id="user_sess_start-d8b438e37824"></a>

```java
public static final int USER_SESS_START = 1;
```

### USER_SESS_START_TRANS <a href="#user_sess_start_trans-99506d33777a" id="user_sess_start_trans-99506d33777a"></a>

```java
public static final int USER_SESS_START_TRANS = 5;
```

### USER_SESS_STOP <a href="#user_sess_stop-78fe6cc524c3" id="user_sess_stop-78fe6cc524c3"></a>

```java
public static final int USER_SESS_STOP = 2;
```

### USER_SESS_STOP_TRANS <a href="#user_sess_stop_trans-87c697cda9df" id="user_sess_stop_trans-87c697cda9df"></a>

```java
public static final int USER_SESS_STOP_TRANS = 6;
```

### USER_SESS_UNLOCK <a href="#user_sess_unlock-aa3ec8c61fe5" id="user_sess_unlock-aa3ec8c61fe5"></a>

```java
public static final int USER_SESS_UNLOCK = 4;
```


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

User information.

### getUserSessionType() <a href="#getusersessiontype-8e4f1d95b050" id="getusersessiontype-8e4f1d95b050"></a>

```java
public int getUserSessionType()
```

User session event type:


- [`USER_SESS_START`](UserSessNotification.md#user_sess_start-d8b438e37824)
   - [`USER_SESS_STOP`](UserSessNotification.md#user_sess_stop-78fe6cc524c3)
     - [`USER_SESS_LOCK`](UserSessNotification.md#user_sess_lock-34c897714a94)
       - [`USER_SESS_UNLOCK`](UserSessNotification.md#user_sess_unlock-aa3ec8c61fe5)
         - [`USER_SESS_START_TRANS`](UserSessNotification.md#user_sess_start_trans-99506d33777a)
           - [`USER_SESS_STOP_TRANS`](UserSessNotification.md#user_sess_stop_trans-87c697cda9df)

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
