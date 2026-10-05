# HaNotification <a href="#cls-HaNotification" id="cls-HaNotification"></a>

```java
public class com.tailf.notif.HaNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for High Availability notifications.

## Members

**Constructors**:

- [HaNotification(int, int, ConfHaNode, boolean, int)](#m-HaNotification-7e618c9a58ab)

**Fields**:

- [HA_INFO_BESECONDARY_RESULT](#m-HA_INFO_BESECONDARY_RESULT)
- [HA_INFO_IS_NONE](#m-HA_INFO_IS_NONE)
- [HA_INFO_IS_PRIMARY](#m-HA_INFO_IS_PRIMARY)
- [HA_INFO_NOPRIMARY](#m-HA_INFO_NOPRIMARY)
- [HA_INFO_SECONDARY_ARRIVED](#m-HA_INFO_SECONDARY_ARRIVED)
- [HA_INFO_SECONDARY_DIED](#m-HA_INFO_SECONDARY_DIED)
- [HA_INFO_SECONDARY_INITIALIZED](#m-HA_INFO_SECONDARY_INITIALIZED)
- [type](Notification.md#m-type) from Notification

**Methods**:

- [beSecondaryResult()](#m-beSecondaryResult-4d03e9a6c1b0)
- [getHAInfoType()](#m-getHAInfoType-726331ca6854)
- [getHANode()](#m-getHANode-71f215e50750)
- [getNotificationType()](Notification.md#m-getNotificationType-f0e32b7b644f) from Notification
- [isCdbInitializedByCopy()](#m-isCdbInitializedByCopy-57e3c0fa65e3)
- [noPrimaryError()](#m-noPrimaryError-069bbf8e6194)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### HaNotification(int, int, ConfHaNode, boolean, int) <a href="#m-HaNotification-7e618c9a58ab" id="m-HaNotification-7e618c9a58ab"></a>

```java
public HaNotification(
    int haInfoType,
    int noPrimary,
    com.tailf.conf.ConfHaNode haNode,
    boolean cdbInitializedByCopy,
    int beSecondaryResult
)
```

Types: [ConfHaNode](../conf/ConfHaNode.md#cls-ConfHaNode)

**Parameters**

- `int haInfoType`
- `int noPrimary`
- `com.tailf.conf.ConfHaNode haNode`
- `boolean cdbInitializedByCopy`
- `int beSecondaryResult`


## Fields

### HA_INFO_BESECONDARY_RESULT <a href="#m-HA_INFO_BESECONDARY_RESULT" id="m-HA_INFO_BESECONDARY_RESULT"></a>

```java
public static final int HA_INFO_BESECONDARY_RESULT = 7;
```

### HA_INFO_IS_NONE <a href="#m-HA_INFO_IS_NONE" id="m-HA_INFO_IS_NONE"></a>

```java
public static final int HA_INFO_IS_NONE = 6;
```

### HA_INFO_IS_PRIMARY <a href="#m-HA_INFO_IS_PRIMARY" id="m-HA_INFO_IS_PRIMARY"></a>

```java
public static final int HA_INFO_IS_PRIMARY = 5;
```

### HA_INFO_NOPRIMARY <a href="#m-HA_INFO_NOPRIMARY" id="m-HA_INFO_NOPRIMARY"></a>

```java
public static final int HA_INFO_NOPRIMARY = 1;
```

### HA_INFO_SECONDARY_ARRIVED <a href="#m-HA_INFO_SECONDARY_ARRIVED" id="m-HA_INFO_SECONDARY_ARRIVED"></a>

```java
public static final int HA_INFO_SECONDARY_ARRIVED = 3;
```

### HA_INFO_SECONDARY_DIED <a href="#m-HA_INFO_SECONDARY_DIED" id="m-HA_INFO_SECONDARY_DIED"></a>

```java
public static final int HA_INFO_SECONDARY_DIED = 2;
```

### HA_INFO_SECONDARY_INITIALIZED <a href="#m-HA_INFO_SECONDARY_INITIALIZED" id="m-HA_INFO_SECONDARY_INITIALIZED"></a>

```java
public static final int HA_INFO_SECONDARY_INITIALIZED = 4;
```


## Methods

### beSecondaryResult() <a href="#m-beSecondaryResult-4d03e9a6c1b0" id="m-beSecondaryResult-4d03e9a6c1b0"></a>

```java
public int beSecondaryResult()
```

### getHAInfoType() <a href="#m-getHAInfoType-726331ca6854" id="m-getHAInfoType-726331ca6854"></a>

```java
public int getHAInfoType()
```

HA information type.


- [`HA_INFO_NOPRIMARY`](HaNotification.md#m-HA_INFO_NOPRIMARY)
   - [`HA_INFO_SECONDARY_DIED`](HaNotification.md#m-HA_INFO_SECONDARY_DIED)
     - [`HA_INFO_SECONDARY_ARRIVED`](HaNotification.md#m-HA_INFO_SECONDARY_ARRIVED)
       - [`HA_INFO_SECONDARY_INITIALIZED`](HaNotification.md#m-HA_INFO_SECONDARY_INITIALIZED)
         - [`HA_INFO_IS_PRIMARY`](HaNotification.md#m-HA_INFO_IS_PRIMARY)
           - [`HA_INFO_IS_NONE`](HaNotification.md#m-HA_INFO_IS_NONE)
             - [`HA_INFO_BESECONDARY_RESULT`](HaNotification.md#m-HA_INFO_BESECONDARY_RESULT)

### getHANode() <a href="#m-getHANode-71f215e50750" id="m-getHANode-71f215e50750"></a>

```java
public com.tailf.conf.ConfHaNode getHANode()
```

Types: [ConfHaNode](../conf/ConfHaNode.md#cls-ConfHaNode)

### isCdbInitializedByCopy() <a href="#m-isCdbInitializedByCopy-57e3c0fa65e3" id="m-isCdbInitializedByCopy-57e3c0fa65e3"></a>

```java
public boolean isCdbInitializedByCopy()
```

### noPrimaryError() <a href="#m-noPrimaryError-069bbf8e6194" id="m-noPrimaryError-069bbf8e6194"></a>

```java
public int noPrimaryError()
```

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
