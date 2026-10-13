# CommitQueueProgressNotification <a href="#commitqueueprogressnotification-a2a32afaa4c3" id="commitqueueprogressnotification-a2a32afaa4c3"></a>

```java
public class com.tailf.notif.CommitQueueProgressNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#notification-b2e7d82d4215)

Data structure for commit queue progress notifications.

## Members

**Constructors**:

- [CommitQueueProgressNotification\(int, ConfDatetime, ConfUInt64, String, List\<String\>, Map\<String,String\>, Map\<String,String\>, Map\<String,ConfList\>, Map\<String,ConfList\[\]\>\)](#commitqueueprogressnotification-c3a908d74df6)

**Fields**:

- [NCS\_CQ\_ITEM\_COMPLETED](#ncs_cq_item_completed-5a52f20ca5b4)
- [NCS\_CQ\_ITEM\_DELETED](#ncs_cq_item_deleted-bc65719e4d53)
- [NCS\_CQ\_ITEM\_EXECUTING](#ncs_cq_item_executing-cb9cee847591)
- [NCS\_CQ\_ITEM\_FAILED](#ncs_cq_item_failed-397c593dc04a)
- [NCS\_CQ\_ITEM\_LOCKED](#ncs_cq_item_locked-680f05ab0c8e)
- [NCS\_CQ\_ITEM\_WAITING](#ncs_cq_item_waiting-5f2a79031172)
- [type](Notification.md#type-6ebb3673fbb6) from Notification

**Methods**:

- [getCompletedDevices\(\)](#getcompleteddevices-5d4f1d403427)
- [getCompletedServices\(\)](#getcompletedservices-8efb6940a788)
- [getCQId\(\)](#getcqid-1138a32e494a)
- [getCQNotifType\(\)](#getcqnotiftype-9681a75b690a)
- [getCQNotifTypeStr\(\)](#getcqnotiftypestr-c4898653014c)
- [getFailedDevices\(\)](#getfaileddevices-70e71b879fad)
- [getFailedServices\(\)](#getfailedservices-1b83786e5cef)
- [getLabel\(\)](#getlabel-72bf899bf6f1)
- [getNotificationType\(\)](Notification.md#getnotificationtype-f0e32b7b644f) from Notification
- [getTimestamp\(\)](#gettimestamp-a9e0c6b457f8)
- [getTransientDevices\(\)](#gettransientdevices-780e0b7cff26)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### CommitQueueProgressNotification(int, ConfDatetime, ConfUInt64, String, List&lt;String&gt;, Map&lt;String,String&gt;, Map&lt;String,String&gt;, Map&lt;String,ConfList&gt;, Map&lt;String,ConfList[]&gt;) <a href="#commitqueueprogressnotification-c3a908d74df6" id="commitqueueprogressnotification-c3a908d74df6"></a>

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

Types: [ConfDatetime](../conf/ConfDatetime.md#confdatetime-8f67d7ff6ae8), [ConfUInt64](../conf/ConfUInt64.md#confuint64-c6c48fa366b2), [ConfList](../conf/ConfList.md#conflist-a9c192ad3c99)

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

### NCS_CQ_ITEM_COMPLETED <a href="#ncs_cq_item_completed-5a52f20ca5b4" id="ncs_cq_item_completed-5a52f20ca5b4"></a>

```java
public static final int NCS_CQ_ITEM_COMPLETED = 4;
```

### NCS_CQ_ITEM_DELETED <a href="#ncs_cq_item_deleted-bc65719e4d53" id="ncs_cq_item_deleted-bc65719e4d53"></a>

```java
public static final int NCS_CQ_ITEM_DELETED = 6;
```

### NCS_CQ_ITEM_EXECUTING <a href="#ncs_cq_item_executing-cb9cee847591" id="ncs_cq_item_executing-cb9cee847591"></a>

```java
public static final int NCS_CQ_ITEM_EXECUTING = 2;
```

### NCS_CQ_ITEM_FAILED <a href="#ncs_cq_item_failed-397c593dc04a" id="ncs_cq_item_failed-397c593dc04a"></a>

```java
public static final int NCS_CQ_ITEM_FAILED = 5;
```

### NCS_CQ_ITEM_LOCKED <a href="#ncs_cq_item_locked-680f05ab0c8e" id="ncs_cq_item_locked-680f05ab0c8e"></a>

```java
public static final int NCS_CQ_ITEM_LOCKED = 3;
```

### NCS_CQ_ITEM_WAITING <a href="#ncs_cq_item_waiting-5f2a79031172" id="ncs_cq_item_waiting-5f2a79031172"></a>

```java
public static final int NCS_CQ_ITEM_WAITING = 1;
```


## Methods

### getCompletedDevices() <a href="#getcompleteddevices-5d4f1d403427" id="getcompleteddevices-5d4f1d403427"></a>

```java
public java.util.List<String> getCompletedDevices()
```

### getCompletedServices() <a href="#getcompletedservices-8efb6940a788" id="getcompletedservices-8efb6940a788"></a>

```java
public java.util.Map<String,com.tailf.conf.ConfList> getCompletedServices()
```

Types: [ConfList](../conf/ConfList.md#conflist-a9c192ad3c99)

### getCQId() <a href="#getcqid-1138a32e494a" id="getcqid-1138a32e494a"></a>

```java
public com.tailf.conf.ConfUInt64 getCQId()
```

Types: [ConfUInt64](../conf/ConfUInt64.md#confuint64-c6c48fa366b2)

### getCQNotifType() <a href="#getcqnotiftype-9681a75b690a" id="getcqnotiftype-9681a75b690a"></a>

```java
public int getCQNotifType()
```

### getCQNotifTypeStr() <a href="#getcqnotiftypestr-c4898653014c" id="getcqnotiftypestr-c4898653014c"></a>

```java
public String getCQNotifTypeStr()
```

### getFailedDevices() <a href="#getfaileddevices-70e71b879fad" id="getfaileddevices-70e71b879fad"></a>

```java
public java.util.Map<String,String> getFailedDevices()
```

### getFailedServices() <a href="#getfailedservices-1b83786e5cef" id="getfailedservices-1b83786e5cef"></a>

```java
public java.util.Map<String,com.tailf.conf.ConfList[]> getFailedServices()
```

Types: [ConfList](../conf/ConfList.md#conflist-a9c192ad3c99)

### getLabel() <a href="#getlabel-72bf899bf6f1" id="getlabel-72bf899bf6f1"></a>

```java
public String getLabel()
```

### getTimestamp() <a href="#gettimestamp-a9e0c6b457f8" id="gettimestamp-a9e0c6b457f8"></a>

```java
public com.tailf.conf.ConfDatetime getTimestamp()
```

Types: [ConfDatetime](../conf/ConfDatetime.md#confdatetime-8f67d7ff6ae8)

### getTransientDevices() <a href="#gettransientdevices-780e0b7cff26" id="gettransientdevices-780e0b7cff26"></a>

```java
public java.util.Map<String,String> getTransientDevices()
```

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
