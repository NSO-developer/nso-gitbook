<a id="s-CommitNotification"></a>
# CommitNotification

```java
public class com.tailf.notif.CommitNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#s-Notification)

Data structure for simple commit notifications.

## Members

**Constructors**:

- [CommitNotification(int, boolean, DpUserInfo)](#s-CommitNotification-1)

**Fields**:

- [type](Notification.md#s-type) from Notification

**Methods**:

- [getDatabase()](#s-getDatabase)
- [getNotificationType()](Notification.md#s-getNotificationType) from Notification
- [getUserInfo()](#s-getUserInfo)
- [isDiffAvailable()](#s-isDiffAvailable)
- [toString()](#s-toString)

## Constructors

<a id="s-CommitNotification-1"></a>
### CommitNotification(int, boolean, DpUserInfo)

```java
public CommitNotification(int database, boolean diffAvailable, com.tailf.dp.DpUserInfo uinfo)
```

Types: [DpUserInfo](../dp/DpUserInfo.md#s-DpUserInfo)

**Parameters**

- `int database`
- `boolean diffAvailable`
- `com.tailf.dp.DpUserInfo uinfo`


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

User information

<a id="s-isDiffAvailable"></a>
### isDiffAvailable()

```java
public boolean isDiffAvailable()
```

Diff is available

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
