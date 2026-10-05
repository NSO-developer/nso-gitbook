<a id="s-UpgradeNotification"></a>
# UpgradeNotification

```java
public class com.tailf.notif.UpgradeNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#s-Notification)

Data structure for upgrade notifications.

## Members

**Constructors**:

- [UpgradeNotification(int)](#s-UpgradeNotification-1)

**Fields**:

- [type](Notification.md#s-type) from Notification
- [UPGRADE_ABORTED](#s-UPGRADE_ABORTED)
- [UPGRADE_COMMITED](#s-UPGRADE_COMMITED)
- [UPGRADE_INIT_STARTED](#s-UPGRADE_INIT_STARTED)
- [UPGRADE_INIT_SUCCEEDED](#s-UPGRADE_INIT_SUCCEEDED)
- [UPGRADE_PERFORMED](#s-UPGRADE_PERFORMED)

**Methods**:

- [getNotificationType()](Notification.md#s-getNotificationType) from Notification
- [getUpgradeType()](#s-getUpgradeType)
- [toString()](#s-toString)

## Constructors

<a id="s-UpgradeNotification-1"></a>
### UpgradeNotification(int)

```java
public UpgradeNotification(int upgradeType)
```

**Parameters**

- `int upgradeType`


## Fields

<a id="s-UPGRADE_ABORTED"></a>
### UPGRADE_ABORTED

```java
public static final int UPGRADE_ABORTED = 5;
```

<a id="s-UPGRADE_COMMITED"></a>
### UPGRADE_COMMITED

```java
public static final int UPGRADE_COMMITED = 4;
```

<a id="s-UPGRADE_INIT_STARTED"></a>
### UPGRADE_INIT_STARTED

```java
public static final int UPGRADE_INIT_STARTED = 1;
```

<a id="s-UPGRADE_INIT_SUCCEEDED"></a>
### UPGRADE_INIT_SUCCEEDED

```java
public static final int UPGRADE_INIT_SUCCEEDED = 2;
```

<a id="s-UPGRADE_PERFORMED"></a>
### UPGRADE_PERFORMED

```java
public static final int UPGRADE_PERFORMED = 3;
```


## Methods

<a id="s-getUpgradeType"></a>
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

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
