# HaOrderType <a href="#cls-HaOrderType" id="cls-HaOrderType"></a>

```java
public enum com.tailf.ha.HaOrderType
```

Types: [HaOrderType](HaOrderType.md#cls-HaOrderType)

enum for the different HA cluster protocol operations Used internally by the
 api.

## Members

**Enum Constants**:

- [BENONE](#m-BENONE)
- [BEPRIMARY](#m-BEPRIMARY)
- [BERELAY](#m-BERELAY)
- [BESECONDARY](#m-BESECONDARY)
- [GETSTATUS](#m-GETSTATUS)
- [SECONDARY_DEAD](#m-SECONDARY_DEAD)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### BENONE <a href="#m-BENONE" id="m-BENONE"></a>

```java
public static final com.tailf.ha.HaOrderType BENONE;
```

Implies that the node should be removed from the cluster

### BEPRIMARY <a href="#m-BEPRIMARY" id="m-BEPRIMARY"></a>

```java
public static final com.tailf.ha.HaOrderType BEPRIMARY;
```

Implies that the node should be primary in the cluster

### BERELAY <a href="#m-BERELAY" id="m-BERELAY"></a>

```java
public static final com.tailf.ha.HaOrderType BERELAY;
```

Implies that the secondary node should be a relay for other secondaries

### BESECONDARY <a href="#m-BESECONDARY" id="m-BESECONDARY"></a>

```java
public static final com.tailf.ha.HaOrderType BESECONDARY;
```

Implies that the node should be secondary in the cluster

### GETSTATUS <a href="#m-GETSTATUS" id="m-GETSTATUS"></a>

```java
public static final com.tailf.ha.HaOrderType GETSTATUS;
```

Retrieving node status information

### SECONDARY_DEAD <a href="#m-SECONDARY_DEAD" id="m-SECONDARY_DEAD"></a>

```java
public static final com.tailf.ha.HaOrderType SECONDARY_DEAD;
```

Reporting secondary node as dead


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

Get integer value representing this enum

**Returns:** integer value

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.ha.HaOrderType valueOf(String name)
```

Types: [HaOrderType](HaOrderType.md#cls-HaOrderType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.ha.HaOrderType[] values()
```

Types: [HaOrderType](HaOrderType.md#cls-HaOrderType)
