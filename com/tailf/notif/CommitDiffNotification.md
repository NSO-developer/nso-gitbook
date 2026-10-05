<a id="s-CommitDiffNotification"></a>
# CommitDiffNotification

```java
public class com.tailf.notif.CommitDiffNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#s-Notification)

Data structure for CommitDiff notifications.
 Complete diff between before and after commit.

 If this type of notifications are received it is
 important to call
 [`Notif`](Notif.md#s-Notif)
 with the received transaction handle or the transaction
 will hang indefinitely

## Members

**Constructors**:

- [CommitDiffNotification(int, DpUserInfo, int, String, String)](#s-CommitDiffNotification-1)

**Fields**:

- [type](Notification.md#s-type) from Notification

**Methods**:

- [getComment()](#s-getComment)
- [getDatabase()](#s-getDatabase)
- [getLabel()](#s-getLabel)
- [getNotificationType()](Notification.md#s-getNotificationType) from Notification
- [getTransaction()](#s-getTransaction)
- [getUserInfo()](#s-getUserInfo)
- [toString()](#s-toString)

## Constructors

<a id="s-CommitDiffNotification-1"></a>
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

Types: [DpUserInfo](../dp/DpUserInfo.md#s-DpUserInfo)

**Parameters**

- `int database`
- `com.tailf.dp.DpUserInfo uinfo`
- `int thandle`
- `String comment`
- `String label`


## Methods

<a id="s-getComment"></a>
### getComment()

```java
public String getComment()
```

Commit comment - null if no comment

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

<a id="s-getLabel"></a>
### getLabel()

```java
public String getLabel()
```

Commit label - null if no label

<a id="s-getTransaction"></a>
### getTransaction()

```java
public int getTransaction()
```

Transaction handle

<a id="s-getUserInfo"></a>
### getUserInfo()

```java
public com.tailf.dp.DpUserInfo getUserInfo()
```

Types: [DpUserInfo](../dp/DpUserInfo.md#s-DpUserInfo)

User information

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
