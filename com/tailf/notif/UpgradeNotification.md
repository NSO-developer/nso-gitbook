# UpgradeNotification <a href="#upgradenotification-8f9e3ffbdab5" id="upgradenotification-8f9e3ffbdab5"></a>

```java
public class com.tailf.notif.UpgradeNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#notification-b2e7d82d4215)

Data structure for upgrade notifications.

## Members

**Constructors**:

- [UpgradeNotification(int)](#upgradenotification-774f8693a908)

**Fields**:

- [type](Notification.md#type-6ebb3673fbb6) from Notification
- [UPGRADE_ABORTED](#upgrade_aborted-71c09d46aad2)
- [UPGRADE_COMMITED](#upgrade_commited-36d3b51c70ed)
- [UPGRADE_INIT_STARTED](#upgrade_init_started-b44e3b84ad61)
- [UPGRADE_INIT_SUCCEEDED](#upgrade_init_succeeded-d68a6ffb3124)
- [UPGRADE_PERFORMED](#upgrade_performed-a8adb28f5472)

**Methods**:

- [getNotificationType()](Notification.md#getnotificationtype-f0e32b7b644f) from Notification
- [getUpgradeType()](#getupgradetype-1f6c86f5dc3e)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### UpgradeNotification(int) <a href="#upgradenotification-774f8693a908" id="upgradenotification-774f8693a908"></a>

```java
public UpgradeNotification(int upgradeType)
```

**Parameters**

- `int upgradeType`


## Fields

### UPGRADE_ABORTED <a href="#upgrade_aborted-71c09d46aad2" id="upgrade_aborted-71c09d46aad2"></a>

```java
public static final int UPGRADE_ABORTED = 5;
```

### UPGRADE_COMMITED <a href="#upgrade_commited-36d3b51c70ed" id="upgrade_commited-36d3b51c70ed"></a>

```java
public static final int UPGRADE_COMMITED = 4;
```

### UPGRADE_INIT_STARTED <a href="#upgrade_init_started-b44e3b84ad61" id="upgrade_init_started-b44e3b84ad61"></a>

```java
public static final int UPGRADE_INIT_STARTED = 1;
```

### UPGRADE_INIT_SUCCEEDED <a href="#upgrade_init_succeeded-d68a6ffb3124" id="upgrade_init_succeeded-d68a6ffb3124"></a>

```java
public static final int UPGRADE_INIT_SUCCEEDED = 2;
```

### UPGRADE_PERFORMED <a href="#upgrade_performed-a8adb28f5472" id="upgrade_performed-a8adb28f5472"></a>

```java
public static final int UPGRADE_PERFORMED = 3;
```


## Methods

### getUpgradeType() <a href="#getupgradetype-1f6c86f5dc3e" id="getupgradetype-1f6c86f5dc3e"></a>

```java
public int getUpgradeType()
```

Upgrade event type:


- [`UPGRADE_INIT_STARTED`](UpgradeNotification.md#upgrade_init_started-b44e3b84ad61)
   - [`UPGRADE_INIT_SUCCEEDED`](UpgradeNotification.md#upgrade_init_succeeded-d68a6ffb3124)
     - [`UPGRADE_PERFORMED`](UpgradeNotification.md#upgrade_performed-a8adb28f5472)
       - [`UPGRADE_COMMITED`](UpgradeNotification.md#upgrade_commited-36d3b51c70ed)
         - [`UPGRADE_ABORTED`](UpgradeNotification.md#upgrade_aborted-71c09d46aad2)

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
