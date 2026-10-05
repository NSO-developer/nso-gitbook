<a id="cls-HaOrderType"></a>
# HaOrderType

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

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-BENONE"></a>
### BENONE

```java
public static final com.tailf.ha.HaOrderType BENONE;
```

Implies that the node should be removed from the cluster

<a id="m-BEPRIMARY"></a>
### BEPRIMARY

```java
public static final com.tailf.ha.HaOrderType BEPRIMARY;
```

Implies that the node should be primary in the cluster

<a id="m-BERELAY"></a>
### BERELAY

```java
public static final com.tailf.ha.HaOrderType BERELAY;
```

Implies that the secondary node should be a relay for other secondaries

<a id="m-BESECONDARY"></a>
### BESECONDARY

```java
public static final com.tailf.ha.HaOrderType BESECONDARY;
```

Implies that the node should be secondary in the cluster

<a id="m-GETSTATUS"></a>
### GETSTATUS

```java
public static final com.tailf.ha.HaOrderType GETSTATUS;
```

Retrieving node status information

<a id="m-SECONDARY_DEAD"></a>
### SECONDARY_DEAD

```java
public static final com.tailf.ha.HaOrderType SECONDARY_DEAD;
```

Reporting secondary node as dead


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

Get integer value representing this enum

**Returns:** integer value

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.ha.HaOrderType valueOf(String name)
```

Types: [HaOrderType](HaOrderType.md#cls-HaOrderType)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.ha.HaOrderType[] values()
```

Types: [HaOrderType](HaOrderType.md#cls-HaOrderType)
