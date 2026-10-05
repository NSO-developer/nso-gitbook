<a id="cls-HaNotification"></a>
# HaNotification

```java
public class com.tailf.notif.HaNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#cls-Notification)

Data structure for High Availability notifications.

## Members

**Constructors**:

- [HaNotification(int, int, ConfHaNode, boolean, int)](#m-hanotification-7e618c9a58ab)

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

- [beSecondaryResult()](#m-besecondaryresult-4d03e9a6c1b0)
- [getHAInfoType()](#m-gethainfotype-726331ca6854)
- [getHANode()](#m-gethanode-71f215e50750)
- [getNotificationType()](Notification.md#m-getnotificationtype-f0e32b7b644f) from Notification
- [isCdbInitializedByCopy()](#m-iscdbinitializedbycopy-57e3c0fa65e3)
- [noPrimaryError()](#m-noprimaryerror-069bbf8e6194)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-hanotification-7e618c9a58ab"></a>
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

Types: [ConfHaNode](../conf/ConfHaNode.md#cls-ConfHaNode)

**Parameters**

- `int haInfoType`
- `int noPrimary`
- `com.tailf.conf.ConfHaNode haNode`
- `boolean cdbInitializedByCopy`
- `int beSecondaryResult`


## Fields

<a id="m-HA_INFO_BESECONDARY_RESULT"></a>
### HA_INFO_BESECONDARY_RESULT

```java
public static final int HA_INFO_BESECONDARY_RESULT = 7;
```

<a id="m-HA_INFO_IS_NONE"></a>
### HA_INFO_IS_NONE

```java
public static final int HA_INFO_IS_NONE = 6;
```

<a id="m-HA_INFO_IS_PRIMARY"></a>
### HA_INFO_IS_PRIMARY

```java
public static final int HA_INFO_IS_PRIMARY = 5;
```

<a id="m-HA_INFO_NOPRIMARY"></a>
### HA_INFO_NOPRIMARY

```java
public static final int HA_INFO_NOPRIMARY = 1;
```

<a id="m-HA_INFO_SECONDARY_ARRIVED"></a>
### HA_INFO_SECONDARY_ARRIVED

```java
public static final int HA_INFO_SECONDARY_ARRIVED = 3;
```

<a id="m-HA_INFO_SECONDARY_DIED"></a>
### HA_INFO_SECONDARY_DIED

```java
public static final int HA_INFO_SECONDARY_DIED = 2;
```

<a id="m-HA_INFO_SECONDARY_INITIALIZED"></a>
### HA_INFO_SECONDARY_INITIALIZED

```java
public static final int HA_INFO_SECONDARY_INITIALIZED = 4;
```


## Methods

<a id="m-besecondaryresult-4d03e9a6c1b0"></a>
### beSecondaryResult()

```java
public int beSecondaryResult()
```

<a id="m-gethainfotype-726331ca6854"></a>
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

<a id="m-gethanode-71f215e50750"></a>
### getHANode()

```java
public com.tailf.conf.ConfHaNode getHANode()
```

Types: [ConfHaNode](../conf/ConfHaNode.md#cls-ConfHaNode)

<a id="m-iscdbinitializedbycopy-57e3c0fa65e3"></a>
### isCdbInitializedByCopy()

```java
public boolean isCdbInitializedByCopy()
```

<a id="m-noprimaryerror-069bbf8e6194"></a>
### noPrimaryError()

```java
public int noPrimaryError()
```

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
