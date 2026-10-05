<a id="cls-ForwardNotification"></a>
# ForwardNotification

```java
public class com.tailf.notif.ForwardNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for Forward agent events.

## Members

**Constructors**:

- [ForwardNotification(int, String, DpUserInfo)](#m-forwardnotification-d8ffcb00b317)

**Fields**:

- [FORWARD_INFO_DOWN](#m-FORWARD_INFO_DOWN)
- [FORWARD_INFO_FAILED](#m-FORWARD_INFO_FAILED)
- [FORWARD_INFO_UP](#m-FORWARD_INFO_UP)
- [type](Notification.md#m-type) from Notification

**Methods**:

- [getForwardType()](#m-getforwardtype-7451db840024)
- [getNotificationType()](Notification.md#m-getnotificationtype-f0e32b7b644f) from Notification
- [getTarget()](#m-gettarget-c226120ea942)
- [getUserInfo()](#m-getuserinfo-3ecef1f24d3d)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-forwardnotification-d8ffcb00b317"></a>
### ForwardNotification(int, String, DpUserInfo)

```java
public ForwardNotification(int forwardType, String target, com.tailf.dp.DpUserInfo uinfo)
```

Types: [DpUserInfo](../dp/DpUserInfo.md#cls-DpUserInfo)

**Parameters**

- `int forwardType`
- `String target`
- `com.tailf.dp.DpUserInfo uinfo`


## Fields

<a id="m-FORWARD_INFO_DOWN"></a>
### FORWARD_INFO_DOWN

```java
public static final int FORWARD_INFO_DOWN = 2;
```

<a id="m-FORWARD_INFO_FAILED"></a>
### FORWARD_INFO_FAILED

```java
public static final int FORWARD_INFO_FAILED = 3;
```

<a id="m-FORWARD_INFO_UP"></a>
### FORWARD_INFO_UP

```java
public static final int FORWARD_INFO_UP = 1;
```


## Methods

<a id="m-getforwardtype-7451db840024"></a>
### getForwardType()

```java
public int getForwardType()
```

forward event type:


- `#FORWARD_INFO_UP`
   - `#FORWARD_INFO_DOWN`
     - `#FORWARD_INFO_FAILED`

<a id="m-gettarget-c226120ea942"></a>
### getTarget()

```java
public String getTarget()
```

target name in confd.conf

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
