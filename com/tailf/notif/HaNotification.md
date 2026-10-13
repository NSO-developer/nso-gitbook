# HaNotification <a href="#hanotification-18807803b5fa" id="hanotification-18807803b5fa"></a>

```java
public class com.tailf.notif.HaNotification
    extends com.tailf.notif.Notification
```

Types: [Notification](Notification.md#notification-b2e7d82d4215)

Data structure for High Availability notifications.

## Members

**Constructors**:

- [HaNotification\(int, int, ConfHaNode, boolean, int\)](#hanotification-7e618c9a58ab)

**Fields**:

- [HA\_INFO\_BESECONDARY\_RESULT](#ha_info_besecondary_result-d7c07f4fc293)
- [HA\_INFO\_IS\_NONE](#ha_info_is_none-7887b586b950)
- [HA\_INFO\_IS\_PRIMARY](#ha_info_is_primary-480d29bb9a77)
- [HA\_INFO\_NOPRIMARY](#ha_info_noprimary-07eeb1051c35)
- [HA\_INFO\_SECONDARY\_ARRIVED](#ha_info_secondary_arrived-79ce1c211781)
- [HA\_INFO\_SECONDARY\_DIED](#ha_info_secondary_died-65cb8286382f)
- [HA\_INFO\_SECONDARY\_INITIALIZED](#ha_info_secondary_initialized-fec5b4b7f257)
- [type](Notification.md#type-6ebb3673fbb6) from Notification

**Methods**:

- [beSecondaryResult\(\)](#besecondaryresult-4d03e9a6c1b0)
- [getHAInfoType\(\)](#gethainfotype-726331ca6854)
- [getHANode\(\)](#gethanode-71f215e50750)
- [getNotificationType\(\)](Notification.md#getnotificationtype-f0e32b7b644f) from Notification
- [isCdbInitializedByCopy\(\)](#iscdbinitializedbycopy-57e3c0fa65e3)
- [noPrimaryError\(\)](#noprimaryerror-069bbf8e6194)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### HaNotification(int, int, ConfHaNode, boolean, int) <a href="#hanotification-7e618c9a58ab" id="hanotification-7e618c9a58ab"></a>

```java
public HaNotification(
    int haInfoType,
    int noPrimary,
    com.tailf.conf.ConfHaNode haNode,
    boolean cdbInitializedByCopy,
    int beSecondaryResult
)
```

Types: [ConfHaNode](../conf/ConfHaNode.md#confhanode-6a79a4c8e218)

**Parameters**

- `int haInfoType`
- `int noPrimary`
- `com.tailf.conf.ConfHaNode haNode`
- `boolean cdbInitializedByCopy`
- `int beSecondaryResult`


## Fields

### HA_INFO_BESECONDARY_RESULT <a href="#ha_info_besecondary_result-d7c07f4fc293" id="ha_info_besecondary_result-d7c07f4fc293"></a>

```java
public static final int HA_INFO_BESECONDARY_RESULT = 7;
```

### HA_INFO_IS_NONE <a href="#ha_info_is_none-7887b586b950" id="ha_info_is_none-7887b586b950"></a>

```java
public static final int HA_INFO_IS_NONE = 6;
```

### HA_INFO_IS_PRIMARY <a href="#ha_info_is_primary-480d29bb9a77" id="ha_info_is_primary-480d29bb9a77"></a>

```java
public static final int HA_INFO_IS_PRIMARY = 5;
```

### HA_INFO_NOPRIMARY <a href="#ha_info_noprimary-07eeb1051c35" id="ha_info_noprimary-07eeb1051c35"></a>

```java
public static final int HA_INFO_NOPRIMARY = 1;
```

### HA_INFO_SECONDARY_ARRIVED <a href="#ha_info_secondary_arrived-79ce1c211781" id="ha_info_secondary_arrived-79ce1c211781"></a>

```java
public static final int HA_INFO_SECONDARY_ARRIVED = 3;
```

### HA_INFO_SECONDARY_DIED <a href="#ha_info_secondary_died-65cb8286382f" id="ha_info_secondary_died-65cb8286382f"></a>

```java
public static final int HA_INFO_SECONDARY_DIED = 2;
```

### HA_INFO_SECONDARY_INITIALIZED <a href="#ha_info_secondary_initialized-fec5b4b7f257" id="ha_info_secondary_initialized-fec5b4b7f257"></a>

```java
public static final int HA_INFO_SECONDARY_INITIALIZED = 4;
```


## Methods

### beSecondaryResult() <a href="#besecondaryresult-4d03e9a6c1b0" id="besecondaryresult-4d03e9a6c1b0"></a>

```java
public int beSecondaryResult()
```

### getHAInfoType() <a href="#gethainfotype-726331ca6854" id="gethainfotype-726331ca6854"></a>

```java
public int getHAInfoType()
```

HA information type.


- [`HA_INFO_NOPRIMARY`](HaNotification.md#ha_info_noprimary-07eeb1051c35)
   - [`HA_INFO_SECONDARY_DIED`](HaNotification.md#ha_info_secondary_died-65cb8286382f)
     - [`HA_INFO_SECONDARY_ARRIVED`](HaNotification.md#ha_info_secondary_arrived-79ce1c211781)
       - [`HA_INFO_SECONDARY_INITIALIZED`](HaNotification.md#ha_info_secondary_initialized-fec5b4b7f257)
         - [`HA_INFO_IS_PRIMARY`](HaNotification.md#ha_info_is_primary-480d29bb9a77)
           - [`HA_INFO_IS_NONE`](HaNotification.md#ha_info_is_none-7887b586b950)
             - [`HA_INFO_BESECONDARY_RESULT`](HaNotification.md#ha_info_besecondary_result-d7c07f4fc293)

### getHANode() <a href="#gethanode-71f215e50750" id="gethanode-71f215e50750"></a>

```java
public com.tailf.conf.ConfHaNode getHANode()
```

Types: [ConfHaNode](../conf/ConfHaNode.md#confhanode-6a79a4c8e218)

### isCdbInitializedByCopy() <a href="#iscdbinitializedbycopy-57e3c0fa65e3" id="iscdbinitializedbycopy-57e3c0fa65e3"></a>

```java
public boolean isCdbInitializedByCopy()
```

### noPrimaryError() <a href="#noprimaryerror-069bbf8e6194" id="noprimaryerror-069bbf8e6194"></a>

```java
public int noPrimaryError()
```

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
