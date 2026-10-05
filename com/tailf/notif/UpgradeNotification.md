# UpgradeNotification <a href="#cls-UpgradeNotification" id="cls-UpgradeNotification"></a>

```java
public class com.tailf.notif.UpgradeNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for upgrade notifications.

## Members

**Constructors**:

- [UpgradeNotification(int)](#m-UpgradeNotification-774f8693a908)

**Fields**:

- [type](Notification.md#m-type) from Notification
- [UPGRADE_ABORTED](#m-UPGRADE_ABORTED)
- [UPGRADE_COMMITED](#m-UPGRADE_COMMITED)
- [UPGRADE_INIT_STARTED](#m-UPGRADE_INIT_STARTED)
- [UPGRADE_INIT_SUCCEEDED](#m-UPGRADE_INIT_SUCCEEDED)
- [UPGRADE_PERFORMED](#m-UPGRADE_PERFORMED)

**Methods**:

- [getNotificationType()](Notification.md#m-getNotificationType-f0e32b7b644f) from Notification
- [getUpgradeType()](#m-getUpgradeType-1f6c86f5dc3e)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### UpgradeNotification(int) <a href="#m-UpgradeNotification-774f8693a908" id="m-UpgradeNotification-774f8693a908"></a>

```java
public UpgradeNotification(int upgradeType)
```

**Parameters**

- `int upgradeType`


## Fields

### UPGRADE_ABORTED <a href="#m-UPGRADE_ABORTED" id="m-UPGRADE_ABORTED"></a>

```java
public static final int UPGRADE_ABORTED = 5;
```

### UPGRADE_COMMITED <a href="#m-UPGRADE_COMMITED" id="m-UPGRADE_COMMITED"></a>

```java
public static final int UPGRADE_COMMITED = 4;
```

### UPGRADE_INIT_STARTED <a href="#m-UPGRADE_INIT_STARTED" id="m-UPGRADE_INIT_STARTED"></a>

```java
public static final int UPGRADE_INIT_STARTED = 1;
```

### UPGRADE_INIT_SUCCEEDED <a href="#m-UPGRADE_INIT_SUCCEEDED" id="m-UPGRADE_INIT_SUCCEEDED"></a>

```java
public static final int UPGRADE_INIT_SUCCEEDED = 2;
```

### UPGRADE_PERFORMED <a href="#m-UPGRADE_PERFORMED" id="m-UPGRADE_PERFORMED"></a>

```java
public static final int UPGRADE_PERFORMED = 3;
```


## Methods

### getUpgradeType() <a href="#m-getUpgradeType-1f6c86f5dc3e" id="m-getUpgradeType-1f6c86f5dc3e"></a>

```java
public int getUpgradeType()
```

Upgrade event type:


- [`UPGRADE_INIT_STARTED`](UpgradeNotification.md#m-UPGRADE_INIT_STARTED)
   - [`UPGRADE_INIT_SUCCEEDED`](UpgradeNotification.md#m-UPGRADE_INIT_SUCCEEDED)
     - [`UPGRADE_PERFORMED`](UpgradeNotification.md#m-UPGRADE_PERFORMED)
       - [`UPGRADE_COMMITED`](UpgradeNotification.md#m-UPGRADE_COMMITED)
         - [`UPGRADE_ABORTED`](UpgradeNotification.md#m-UPGRADE_ABORTED)

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
