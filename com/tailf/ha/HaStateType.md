<a id="cls-HaStateType"></a>
# HaStateType

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

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(int)](#m-valueof-c0d46d25fc67)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-NONE"></a>
### NONE

```java
public static final com.tailf.ha.HaStateType NONE;
```

NONE implies that the node is not participating in a HA cluster.

<a id="m-PRIMARY"></a>
### PRIMARY

```java
public static final com.tailf.ha.HaStateType PRIMARY;
```

PRIMARY implies that the node is primary in a HA cluster.

<a id="m-SECONDARY"></a>
### SECONDARY

```java
public static final com.tailf.ha.HaStateType SECONDARY;
```

SECONDARY implies that the node is secondary in a HA cluster.

<a id="m-SECONDARY_RELAY"></a>
### SECONDARY_RELAY

```java
public static final com.tailf.ha.HaStateType SECONDARY_RELAY;
```

SECONDARY_RELAY implies that the node is secondary in a HA cluster,
 that may also have "sub-secondaries" (after a beRelay() call).


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

Get the integer value represented by this enum value.

**Returns:** integer value for enum

<a id="m-valueof-c0d46d25fc67"></a>
### valueOf(int)

```java
public static com.tailf.ha.HaStateType valueOf(int i)
```

Types: [HaStateType](HaStateType.md#cls-HaStateType)

Instantiates an HaStateType from an integer value.

**Parameters**

- `int i` - - integer value representing the HaStateType

**Returns:** an HaStateType object

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.ha.HaStateType valueOf(String name)
```

Types: [HaStateType](HaStateType.md#cls-HaStateType)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.ha.HaStateType[] values()
```

Types: [HaStateType](HaStateType.md#cls-HaStateType)
