<a id="cls-Scope"></a>
# Scope

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

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-CONTEXT"></a>
### CONTEXT

```java
public static final com.tailf.ncs.annotations.Scope CONTEXT;
```

Context scope implies that the resource is
 shared for all fields having the same qualifier in any class.
 The resource is shared also between components in the package.
 However sharing scope is confined to the package i.e sharing cannot
 be extended between packages.
 If the qualifier is not given it becomes "DEFAULT"

<a id="m-INSTANCE"></a>
### INSTANCE

```java
public static final com.tailf.ncs.annotations.Scope INSTANCE;
```

Instance scope implies that all instances will
 get new resource instances. If the instance needs
 several resources of the same type they need to have
 separate qualifiers.


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.ncs.annotations.Scope valueOf(String name)
```

Types: [Scope](Scope.md#cls-Scope)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.ncs.annotations.Scope[] values()
```

Types: [Scope](Scope.md#cls-Scope)
