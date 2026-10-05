<a id="s-HaStateType"></a>
# HaStateType

```java
public enum com.tailf.ha.HaStateType
```

Types: [HaStateType](HaStateType.md#s-HaStateType)

This enum describes the different states a HA node can be in.

**Related classes**

- [HaStateType](HaStateType.md#s-HaStateType)

## Members

**Enum Constants**:

- [NONE](#s-NONE)
- [PRIMARY](#s-PRIMARY)
- [SECONDARY](#s-SECONDARY)
- [SECONDARY_RELAY](#s-SECONDARY_RELAY)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(int)](#s-valueOf)
- [valueOf(String)](#s-valueOf-1)
- [values()](#s-values)

## Enum Constants

<a id="s-NONE"></a>
### NONE

```java
public static final com.tailf.ha.HaStateType NONE;
```

NONE implies that the node is not participating in a HA cluster.

<a id="s-PRIMARY"></a>
### PRIMARY

```java
public static final com.tailf.ha.HaStateType PRIMARY;
```

PRIMARY implies that the node is primary in a HA cluster.

<a id="s-SECONDARY"></a>
### SECONDARY

```java
public static final com.tailf.ha.HaStateType SECONDARY;
```

SECONDARY implies that the node is secondary in a HA cluster.

<a id="s-SECONDARY_RELAY"></a>
### SECONDARY_RELAY

```java
public static final com.tailf.ha.HaStateType SECONDARY_RELAY;
```

SECONDARY_RELAY implies that the node is secondary in a HA cluster,
 that may also have "sub-secondaries" (after a beRelay() call).


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

Get the integer value represented by this enum value.

**Returns:** integer value for enum

<a id="s-valueOf"></a>
### valueOf(int)

```java
public static com.tailf.ha.HaStateType valueOf(int i)
```

Types: [HaStateType](HaStateType.md#s-HaStateType)

Instantiates an HaStateType from an integer value.

**Parameters**

- `int i` - - integer value representing the HaStateType

**Returns:** an HaStateType object

<a id="s-valueOf-1"></a>
### valueOf(String)

```java
public static com.tailf.ha.HaStateType valueOf(String name)
```

Types: [HaStateType](HaStateType.md#s-HaStateType)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.ha.HaStateType[] values()
```

Types: [HaStateType](HaStateType.md#s-HaStateType)
