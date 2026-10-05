<a id="cls-CommitQueueProgressNotification"></a>
# CommitQueueProgressNotification

```java
public class com.tailf.notif.CommitQueueProgressNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for commit queue progress notifications.

## Members

**Constructors**:

- [CommitQueueProgressNotification(int, ConfDatetime, ConfUInt64, String, List<String>, Map<String,String>, Map<String,String>, Map<String,ConfList>, Map<String,ConfList[]>)](#m-commitqueueprogressnotification-c3a908d74df6)

**Fields**:

- [NCS_CQ_ITEM_COMPLETED](#m-NCS_CQ_ITEM_COMPLETED)
- [NCS_CQ_ITEM_DELETED](#m-NCS_CQ_ITEM_DELETED)
- [NCS_CQ_ITEM_EXECUTING](#m-NCS_CQ_ITEM_EXECUTING)
- [NCS_CQ_ITEM_FAILED](#m-NCS_CQ_ITEM_FAILED)
- [NCS_CQ_ITEM_LOCKED](#m-NCS_CQ_ITEM_LOCKED)
- [NCS_CQ_ITEM_WAITING](#m-NCS_CQ_ITEM_WAITING)
- [type](Notification.md#m-type) from Notification

**Methods**:

- [getCompletedDevices()](#m-getcompleteddevices-5d4f1d403427)
- [getCompletedServices()](#m-getcompletedservices-8efb6940a788)
- [getCQId()](#m-getcqid-1138a32e494a)
- [getCQNotifType()](#m-getcqnotiftype-9681a75b690a)
- [getCQNotifTypeStr()](#m-getcqnotiftypestr-c4898653014c)
- [getFailedDevices()](#m-getfaileddevices-70e71b879fad)
- [getFailedServices()](#m-getfailedservices-1b83786e5cef)
- [getLabel()](#m-getlabel-72bf899bf6f1)
- [getNotificationType()](Notification.md#m-getnotificationtype-f0e32b7b644f) from Notification
- [getTimestamp()](#m-gettimestamp-a9e0c6b457f8)
- [getTransientDevices()](#m-gettransientdevices-780e0b7cff26)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-commitqueueprogressnotification-c3a908d74df6"></a>
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

<a id="m-NCS_CQ_ITEM_COMPLETED"></a>
### NCS_CQ_ITEM_COMPLETED

```java
public static final int NCS_CQ_ITEM_COMPLETED = 4;
```

<a id="m-NCS_CQ_ITEM_DELETED"></a>
### NCS_CQ_ITEM_DELETED

```java
public static final int NCS_CQ_ITEM_DELETED = 6;
```

<a id="m-NCS_CQ_ITEM_EXECUTING"></a>
### NCS_CQ_ITEM_EXECUTING

```java
public static final int NCS_CQ_ITEM_EXECUTING = 2;
```

<a id="m-NCS_CQ_ITEM_FAILED"></a>
### NCS_CQ_ITEM_FAILED

```java
public static final int NCS_CQ_ITEM_FAILED = 5;
```

<a id="m-NCS_CQ_ITEM_LOCKED"></a>
### NCS_CQ_ITEM_LOCKED

```java
public static final int NCS_CQ_ITEM_LOCKED = 3;
```

<a id="m-NCS_CQ_ITEM_WAITING"></a>
### NCS_CQ_ITEM_WAITING

```java
public static final int NCS_CQ_ITEM_WAITING = 1;
```


## Methods

<a id="m-getcompleteddevices-5d4f1d403427"></a>
### getCompletedDevices()

```java
public java.util.List<String> getCompletedDevices()
```

<a id="m-getcompletedservices-8efb6940a788"></a>
### getCompletedServices()

```java
public java.util.Map<String,com.tailf.conf.ConfList> getCompletedServices()
```

Types: [ConfList](../conf/ConfList.md#cls-ConfList)

<a id="m-getcqid-1138a32e494a"></a>
### getCQId()

```java
public com.tailf.conf.ConfUInt64 getCQId()
```

Types: [ConfUInt64](../conf/ConfUInt64.md#cls-ConfUInt64)

<a id="m-getcqnotiftype-9681a75b690a"></a>
### getCQNotifType()

```java
public int getCQNotifType()
```

<a id="m-getcqnotiftypestr-c4898653014c"></a>
### getCQNotifTypeStr()

```java
public String getCQNotifTypeStr()
```

<a id="m-getfaileddevices-70e71b879fad"></a>
### getFailedDevices()

```java
public java.util.Map<String,String> getFailedDevices()
```

<a id="m-getfailedservices-1b83786e5cef"></a>
### getFailedServices()

```java
public java.util.Map<String,com.tailf.conf.ConfList[]> getFailedServices()
```

Types: [ConfList](../conf/ConfList.md#cls-ConfList)

<a id="m-getlabel-72bf899bf6f1"></a>
### getLabel()

```java
public String getLabel()
```

<a id="m-gettimestamp-a9e0c6b457f8"></a>
### getTimestamp()

```java
public com.tailf.conf.ConfDatetime getTimestamp()
```

Types: [ConfDatetime](../conf/ConfDatetime.md#cls-ConfDatetime)

<a id="m-gettransientdevices-780e0b7cff26"></a>
### getTransientDevices()

```java
public java.util.Map<String,String> getTransientDevices()
```

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
