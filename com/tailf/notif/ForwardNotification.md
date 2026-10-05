<a id="s-ForwardNotification"></a>
# ForwardNotification

```java
public class com.tailf.notif.ForwardNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#s-Notification)

Data structure for Forward agent events.

## Members

**Constructors**:

- [ForwardNotification(int, String, DpUserInfo)](#s-ForwardNotification-1)

**Fields**:

- [FORWARD_INFO_DOWN](#s-FORWARD_INFO_DOWN)
- [FORWARD_INFO_FAILED](#s-FORWARD_INFO_FAILED)
- [FORWARD_INFO_UP](#s-FORWARD_INFO_UP)
- [type](Notification.md#s-type) from Notification

**Methods**:

- [getForwardType()](#s-getForwardType)
- [getNotificationType()](Notification.md#s-getNotificationType) from Notification
- [getTarget()](#s-getTarget)
- [getUserInfo()](#s-getUserInfo)
- [toString()](#s-toString)

## Constructors

<a id="s-ForwardNotification-1"></a>
### ForwardNotification(int, String, DpUserInfo)

```java
public ForwardNotification(int forwardType, String target, com.tailf.dp.DpUserInfo uinfo)
```

Types: [DpUserInfo](../dp/DpUserInfo.md#s-DpUserInfo)

**Parameters**

- `int forwardType`
- `String target`
- `com.tailf.dp.DpUserInfo uinfo`


## Fields

<a id="s-FORWARD_INFO_DOWN"></a>
### FORWARD_INFO_DOWN

```java
public static final int FORWARD_INFO_DOWN = 2;
```

<a id="s-FORWARD_INFO_FAILED"></a>
### FORWARD_INFO_FAILED

```java
public static final int FORWARD_INFO_FAILED = 3;
```

<a id="s-FORWARD_INFO_UP"></a>
### FORWARD_INFO_UP

```java
public static final int FORWARD_INFO_UP = 1;
```


## Methods

<a id="s-getForwardType"></a>
### getForwardType()

```java
public int getForwardType()
```

forward event type:


- `#FORWARD_INFO_UP`
   - `#FORWARD_INFO_DOWN`
     - `#FORWARD_INFO_FAILED`

<a id="s-getTarget"></a>
### getTarget()

```java
public String getTarget()
```

target name in confd.conf

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
