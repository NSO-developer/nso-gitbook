<a id="cls-CommitDiffNotification"></a>
# CommitDiffNotification

```java
public class com.tailf.notif.CommitDiffNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for CommitDiff notifications.
 Complete diff between before and after commit.

 If this type of notifications are received it is
 important to call
 `Notif#diffNotificationDone(int thandle)`
 with the received transaction handle or the transaction
 will hang indefinitely

## Members

**Constructors**:

- [CommitDiffNotification(int, DpUserInfo, int, String, String)](#m-commitdiffnotification-b085d6f75e0f)

**Fields**:

- [type](Notification.md#m-type) from Notification

**Methods**:

- [getComment()](#m-getcomment-a5625f95afef)
- [getDatabase()](#m-getdatabase-3c5eb5bcb258)
- [getLabel()](#m-getlabel-72bf899bf6f1)
- [getNotificationType()](Notification.md#m-getnotificationtype-f0e32b7b644f) from Notification
- [getTransaction()](#m-gettransaction-4f1c72a828a1)
- [getUserInfo()](#m-getuserinfo-3ecef1f24d3d)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-commitdiffnotification-b085d6f75e0f"></a>
### CommitDiffNotification(int, DpUserInfo, int, String, String)

```java
public CommitDiffNotification(
    int database,
    com.tailf.dp.DpUserInfo uinfo,
    int thandle,
    String comment,
    String label
)
```

Types: [DpUserInfo](../dp/DpUserInfo.md#cls-DpUserInfo)

**Parameters**

- `int database`
- `com.tailf.dp.DpUserInfo uinfo`
- `int thandle`
- `String comment`
- `String label`


## Methods

<a id="m-getcomment-a5625f95afef"></a>
### getComment()

```java
public String getComment()
```

Commit comment - null if no comment

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

<a id="m-getlabel-72bf899bf6f1"></a>
### getLabel()

```java
public String getLabel()
```

Commit label - null if no label

<a id="m-gettransaction-4f1c72a828a1"></a>
### getTransaction()

```java
public int getTransaction()
```

Transaction handle

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
