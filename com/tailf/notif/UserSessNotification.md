<a id="s-UserSessNotification"></a>
# UserSessNotification

```java
public class com.tailf.notif.UserSessNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#s-Notification)

Data structure for user session start/stop notifications.

## Members

**Constructors**:

- [UserSessNotification(int, DpUserInfo, int)](#s-UserSessNotification-1)

**Fields**:

- [type](Notification.md#s-type) from Notification
- [USER_SESS_LOCK](#s-USER_SESS_LOCK)
- [USER_SESS_START](#s-USER_SESS_START)
- [USER_SESS_START_TRANS](#s-USER_SESS_START_TRANS)
- [USER_SESS_STOP](#s-USER_SESS_STOP)
- [USER_SESS_STOP_TRANS](#s-USER_SESS_STOP_TRANS)
- [USER_SESS_UNLOCK](#s-USER_SESS_UNLOCK)

**Methods**:

- [getDatabase()](#s-getDatabase)
- [getNotificationType()](Notification.md#s-getNotificationType) from Notification
- [getUserInfo()](#s-getUserInfo)
- [getUserSessionType()](#s-getUserSessionType)
- [toString()](#s-toString)

## Constructors

<a id="s-UserSessNotification-1"></a>
### UserSessNotification(int, DpUserInfo, int)

```java
public UserSessNotification(int userSessType, com.tailf.dp.DpUserInfo uinfo, int database)
```

Types: [DpUserInfo](../dp/DpUserInfo.md#s-DpUserInfo)

**Parameters**

- `int userSessType`
- `com.tailf.dp.DpUserInfo uinfo`
- `int database`


## Fields

<a id="s-USER_SESS_LOCK"></a>
### USER_SESS_LOCK

```java
public static final int USER_SESS_LOCK = 3;
```

<a id="s-USER_SESS_START"></a>
### USER_SESS_START

```java
public static final int USER_SESS_START = 1;
```

<a id="s-USER_SESS_START_TRANS"></a>
### USER_SESS_START_TRANS

```java
public static final int USER_SESS_START_TRANS = 5;
```

<a id="s-USER_SESS_STOP"></a>
### USER_SESS_STOP

```java
public static final int USER_SESS_STOP = 2;
```

<a id="s-USER_SESS_STOP_TRANS"></a>
### USER_SESS_STOP_TRANS

```java
public static final int USER_SESS_STOP_TRANS = 6;
```

<a id="s-USER_SESS_UNLOCK"></a>
### USER_SESS_UNLOCK

```java
public static final int USER_SESS_UNLOCK = 4;
```


## Methods

<a id="s-getDatabase"></a>
### getDatabase()

```java
public int getDatabase()
```

Database type:


- [`Conf`](../conf/Conf.md#s-Conf)
   - [`Conf`](../conf/Conf.md#s-Conf)
     - [`Conf`](../conf/Conf.md#s-Conf)
       - [`Conf`](../conf/Conf.md#s-Conf)

<a id="s-getUserInfo"></a>
### getUserInfo()

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](../dp/DpUserInfo.md#s-DpUserInfo)

User information.

<a id="s-getUserSessionType"></a>
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

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
