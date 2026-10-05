<a id="cls-UpgradeNotification"></a>
# UpgradeNotification

```java
public class com.tailf.notif.UpgradeNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for upgrade notifications.

## Members

**Constructors**:

- [UpgradeNotification(int)](#m-upgradenotification-774f8693a908)

**Fields**:

- [type](Notification.md#m-type) from Notification
- [UPGRADE_ABORTED](#m-UPGRADE_ABORTED)
- [UPGRADE_COMMITED](#m-UPGRADE_COMMITED)
- [UPGRADE_INIT_STARTED](#m-UPGRADE_INIT_STARTED)
- [UPGRADE_INIT_SUCCEEDED](#m-UPGRADE_INIT_SUCCEEDED)
- [UPGRADE_PERFORMED](#m-UPGRADE_PERFORMED)

**Methods**:

- [getNotificationType()](Notification.md#m-getnotificationtype-f0e32b7b644f) from Notification
- [getUpgradeType()](#m-getupgradetype-1f6c86f5dc3e)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-upgradenotification-774f8693a908"></a>
### UpgradeNotification(int)

```java
public UpgradeNotification(int upgradeType)
```

**Parameters**

- `int upgradeType`


## Fields

<a id="m-UPGRADE_ABORTED"></a>
### UPGRADE_ABORTED

```java
public static final int UPGRADE_ABORTED = 5;
```

<a id="m-UPGRADE_COMMITED"></a>
### UPGRADE_COMMITED

```java
public static final int UPGRADE_COMMITED = 4;
```

<a id="m-UPGRADE_INIT_STARTED"></a>
### UPGRADE_INIT_STARTED

```java
public static final int UPGRADE_INIT_STARTED = 1;
```

<a id="m-UPGRADE_INIT_SUCCEEDED"></a>
### UPGRADE_INIT_SUCCEEDED

```java
public static final int UPGRADE_INIT_SUCCEEDED = 2;
```

<a id="m-UPGRADE_PERFORMED"></a>
### UPGRADE_PERFORMED

```java
public static final int UPGRADE_PERFORMED = 3;
```


## Methods

<a id="m-getupgradetype-1f6c86f5dc3e"></a>
### getUpgradeType()

```java
public int getUpgradeType()
```

Upgrade event type:


- `#UPGRADE_INIT_STARTED`
   - `#UPGRADE_INIT_SUCCEEDED`
     - `#UPGRADE_PERFORMED`
       - `#UPGRADE_COMMITED`
         - `#UPGRADE_ABORTED`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
