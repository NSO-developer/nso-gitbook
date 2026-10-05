# CommitDiffNotification <a href="#cls-CommitDiffNotification" id="cls-CommitDiffNotification"></a>

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

- [CommitDiffNotification(int, DpUserInfo, int, String, String)](#m-CommitDiffNotification-b085d6f75e0f)

**Fields**:

- [type](Notification.md#m-type) from Notification

**Methods**:

- [getComment()](#m-getComment-a5625f95afef)
- [getDatabase()](#m-getDatabase-3c5eb5bcb258)
- [getLabel()](#m-getLabel-72bf899bf6f1)
- [getNotificationType()](Notification.md#m-getNotificationType-f0e32b7b644f) from Notification
- [getTransaction()](#m-getTransaction-4f1c72a828a1)
- [getUserInfo()](#m-getUserInfo-3ecef1f24d3d)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### CommitDiffNotification(int, DpUserInfo, int, String, String) <a href="#m-CommitDiffNotification-b085d6f75e0f" id="m-CommitDiffNotification-b085d6f75e0f"></a>

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

### getComment() <a href="#m-getComment-a5625f95afef" id="m-getComment-a5625f95afef"></a>

```java
public String getComment()
```

Commit comment - null if no comment

### getDatabase() <a href="#m-getDatabase-3c5eb5bcb258" id="m-getDatabase-3c5eb5bcb258"></a>

```java
public int getDatabase()
```

Database type:


- [`Conf#DB_NONE`](../conf/Conf.md#m-DB_NONE)
   - [`Conf#DB_CANDIDATE`](../conf/Conf.md#m-DB_CANDIDATE)
     - [`Conf#DB_RUNNING`](../conf/Conf.md#m-DB_RUNNING)
       - [`Conf#DB_STARTUP`](../conf/Conf.md#m-DB_STARTUP)

### getLabel() <a href="#m-getLabel-72bf899bf6f1" id="m-getLabel-72bf899bf6f1"></a>

```java
public String getLabel()
```

Commit label - null if no label

### getTransaction() <a href="#m-getTransaction-4f1c72a828a1" id="m-getTransaction-4f1c72a828a1"></a>

```java
public int getTransaction()
```

Transaction handle

### getUserInfo() <a href="#m-getUserInfo-3ecef1f24d3d" id="m-getUserInfo-3ecef1f24d3d"></a>

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](../dp/DpUserInfo.md#cls-DpUserInfo)

User information

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
