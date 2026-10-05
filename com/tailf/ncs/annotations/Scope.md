<a id="s-Scope"></a>
# Scope

```java
public enum com.tailf.ncs.annotations.Scope
```

Types: [Scope](Scope.md#s-Scope)

Scope for resources managed by the Resource Manager

**Related classes**

- [Scope](Scope.md#s-Scope)

## Members

**Enum Constants**:

- [CONTEXT](#s-CONTEXT)
- [INSTANCE](#s-INSTANCE)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-CONTEXT"></a>
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

<a id="s-INSTANCE"></a>
### INSTANCE

```java
public static final com.tailf.ncs.annotations.Scope INSTANCE;
```

Instance scope implies that all instances will
 get new resource instances. If the instance needs
 several resources of the same type they need to have
 separate qualifiers.


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.ncs.annotations.Scope valueOf(String name)
```

Types: [Scope](Scope.md#s-Scope)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.ncs.annotations.Scope[] values()
```

Types: [Scope](Scope.md#s-Scope)
