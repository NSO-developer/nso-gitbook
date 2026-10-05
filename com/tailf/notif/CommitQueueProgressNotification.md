# CommitQueueProgressNotification <a href="#cls-CommitQueueProgressNotification" id="cls-CommitQueueProgressNotification"></a>

```java
public class com.tailf.notif.CommitQueueProgressNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for commit queue progress notifications.

## Members

**Constructors**:

- [CommitQueueProgressNotification(int, ConfDatetime, ConfUInt64, String, List<String>, Map<String,String>, Map<String,String>, Map<String,ConfList>, Map<String,ConfList[]>)](#m-CommitQueueProgressNotification-c3a908d74df6)

**Fields**:

- [NCS_CQ_ITEM_COMPLETED](#m-NCS_CQ_ITEM_COMPLETED)
- [NCS_CQ_ITEM_DELETED](#m-NCS_CQ_ITEM_DELETED)
- [NCS_CQ_ITEM_EXECUTING](#m-NCS_CQ_ITEM_EXECUTING)
- [NCS_CQ_ITEM_FAILED](#m-NCS_CQ_ITEM_FAILED)
- [NCS_CQ_ITEM_LOCKED](#m-NCS_CQ_ITEM_LOCKED)
- [NCS_CQ_ITEM_WAITING](#m-NCS_CQ_ITEM_WAITING)
- [type](Notification.md#m-type) from Notification

**Methods**:

- [getCompletedDevices()](#m-getCompletedDevices-5d4f1d403427)
- [getCompletedServices()](#m-getCompletedServices-8efb6940a788)
- [getCQId()](#m-getCQId-1138a32e494a)
- [getCQNotifType()](#m-getCQNotifType-9681a75b690a)
- [getCQNotifTypeStr()](#m-getCQNotifTypeStr-c4898653014c)
- [getFailedDevices()](#m-getFailedDevices-70e71b879fad)
- [getFailedServices()](#m-getFailedServices-1b83786e5cef)
- [getLabel()](#m-getLabel-72bf899bf6f1)
- [getNotificationType()](Notification.md#m-getNotificationType-f0e32b7b644f) from Notification
- [getTimestamp()](#m-getTimestamp-a9e0c6b457f8)
- [getTransientDevices()](#m-getTransientDevices-780e0b7cff26)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### CommitQueueProgressNotification(int, ConfDatetime, ConfUInt64, String, List<String>, Map<String,String>, Map<String,String>, Map<String,ConfList>, Map<String,ConfList[]>) <a href="#m-CommitQueueProgressNotification-c3a908d74df6" id="m-CommitQueueProgressNotification-c3a908d74df6"></a>

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

Types: [ConfDatetime](../conf/ConfDatetime.md#cls-ConfDatetime), [ConfUInt64](../conf/ConfUInt64.md#cls-ConfUInt64), [ConfList](../conf/ConfList.md#cls-ConfList)

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

### NCS_CQ_ITEM_COMPLETED <a href="#m-NCS_CQ_ITEM_COMPLETED" id="m-NCS_CQ_ITEM_COMPLETED"></a>

```java
public static final int NCS_CQ_ITEM_COMPLETED = 4;
```

### NCS_CQ_ITEM_DELETED <a href="#m-NCS_CQ_ITEM_DELETED" id="m-NCS_CQ_ITEM_DELETED"></a>

```java
public static final int NCS_CQ_ITEM_DELETED = 6;
```

### NCS_CQ_ITEM_EXECUTING <a href="#m-NCS_CQ_ITEM_EXECUTING" id="m-NCS_CQ_ITEM_EXECUTING"></a>

```java
public static final int NCS_CQ_ITEM_EXECUTING = 2;
```

### NCS_CQ_ITEM_FAILED <a href="#m-NCS_CQ_ITEM_FAILED" id="m-NCS_CQ_ITEM_FAILED"></a>

```java
public static final int NCS_CQ_ITEM_FAILED = 5;
```

### NCS_CQ_ITEM_LOCKED <a href="#m-NCS_CQ_ITEM_LOCKED" id="m-NCS_CQ_ITEM_LOCKED"></a>

```java
public static final int NCS_CQ_ITEM_LOCKED = 3;
```

### NCS_CQ_ITEM_WAITING <a href="#m-NCS_CQ_ITEM_WAITING" id="m-NCS_CQ_ITEM_WAITING"></a>

```java
public static final int NCS_CQ_ITEM_WAITING = 1;
```


## Methods

### getCompletedDevices() <a href="#m-getCompletedDevices-5d4f1d403427" id="m-getCompletedDevices-5d4f1d403427"></a>

```java
public java.util.List<String> getCompletedDevices()
```

### getCompletedServices() <a href="#m-getCompletedServices-8efb6940a788" id="m-getCompletedServices-8efb6940a788"></a>

```java
public java.util.Map<String,com.tailf.conf.ConfList> getCompletedServices()
```

Types: [ConfList](../conf/ConfList.md#cls-ConfList)

### getCQId() <a href="#m-getCQId-1138a32e494a" id="m-getCQId-1138a32e494a"></a>

```java
public com.tailf.conf.ConfUInt64 getCQId()
```

Types: [ConfUInt64](../conf/ConfUInt64.md#cls-ConfUInt64)

### getCQNotifType() <a href="#m-getCQNotifType-9681a75b690a" id="m-getCQNotifType-9681a75b690a"></a>

```java
public int getCQNotifType()
```

### getCQNotifTypeStr() <a href="#m-getCQNotifTypeStr-c4898653014c" id="m-getCQNotifTypeStr-c4898653014c"></a>

```java
public String getCQNotifTypeStr()
```

### getFailedDevices() <a href="#m-getFailedDevices-70e71b879fad" id="m-getFailedDevices-70e71b879fad"></a>

```java
public java.util.Map<String,String> getFailedDevices()
```

### getFailedServices() <a href="#m-getFailedServices-1b83786e5cef" id="m-getFailedServices-1b83786e5cef"></a>

```java
public java.util.Map<String,com.tailf.conf.ConfList[]> getFailedServices()
```

Types: [ConfList](../conf/ConfList.md#cls-ConfList)

### getLabel() <a href="#m-getLabel-72bf899bf6f1" id="m-getLabel-72bf899bf6f1"></a>

```java
public String getLabel()
```

### getTimestamp() <a href="#m-getTimestamp-a9e0c6b457f8" id="m-getTimestamp-a9e0c6b457f8"></a>

```java
public com.tailf.conf.ConfDatetime getTimestamp()
```

Types: [ConfDatetime](../conf/ConfDatetime.md#cls-ConfDatetime)

### getTransientDevices() <a href="#m-getTransientDevices-780e0b7cff26" id="m-getTransientDevices-780e0b7cff26"></a>

```java
public java.util.Map<String,String> getTransientDevices()
```

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
