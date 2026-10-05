# CommitDiffNotification <a href="#commitdiffnotification-c6f5ad668010" id="commitdiffnotification-c6f5ad668010"></a>

```java
public class com.tailf.notif.CommitDiffNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#notification-b2e7d82d4215)

Data structure for CommitDiff notifications.
 Complete diff between before and after commit.

 If this type of notifications are received it is
 important to call
 `Notif#diffNotificationDone(int thandle)`
 with the received transaction handle or the transaction
 will hang indefinitely

## Members

**Constructors**:

- [CommitDiffNotification(int, DpUserInfo, int, String, String)](#commitdiffnotification-b085d6f75e0f)

**Fields**:

- [type](Notification.md#type-6ebb3673fbb6) from Notification

**Methods**:

- [getComment()](#getcomment-a5625f95afef)
- [getDatabase()](#getdatabase-3c5eb5bcb258)
- [getLabel()](#getlabel-72bf899bf6f1)
- [getNotificationType()](Notification.md#getnotificationtype-f0e32b7b644f) from Notification
- [getTransaction()](#gettransaction-4f1c72a828a1)
- [getUserInfo()](#getuserinfo-3ecef1f24d3d)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### CommitDiffNotification(int, DpUserInfo, int, String, String) <a href="#commitdiffnotification-b085d6f75e0f" id="commitdiffnotification-b085d6f75e0f"></a>

```java
public CommitDiffNotification(
    int database,
    com.tailf.dp.DpUserInfo uinfo,
    int thandle,
    String comment,
    String label
)
```

Types: [DpUserInfo](../dp/DpUserInfo.md#dpuserinfo-c59746285a6e)

**Parameters**

- `int database`
- `com.tailf.dp.DpUserInfo uinfo`
- `int thandle`
- `String comment`
- `String label`


## Methods

### getComment() <a href="#getcomment-a5625f95afef" id="getcomment-a5625f95afef"></a>

```java
public String getComment()
```

Commit comment - null if no comment

### getDatabase() <a href="#getdatabase-3c5eb5bcb258" id="getdatabase-3c5eb5bcb258"></a>

```java
public int getDatabase()
```

Database type:


- [`Conf#DB_NONE`](../conf/Conf.md#db_none-5069c3fe4466)
   - [`Conf#DB_CANDIDATE`](../conf/Conf.md#db_candidate-8b43a337ac93)
     - [`Conf#DB_RUNNING`](../conf/Conf.md#db_running-c391f371da28)
       - [`Conf#DB_STARTUP`](../conf/Conf.md#db_startup-2ce085259486)

### getLabel() <a href="#getlabel-72bf899bf6f1" id="getlabel-72bf899bf6f1"></a>

```java
public String getLabel()
```

Commit label - null if no label

### getTransaction() <a href="#gettransaction-4f1c72a828a1" id="gettransaction-4f1c72a828a1"></a>

```java
public int getTransaction()
```

Transaction handle

### getUserInfo() <a href="#getuserinfo-3ecef1f24d3d" id="getuserinfo-3ecef1f24d3d"></a>

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](../dp/DpUserInfo.md#dpuserinfo-c59746285a6e)

User information

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
