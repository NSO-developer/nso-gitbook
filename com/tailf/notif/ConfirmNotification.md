# ConfirmNotification <a href="#cls-ConfirmNotification" id="cls-ConfirmNotification"></a>

```java
public class com.tailf.notif.ConfirmNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for Confirmed commit notifications.

## Members

**Constructors**:

- [ConfirmNotification(int, int, DpUserInfo)](#m-ConfirmNotification-cb060c6a6027)

**Fields**:

- [ABORT_COMMIT](#m-ABORT_COMMIT)
- [CONFIRMED_COMMIT](#m-CONFIRMED_COMMIT)
- [CONFIRMING_COMMIT](#m-CONFIRMING_COMMIT)
- [type](Notification.md#m-type) from Notification

**Methods**:

- [getConfirmType()](#m-getConfirmType-96b437a16009)
- [getNotificationType()](Notification.md#m-getNotificationType-f0e32b7b644f) from Notification
- [getTimeout()](#m-getTimeout-c6606d7f7c00)
- [getUserInfo()](#m-getUserInfo-3ecef1f24d3d)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### ConfirmNotification(int, int, DpUserInfo) <a href="#m-ConfirmNotification-cb060c6a6027" id="m-ConfirmNotification-cb060c6a6027"></a>

```java
public ConfirmNotification(int confirmType, int timeout, com.tailf.dp.DpUserInfo uinfo)
```

Types: [DpUserInfo](../dp/DpUserInfo.md#cls-DpUserInfo)

**Parameters**

- `int confirmType`
- `int timeout`
- `com.tailf.dp.DpUserInfo uinfo`


## Fields

### ABORT_COMMIT <a href="#m-ABORT_COMMIT" id="m-ABORT_COMMIT"></a>

```java
public static final int ABORT_COMMIT = 3;
```

### CONFIRMED_COMMIT <a href="#m-CONFIRMED_COMMIT" id="m-CONFIRMED_COMMIT"></a>

```java
public static final int CONFIRMED_COMMIT = 1;
```

### CONFIRMING_COMMIT <a href="#m-CONFIRMING_COMMIT" id="m-CONFIRMING_COMMIT"></a>

```java
public static final int CONFIRMING_COMMIT = 2;
```


## Methods

### getConfirmType() <a href="#m-getConfirmType-96b437a16009" id="m-getConfirmType-96b437a16009"></a>

```java
public int getConfirmType()
```

confirm event type:


- [`CONFIRMED_COMMIT`](ConfirmNotification.md#m-CONFIRMED_COMMIT)
   - [`CONFIRMING_COMMIT`](ConfirmNotification.md#m-CONFIRMING_COMMIT)
     - [`ABORT_COMMIT`](ConfirmNotification.md#m-ABORT_COMMIT)

### getTimeout() <a href="#m-getTimeout-c6606d7f7c00" id="m-getTimeout-c6606d7f7c00"></a>

```java
public int getTimeout()
```

timeout time in seconds timeout is  0 when type is
 CONFD_CONFIRMED_COMMIT, otherwise it is 0

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
