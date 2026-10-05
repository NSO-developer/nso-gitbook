<a id="s-CommitQueueProgressNotification"></a>
# CommitQueueProgressNotification

```java
public class com.tailf.notif.CommitQueueProgressNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#s-Notification)

Data structure for commit queue progress notifications.

## Members

**Constructors**:

- [CommitQueueProgressNotification(int, ConfDatetime, ConfUInt64, String, List<String>, Map<String,String>, Map<String,String>, Map<String,ConfList>, Map<String,ConfList[]>)](#s-CommitQueueProgressNotification-1)

**Fields**:

- [NCS_CQ_ITEM_COMPLETED](#s-NCS_CQ_ITEM_COMPLETED)
- [NCS_CQ_ITEM_DELETED](#s-NCS_CQ_ITEM_DELETED)
- [NCS_CQ_ITEM_EXECUTING](#s-NCS_CQ_ITEM_EXECUTING)
- [NCS_CQ_ITEM_FAILED](#s-NCS_CQ_ITEM_FAILED)
- [NCS_CQ_ITEM_LOCKED](#s-NCS_CQ_ITEM_LOCKED)
- [NCS_CQ_ITEM_WAITING](#s-NCS_CQ_ITEM_WAITING)
- [type](Notification.md#s-type) from Notification

**Methods**:

- [getCompletedDevices()](#s-getCompletedDevices)
- [getCompletedServices()](#s-getCompletedServices)
- [getCQId()](#s-getCQId)
- [getCQNotifType()](#s-getCQNotifType)
- [getCQNotifTypeStr()](#s-getCQNotifTypeStr)
- [getFailedDevices()](#s-getFailedDevices)
- [getFailedServices()](#s-getFailedServices)
- [getLabel()](#s-getLabel)
- [getNotificationType()](Notification.md#s-getNotificationType) from Notification
- [getTimestamp()](#s-getTimestamp)
- [getTransientDevices()](#s-getTransientDevices)
- [toString()](#s-toString)

## Constructors

<a id="s-CommitQueueProgressNotification-1"></a>
### CommitQueueProgressNotification(int, ConfDatetime, ConfUInt64, String, List<String>, Map<String,String>, Map<String,String>, Map<String,ConfList>, Map<String,ConfList[]>)

```java
public CommitQueueProgressNotification(
    int notifType,
    com.tailf.conf.ConfDatetime timestamp,
    com.tailf.conf.ConfUInt64 id,
    String label,
    java.util.List<String> completedDevices,
    java.util.Map<String,String> transientDevices,
    java.util.Map<String,String> failedDevices,
    java.util.Map<String,com.tailf.conf.ConfList> completedServices,
    java.util.Map<String,com.tailf.conf.ConfList[]> failedServices
)
```

Types: [ConfDatetime](../conf/ConfDatetime.md#s-ConfDatetime), [ConfUInt64](../conf/ConfUInt64.md#s-ConfUInt64), [ConfList](../conf/ConfList.md#s-ConfList)

**Parameters**

- `int notifType`
- `com.tailf.conf.ConfDatetime timestamp`
- `com.tailf.conf.ConfUInt64 id`
- `String label`
- `java.util.List<String> completedDevices`
- `java.util.Map<String,String> transientDevices`
- `java.util.Map<String,String> failedDevices`
- `java.util.Map<String,com.tailf.conf.ConfList> completedServices`
- `java.util.Map<String,com.tailf.conf.ConfList[]> failedServices`


## Fields

<a id="s-NCS_CQ_ITEM_COMPLETED"></a>
### NCS_CQ_ITEM_COMPLETED

```java
public static final int NCS_CQ_ITEM_COMPLETED = 4;
```

<a id="s-NCS_CQ_ITEM_DELETED"></a>
### NCS_CQ_ITEM_DELETED

```java
public static final int NCS_CQ_ITEM_DELETED = 6;
```

<a id="s-NCS_CQ_ITEM_EXECUTING"></a>
### NCS_CQ_ITEM_EXECUTING

```java
public static final int NCS_CQ_ITEM_EXECUTING = 2;
```

<a id="s-NCS_CQ_ITEM_FAILED"></a>
### NCS_CQ_ITEM_FAILED

```java
public static final int NCS_CQ_ITEM_FAILED = 5;
```

<a id="s-NCS_CQ_ITEM_LOCKED"></a>
### NCS_CQ_ITEM_LOCKED

```java
public static final int NCS_CQ_ITEM_LOCKED = 3;
```

<a id="s-NCS_CQ_ITEM_WAITING"></a>
### NCS_CQ_ITEM_WAITING

```java
public static final int NCS_CQ_ITEM_WAITING = 1;
```


## Methods

<a id="s-getCompletedDevices"></a>
### getCompletedDevices()

```java
public java.util.List<String> getCompletedDevices()
```

<a id="s-getCompletedServices"></a>
### getCompletedServices()

```java
public java.util.Map<String,com.tailf.conf.ConfList> getCompletedServices()
```

Types: [ConfList](../conf/ConfList.md#s-ConfList)

<a id="s-getCQId"></a>
### getCQId()

```java
public com.tailf.conf.ConfUInt64 getCQId()
```

Types: [ConfUInt64](../conf/ConfUInt64.md#s-ConfUInt64)

<a id="s-getCQNotifType"></a>
### getCQNotifType()

```java
public int getCQNotifType()
```

<a id="s-getCQNotifTypeStr"></a>
### getCQNotifTypeStr()

```java
public String getCQNotifTypeStr()
```

<a id="s-getFailedDevices"></a>
### getFailedDevices()

```java
public java.util.Map<String,String> getFailedDevices()
```

<a id="s-getFailedServices"></a>
### getFailedServices()

```java
public java.util.Map<String,com.tailf.conf.ConfList[]> getFailedServices()
```

Types: [ConfList](../conf/ConfList.md#s-ConfList)

<a id="s-getLabel"></a>
### getLabel()

```java
public String getLabel()
```

<a id="s-getTimestamp"></a>
### getTimestamp()

```java
public com.tailf.conf.ConfDatetime getTimestamp()
```

Types: [ConfDatetime](../conf/ConfDatetime.md#s-ConfDatetime)

<a id="s-getTransientDevices"></a>
### getTransientDevices()

```java
public java.util.Map<String,String> getTransientDevices()
```

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
