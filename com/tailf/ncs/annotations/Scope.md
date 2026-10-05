# Scope <a href="#scope-5971086e8af0" id="scope-5971086e8af0"></a>

```java
public enum com.tailf.ncs.annotations.Scope
```

Types: [Scope](Scope.md#scope-5971086e8af0)

Scope for resources managed by the Resource Manager

## Members

**Enum Constants**:

- [CONTEXT](#context-87b787ddc857)
- [INSTANCE](#instance-5a6b3c2a0c71)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### CONTEXT <a href="#context-87b787ddc857" id="context-87b787ddc857"></a>

```java
public static final com.tailf.ncs.annotations.Scope CONTEXT;
```

Context scope implies that the resource is
 shared for all fields having the same qualifier in any class.
 The resource is shared also between components in the package.
 However sharing scope is confined to the package i.e sharing cannot
 be extended between packages.
 If the qualifier is not given it becomes "DEFAULT"

### INSTANCE <a href="#instance-5a6b3c2a0c71" id="instance-5a6b3c2a0c71"></a>

```java
public static final com.tailf.ncs.annotations.Scope INSTANCE;
```

Instance scope implies that all instances will
 get new resource instances. If the instance needs
 several resources of the same type they need to have
 separate qualifiers.


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.ncs.annotations.Scope valueOf(String name)
```

Types: [Scope](Scope.md#scope-5971086e8af0)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.ncs.annotations.Scope[] values()
```

Types: [Scope](Scope.md#scope-5971086e8af0)
