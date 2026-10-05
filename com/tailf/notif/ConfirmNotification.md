# ConfirmNotification <a href="#confirmnotification-10447869c375" id="confirmnotification-10447869c375"></a>

```java
public class com.tailf.notif.ConfirmNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#notification-b2e7d82d4215)

Data structure for Confirmed commit notifications.

## Members

**Constructors**:

- [ConfirmNotification\(int, int, DpUserInfo\)](#confirmnotification-cb060c6a6027)

**Fields**:

- [ABORT\_COMMIT](#abort_commit-d43b0e4c5f2b)
- [CONFIRMED\_COMMIT](#confirmed_commit-7160edf150ed)
- [CONFIRMING\_COMMIT](#confirming_commit-49ccfaa64e7f)
- [type](Notification.md#type-6ebb3673fbb6) from Notification

**Methods**:

- [getConfirmType\(\)](#getconfirmtype-96b437a16009)
- [getNotificationType\(\)](Notification.md#getnotificationtype-f0e32b7b644f) from Notification
- [getTimeout\(\)](#gettimeout-c6606d7f7c00)
- [getUserInfo\(\)](#getuserinfo-3ecef1f24d3d)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### ConfirmNotification(int, int, DpUserInfo) <a href="#confirmnotification-cb060c6a6027" id="confirmnotification-cb060c6a6027"></a>

```java
public ConfirmNotification(int confirmType, int timeout, com.tailf.dp.DpUserInfo uinfo)
```

Types: [DpUserInfo](../dp/DpUserInfo.md#dpuserinfo-c59746285a6e)

**Parameters**

- `int confirmType`
- `int timeout`
- `com.tailf.dp.DpUserInfo uinfo`


## Fields

### ABORT_COMMIT <a href="#abort_commit-d43b0e4c5f2b" id="abort_commit-d43b0e4c5f2b"></a>

```java
public static final int ABORT_COMMIT = 3;
```

### CONFIRMED_COMMIT <a href="#confirmed_commit-7160edf150ed" id="confirmed_commit-7160edf150ed"></a>

```java
public static final int CONFIRMED_COMMIT = 1;
```

### CONFIRMING_COMMIT <a href="#confirming_commit-49ccfaa64e7f" id="confirming_commit-49ccfaa64e7f"></a>

```java
public static final int CONFIRMING_COMMIT = 2;
```


## Methods

### getConfirmType() <a href="#getconfirmtype-96b437a16009" id="getconfirmtype-96b437a16009"></a>

```java
public int getConfirmType()
```

confirm event type:


- [`CONFIRMED_COMMIT`](ConfirmNotification.md#confirmed_commit-7160edf150ed)
   - [`CONFIRMING_COMMIT`](ConfirmNotification.md#confirming_commit-49ccfaa64e7f)
     - [`ABORT_COMMIT`](ConfirmNotification.md#abort_commit-d43b0e4c5f2b)

### getTimeout() <a href="#gettimeout-c6606d7f7c00" id="gettimeout-c6606d7f7c00"></a>

```java
public int getTimeout()
```

timeout time in seconds timeout is  0 when type is
 CONFD_CONFIRMED_COMMIT, otherwise it is 0

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
