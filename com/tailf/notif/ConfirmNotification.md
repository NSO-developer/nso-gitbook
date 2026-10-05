<a id="s-ConfirmNotification"></a>
# ConfirmNotification

```java
public class com.tailf.notif.ConfirmNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#s-Notification)

Data structure for Confirmed commit notifications.

## Members

**Constructors**:

- [ConfirmNotification(int, int, DpUserInfo)](#s-ConfirmNotification-1)

**Fields**:

- [ABORT_COMMIT](#s-ABORT_COMMIT)
- [CONFIRMED_COMMIT](#s-CONFIRMED_COMMIT)
- [CONFIRMING_COMMIT](#s-CONFIRMING_COMMIT)
- [type](Notification.md#s-type) from Notification

**Methods**:

- [getConfirmType()](#s-getConfirmType)
- [getNotificationType()](Notification.md#s-getNotificationType) from Notification
- [getTimeout()](#s-getTimeout)
- [getUserInfo()](#s-getUserInfo)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfirmNotification-1"></a>
### ConfirmNotification(int, int, DpUserInfo)

```java
public ConfirmNotification(int confirmType, int timeout, com.tailf.dp.DpUserInfo uinfo)
```

Types: [DpUserInfo](../dp/DpUserInfo.md#s-DpUserInfo)

**Parameters**

- `int confirmType`
- `int timeout`
- `com.tailf.dp.DpUserInfo uinfo`


## Fields

<a id="s-ABORT_COMMIT"></a>
### ABORT_COMMIT

```java
public static final int ABORT_COMMIT = 3;
```

<a id="s-CONFIRMED_COMMIT"></a>
### CONFIRMED_COMMIT

```java
public static final int CONFIRMED_COMMIT = 1;
```

<a id="s-CONFIRMING_COMMIT"></a>
### CONFIRMING_COMMIT

```java
public static final int CONFIRMING_COMMIT = 2;
```


## Methods

<a id="s-getConfirmType"></a>
### getConfirmType()

```java
public int getConfirmType()
```

confirm event type:


- `#CONFIRMED_COMMIT`
   - `#CONFIRMING_COMMIT`
     - `#ABORT_COMMIT`

<a id="s-getTimeout"></a>
### getTimeout()

```java
public int getTimeout()
```

timeout time in seconds timeout is  0 when type is
 CONFD_CONFIRMED_COMMIT, otherwise it is 0

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
