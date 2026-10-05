# ForwardNotification <a href="#forwardnotification-1c104ab318e3" id="forwardnotification-1c104ab318e3"></a>

```java
public class com.tailf.notif.ForwardNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#notification-b2e7d82d4215)

Data structure for Forward agent events.

## Members

**Constructors**:

- [ForwardNotification(int, String, DpUserInfo)](#forwardnotification-d8ffcb00b317)

**Fields**:

- [FORWARD_INFO_DOWN](#forward_info_down-50e32f7b843b)
- [FORWARD_INFO_FAILED](#forward_info_failed-471dfab75a59)
- [FORWARD_INFO_UP](#forward_info_up-b2e514baf4d4)
- [type](Notification.md#type-6ebb3673fbb6) from Notification

**Methods**:

- [getForwardType()](#getforwardtype-7451db840024)
- [getNotificationType()](Notification.md#getnotificationtype-f0e32b7b644f) from Notification
- [getTarget()](#gettarget-c226120ea942)
- [getUserInfo()](#getuserinfo-3ecef1f24d3d)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### ForwardNotification(int, String, DpUserInfo) <a href="#forwardnotification-d8ffcb00b317" id="forwardnotification-d8ffcb00b317"></a>

```java
public ForwardNotification(int forwardType, String target, com.tailf.dp.DpUserInfo uinfo)
```

Types: [DpUserInfo](../dp/DpUserInfo.md#dpuserinfo-c59746285a6e)

**Parameters**

- `int forwardType`
- `String target`
- `com.tailf.dp.DpUserInfo uinfo`


## Fields

### FORWARD_INFO_DOWN <a href="#forward_info_down-50e32f7b843b" id="forward_info_down-50e32f7b843b"></a>

```java
public static final int FORWARD_INFO_DOWN = 2;
```

### FORWARD_INFO_FAILED <a href="#forward_info_failed-471dfab75a59" id="forward_info_failed-471dfab75a59"></a>

```java
public static final int FORWARD_INFO_FAILED = 3;
```

### FORWARD_INFO_UP <a href="#forward_info_up-b2e514baf4d4" id="forward_info_up-b2e514baf4d4"></a>

```java
public static final int FORWARD_INFO_UP = 1;
```


## Methods

### getForwardType() <a href="#getforwardtype-7451db840024" id="getforwardtype-7451db840024"></a>

```java
public int getForwardType()
```

forward event type:


- [`FORWARD_INFO_UP`](ForwardNotification.md#forward_info_up-b2e514baf4d4)
   - [`FORWARD_INFO_DOWN`](ForwardNotification.md#forward_info_down-50e32f7b843b)
     - [`FORWARD_INFO_FAILED`](ForwardNotification.md#forward_info_failed-471dfab75a59)

### getTarget() <a href="#gettarget-c226120ea942" id="gettarget-c226120ea942"></a>

```java
public String getTarget()
```

target name in confd.conf

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
