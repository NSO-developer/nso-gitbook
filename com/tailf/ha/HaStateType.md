# HaStateType <a href="#hastatetype-8f5797940a11" id="hastatetype-8f5797940a11"></a>

```java
public enum com.tailf.ha.HaStateType
```

Types: [HaStateType](HaStateType.md#hastatetype-8f5797940a11)

This enum describes the different states a HA node can be in.

## Members

**Enum Constants**:

- [NONE](#none-f29411358a7b)
- [PRIMARY](#primary-b37cfb8b5165)
- [SECONDARY](#secondary-0ebc1e389638)
- [SECONDARY\_RELAY](#secondary_relay-30883f2fae5b)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(int\)](#valueof-c0d46d25fc67)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### NONE <a href="#none-f29411358a7b" id="none-f29411358a7b"></a>

```java
public static final com.tailf.ha.HaStateType NONE;
```

NONE implies that the node is not participating in a HA cluster.

### PRIMARY <a href="#primary-b37cfb8b5165" id="primary-b37cfb8b5165"></a>

```java
public static final com.tailf.ha.HaStateType PRIMARY;
```

PRIMARY implies that the node is primary in a HA cluster.

### SECONDARY <a href="#secondary-0ebc1e389638" id="secondary-0ebc1e389638"></a>

```java
public static final com.tailf.ha.HaStateType SECONDARY;
```

SECONDARY implies that the node is secondary in a HA cluster.

### SECONDARY_RELAY <a href="#secondary_relay-30883f2fae5b" id="secondary_relay-30883f2fae5b"></a>

```java
public static final com.tailf.ha.HaStateType SECONDARY_RELAY;
```

SECONDARY_RELAY implies that the node is secondary in a HA cluster,
 that may also have "sub-secondaries" (after a beRelay() call).


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

Get the integer value represented by this enum value.

**Returns:** integer value for enum

### valueOf(int) <a href="#valueof-c0d46d25fc67" id="valueof-c0d46d25fc67"></a>

```java
public static com.tailf.ha.HaStateType valueOf(int i)
```

Types: [HaStateType](HaStateType.md#hastatetype-8f5797940a11)

Instantiates an HaStateType from an integer value.

**Parameters**

- `int i` - - integer value representing the HaStateType

**Returns:** an HaStateType object

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.ha.HaStateType valueOf(String name)
```

Types: [HaStateType](HaStateType.md#hastatetype-8f5797940a11)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.ha.HaStateType[] values()
```

Types: [HaStateType](HaStateType.md#hastatetype-8f5797940a11)
