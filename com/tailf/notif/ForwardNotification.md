# ForwardNotification <a href="#cls-ForwardNotification" id="cls-ForwardNotification"></a>

```java
public class com.tailf.notif.ForwardNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for Forward agent events.

## Members

**Constructors**:

- [ForwardNotification(int, String, DpUserInfo)](#m-ForwardNotification-d8ffcb00b317)

**Fields**:

- [FORWARD_INFO_DOWN](#m-FORWARD_INFO_DOWN)
- [FORWARD_INFO_FAILED](#m-FORWARD_INFO_FAILED)
- [FORWARD_INFO_UP](#m-FORWARD_INFO_UP)
- [type](Notification.md#m-type) from Notification

**Methods**:

- [getForwardType()](#m-getForwardType-7451db840024)
- [getNotificationType()](Notification.md#m-getNotificationType-f0e32b7b644f) from Notification
- [getTarget()](#m-getTarget-c226120ea942)
- [getUserInfo()](#m-getUserInfo-3ecef1f24d3d)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### ForwardNotification(int, String, DpUserInfo) <a href="#m-ForwardNotification-d8ffcb00b317" id="m-ForwardNotification-d8ffcb00b317"></a>

```java
public ForwardNotification(int forwardType, String target, com.tailf.dp.DpUserInfo uinfo)
```

Types: [DpUserInfo](../dp/DpUserInfo.md#cls-DpUserInfo)

**Parameters**

- `int forwardType`
- `String target`
- `com.tailf.dp.DpUserInfo uinfo`


## Fields

### FORWARD_INFO_DOWN <a href="#m-FORWARD_INFO_DOWN" id="m-FORWARD_INFO_DOWN"></a>

```java
public static final int FORWARD_INFO_DOWN = 2;
```

### FORWARD_INFO_FAILED <a href="#m-FORWARD_INFO_FAILED" id="m-FORWARD_INFO_FAILED"></a>

```java
public static final int FORWARD_INFO_FAILED = 3;
```

### FORWARD_INFO_UP <a href="#m-FORWARD_INFO_UP" id="m-FORWARD_INFO_UP"></a>

```java
public static final int FORWARD_INFO_UP = 1;
```


## Methods

### getForwardType() <a href="#m-getForwardType-7451db840024" id="m-getForwardType-7451db840024"></a>

```java
public int getForwardType()
```

forward event type:


- [`FORWARD_INFO_UP`](ForwardNotification.md#m-FORWARD_INFO_UP)
   - [`FORWARD_INFO_DOWN`](ForwardNotification.md#m-FORWARD_INFO_DOWN)
     - [`FORWARD_INFO_FAILED`](ForwardNotification.md#m-FORWARD_INFO_FAILED)

### getTarget() <a href="#m-getTarget-c226120ea942" id="m-getTarget-c226120ea942"></a>

```java
public String getTarget()
```

target name in confd.conf

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
