# HaStateType <a href="#cls-HaStateType" id="cls-HaStateType"></a>

```java
public enum com.tailf.ha.HaStateType
```

Types: [HaStateType](HaStateType.md#cls-HaStateType)

This enum describes the different states a HA node can be in.

## Members

**Enum Constants**:

- [NONE](#m-NONE)
- [PRIMARY](#m-PRIMARY)
- [SECONDARY](#m-SECONDARY)
- [SECONDARY_RELAY](#m-SECONDARY_RELAY)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(int)](#m-valueOf-c0d46d25fc67)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### NONE <a href="#m-NONE" id="m-NONE"></a>

```java
public static final com.tailf.ha.HaStateType NONE;
```

NONE implies that the node is not participating in a HA cluster.

### PRIMARY <a href="#m-PRIMARY" id="m-PRIMARY"></a>

```java
public static final com.tailf.ha.HaStateType PRIMARY;
```

PRIMARY implies that the node is primary in a HA cluster.

### SECONDARY <a href="#m-SECONDARY" id="m-SECONDARY"></a>

```java
public static final com.tailf.ha.HaStateType SECONDARY;
```

SECONDARY implies that the node is secondary in a HA cluster.

### SECONDARY_RELAY <a href="#m-SECONDARY_RELAY" id="m-SECONDARY_RELAY"></a>

```java
public static final com.tailf.ha.HaStateType SECONDARY_RELAY;
```

SECONDARY_RELAY implies that the node is secondary in a HA cluster,
 that may also have "sub-secondaries" (after a beRelay() call).


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

Get the integer value represented by this enum value.

**Returns:** integer value for enum

### valueOf(int) <a href="#m-valueOf-c0d46d25fc67" id="m-valueOf-c0d46d25fc67"></a>

```java
public static com.tailf.ha.HaStateType valueOf(int i)
```

Types: [HaStateType](HaStateType.md#cls-HaStateType)

Instantiates an HaStateType from an integer value.

**Parameters**

- `int i` - - integer value representing the HaStateType

**Returns:** an HaStateType object

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.ha.HaStateType valueOf(String name)
```

Types: [HaStateType](HaStateType.md#cls-HaStateType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.ha.HaStateType[] values()
```

Types: [HaStateType](HaStateType.md#cls-HaStateType)
