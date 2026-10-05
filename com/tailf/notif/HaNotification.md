<a id="s-HaNotification"></a>
# HaNotification

```java
public class com.tailf.notif.HaNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#s-Notification)

Data structure for High Availability notifications.

## Members

**Constructors**:

- [HaNotification(int, int, ConfHaNode, boolean, int)](#s-HaNotification-1)

**Fields**:

- [HA_INFO_BESECONDARY_RESULT](#s-HA_INFO_BESECONDARY_RESULT)
- [HA_INFO_IS_NONE](#s-HA_INFO_IS_NONE)
- [HA_INFO_IS_PRIMARY](#s-HA_INFO_IS_PRIMARY)
- [HA_INFO_NOPRIMARY](#s-HA_INFO_NOPRIMARY)
- [HA_INFO_SECONDARY_ARRIVED](#s-HA_INFO_SECONDARY_ARRIVED)
- [HA_INFO_SECONDARY_DIED](#s-HA_INFO_SECONDARY_DIED)
- [HA_INFO_SECONDARY_INITIALIZED](#s-HA_INFO_SECONDARY_INITIALIZED)
- [type](Notification.md#s-type) from Notification

**Methods**:

- [beSecondaryResult()](#s-beSecondaryResult)
- [getHAInfoType()](#s-getHAInfoType)
- [getHANode()](#s-getHANode)
- [getNotificationType()](Notification.md#s-getNotificationType) from Notification
- [isCdbInitializedByCopy()](#s-isCdbInitializedByCopy)
- [noPrimaryError()](#s-noPrimaryError)
- [toString()](#s-toString)

## Constructors

<a id="s-HaNotification-1"></a>
### HaNotification(int, int, ConfHaNode, boolean, int)

```java
public HaNotification(
    int haInfoType,
    int noPrimary,
    com.tailf.conf.ConfHaNode haNode,
    boolean cdbInitializedByCopy,
    int beSecondaryResult
)
```

Types: [ConfHaNode](../conf/ConfHaNode.md#s-ConfHaNode)

**Parameters**

- `int haInfoType`
- `int noPrimary`
- `com.tailf.conf.ConfHaNode haNode`
- `boolean cdbInitializedByCopy`
- `int beSecondaryResult`


## Fields

<a id="s-HA_INFO_BESECONDARY_RESULT"></a>
### HA_INFO_BESECONDARY_RESULT

```java
public static final int HA_INFO_BESECONDARY_RESULT = 7;
```

<a id="s-HA_INFO_IS_NONE"></a>
### HA_INFO_IS_NONE

```java
public static final int HA_INFO_IS_NONE = 6;
```

<a id="s-HA_INFO_IS_PRIMARY"></a>
### HA_INFO_IS_PRIMARY

```java
public static final int HA_INFO_IS_PRIMARY = 5;
```

<a id="s-HA_INFO_NOPRIMARY"></a>
### HA_INFO_NOPRIMARY

```java
public static final int HA_INFO_NOPRIMARY = 1;
```

<a id="s-HA_INFO_SECONDARY_ARRIVED"></a>
### HA_INFO_SECONDARY_ARRIVED

```java
public static final int HA_INFO_SECONDARY_ARRIVED = 3;
```

<a id="s-HA_INFO_SECONDARY_DIED"></a>
### HA_INFO_SECONDARY_DIED

```java
public static final int HA_INFO_SECONDARY_DIED = 2;
```

<a id="s-HA_INFO_SECONDARY_INITIALIZED"></a>
### HA_INFO_SECONDARY_INITIALIZED

```java
public static final int HA_INFO_SECONDARY_INITIALIZED = 4;
```


## Methods

<a id="s-beSecondaryResult"></a>
### beSecondaryResult()

```java
public int beSecondaryResult()
```

<a id="s-getHAInfoType"></a>
### getHAInfoType()

```java
public int getHAInfoType()
```

HA information type.


- `#HA_INFO_NOPRIMARY`
   - `#HA_INFO_SECONDARY_DIED`
     - `#HA_INFO_SECONDARY_ARRIVED`
       - `#HA_INFO_SECONDARY_INITIALIZED`
         - `#HA_INFO_IS_PRIMARY`
           - `#HA_INFO_IS_NONE`
             - `#HA_INFO_BESECONDARY_RESULT`

<a id="s-getHANode"></a>
### getHANode()

```java
public com.tailf.conf.ConfHaNode getHANode()
```

Types: [ConfHaNode](../conf/ConfHaNode.md#s-ConfHaNode)

<a id="s-isCdbInitializedByCopy"></a>
### isCdbInitializedByCopy()

```java
public boolean isCdbInitializedByCopy()
```

<a id="s-noPrimaryError"></a>
### noPrimaryError()

```java
public int noPrimaryError()
```

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
