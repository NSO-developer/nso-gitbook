# Scope <a href="#cls-Scope" id="cls-Scope"></a>

```java
public enum com.tailf.ncs.annotations.Scope
```

Types: [Scope](Scope.md#cls-Scope)

Scope for resources managed by the Resource Manager

## Members

**Enum Constants**:

- [CONTEXT](#m-CONTEXT)
- [INSTANCE](#m-INSTANCE)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### CONTEXT <a href="#m-CONTEXT" id="m-CONTEXT"></a>

```java
public static final com.tailf.ncs.annotations.Scope CONTEXT;
```

Context scope implies that the resource is
 shared for all fields having the same qualifier in any class.
 The resource is shared also between components in the package.
 However sharing scope is confined to the package i.e sharing cannot
 be extended between packages.
 If the qualifier is not given it becomes "DEFAULT"

### INSTANCE <a href="#m-INSTANCE" id="m-INSTANCE"></a>

```java
public static final com.tailf.ncs.annotations.Scope INSTANCE;
```

Instance scope implies that all instances will
 get new resource instances. If the instance needs
 several resources of the same type they need to have
 separate qualifiers.


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.ncs.annotations.Scope valueOf(String name)
```

Types: [Scope](Scope.md#cls-Scope)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.ncs.annotations.Scope[] values()
```

Types: [Scope](Scope.md#cls-Scope)
