# HaOrderType <a href="#haordertype-0276888fecca" id="haordertype-0276888fecca"></a>

```java
public enum com.tailf.ha.HaOrderType
```

enum for the different HA cluster protocol operations Used internally by the
 api.

## Members

**Enum Constants**:

- [BENONE](#benone-8943c52731fc)
- [BEPRIMARY](#beprimary-e01813d10d2e)
- [BERELAY](#berelay-4319cee8cab8)
- [BESECONDARY](#besecondary-a9ff5fc98372)
- [GETSTATUS](#getstatus-8b73e123eca8)
- [SECONDARY\_DEAD](#secondary_dead-dbf3430fbfb9)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### BENONE <a href="#benone-8943c52731fc" id="benone-8943c52731fc"></a>

```java
BENONE(3);
```

Implies that the node should be removed from the cluster

### BEPRIMARY <a href="#beprimary-e01813d10d2e" id="beprimary-e01813d10d2e"></a>

```java
BEPRIMARY(1);
```

Implies that the node should be primary in the cluster

### BERELAY <a href="#berelay-4319cee8cab8" id="berelay-4319cee8cab8"></a>

```java
BERELAY(6);
```

Implies that the secondary node should be a relay for other secondaries

### BESECONDARY <a href="#besecondary-a9ff5fc98372" id="besecondary-a9ff5fc98372"></a>

```java
BESECONDARY(2);
```

Implies that the node should be secondary in the cluster

### GETSTATUS <a href="#getstatus-8b73e123eca8" id="getstatus-8b73e123eca8"></a>

```java
GETSTATUS(4);
```

Retrieving node status information

### SECONDARY_DEAD <a href="#secondary_dead-dbf3430fbfb9" id="secondary_dead-dbf3430fbfb9"></a>

```java
SECONDARY_DEAD(5);
```

Reporting secondary node as dead


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

Get integer value representing this enum

**Returns:** integer value

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.ha.HaOrderType valueOf(String name)
```

Types: [HaOrderType](HaOrderType.md#haordertype-0276888fecca)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.ha.HaOrderType[] values()
```

Types: [HaOrderType](HaOrderType.md#haordertype-0276888fecca)
