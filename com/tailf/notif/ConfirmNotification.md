<a id="cls-ConfirmNotification"></a>
# ConfirmNotification

```java
public class com.tailf.notif.ConfirmNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for Confirmed commit notifications.

## Members

**Constructors**:

- [ConfirmNotification(int, int, DpUserInfo)](#m-confirmnotification-cb060c6a6027)

**Fields**:

- [ABORT_COMMIT](#m-ABORT_COMMIT)
- [CONFIRMED_COMMIT](#m-CONFIRMED_COMMIT)
- [CONFIRMING_COMMIT](#m-CONFIRMING_COMMIT)
- [type](Notification.md#m-type) from Notification

**Methods**:

- [getConfirmType()](#m-getconfirmtype-96b437a16009)
- [getNotificationType()](Notification.md#m-getnotificationtype-f0e32b7b644f) from Notification
- [getTimeout()](#m-gettimeout-c6606d7f7c00)
- [getUserInfo()](#m-getuserinfo-3ecef1f24d3d)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-confirmnotification-cb060c6a6027"></a>
### ConfirmNotification(int, int, DpUserInfo)

```java
public ConfirmNotification(int confirmType, int timeout, com.tailf.dp.DpUserInfo uinfo)
```

Types: [DpUserInfo](../dp/DpUserInfo.md#cls-DpUserInfo)

**Parameters**

- `int confirmType`
- `int timeout`
- `com.tailf.dp.DpUserInfo uinfo`


## Fields

<a id="m-ABORT_COMMIT"></a>
### ABORT_COMMIT

```java
public static final int ABORT_COMMIT = 3;
```

<a id="m-CONFIRMED_COMMIT"></a>
### CONFIRMED_COMMIT

```java
public static final int CONFIRMED_COMMIT = 1;
```

<a id="m-CONFIRMING_COMMIT"></a>
### CONFIRMING_COMMIT

```java
public static final int CONFIRMING_COMMIT = 2;
```


## Methods

<a id="m-getconfirmtype-96b437a16009"></a>
### getConfirmType()

```java
public int getConfirmType()
```

confirm event type:


- `#CONFIRMED_COMMIT`
   - `#CONFIRMING_COMMIT`
     - `#ABORT_COMMIT`

<a id="m-gettimeout-c6606d7f7c00"></a>
### getTimeout()

```java
public int getTimeout()
```

timeout time in seconds timeout is  0 when type is
 CONFD_CONFIRMED_COMMIT, otherwise it is 0

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
