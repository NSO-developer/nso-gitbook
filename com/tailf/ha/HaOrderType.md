<a id="s-HaOrderType"></a>
# HaOrderType

```java
public enum com.tailf.ha.HaOrderType
```

Types: [HaOrderType](HaOrderType.md#s-HaOrderType)

enum for the different HA cluster protocol operations Used internally by the
 api.

**Related classes**

- [HaOrderType](HaOrderType.md#s-HaOrderType)

## Members

**Enum Constants**:

- [BENONE](#s-BENONE)
- [BEPRIMARY](#s-BEPRIMARY)
- [BERELAY](#s-BERELAY)
- [BESECONDARY](#s-BESECONDARY)
- [GETSTATUS](#s-GETSTATUS)
- [SECONDARY_DEAD](#s-SECONDARY_DEAD)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-BENONE"></a>
### BENONE

```java
public static final com.tailf.ha.HaOrderType BENONE;
```

Implies that the node should be removed from the cluster

<a id="s-BEPRIMARY"></a>
### BEPRIMARY

```java
public static final com.tailf.ha.HaOrderType BEPRIMARY;
```

Implies that the node should be primary in the cluster

<a id="s-BERELAY"></a>
### BERELAY

```java
public static final com.tailf.ha.HaOrderType BERELAY;
```

Implies that the secondary node should be a relay for other secondaries

<a id="s-BESECONDARY"></a>
### BESECONDARY

```java
public static final com.tailf.ha.HaOrderType BESECONDARY;
```

Implies that the node should be secondary in the cluster

<a id="s-GETSTATUS"></a>
### GETSTATUS

```java
public static final com.tailf.ha.HaOrderType GETSTATUS;
```

Retrieving node status information

<a id="s-SECONDARY_DEAD"></a>
### SECONDARY_DEAD

```java
public static final com.tailf.ha.HaOrderType SECONDARY_DEAD;
```

Reporting secondary node as dead


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

Get integer value representing this enum

**Returns:** integer value

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.ha.HaOrderType valueOf(String name)
```

Types: [HaOrderType](HaOrderType.md#s-HaOrderType)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.ha.HaOrderType[] values()
```

Types: [HaOrderType](HaOrderType.md#s-HaOrderType)
