<a id="cls-Resource"></a>
# Resource

```java
@java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
@java.lang.annotation.Target({java.lang.annotation.ElementType.FIELD})
public @interface com.tailf.ncs.annotations.Resource
```

Annotation class for Action Callbacks Attributes are callPoint and callType

**Since:** 3.2.0

## Members

**Methods**:

- [qualifier()](#m-qualifier-53bb0e5b9344)
- [scope()](#m-scope-040ece19a368)
- [type()](#m-type-7a4a5f26039a)

## Methods

<a id="m-qualifier-53bb0e5b9344"></a>
### qualifier()

```java
public abstract String qualifier()
```

<a id="m-scope-040ece19a368"></a>
### scope()

```java
public abstract com.tailf.ncs.annotations.Scope scope()
```

Types: [Scope](Scope.md#cls-Scope)

<a id="m-type-7a4a5f26039a"></a>
### type()

```java
public abstract com.tailf.ncs.annotations.ResourceType type()
```

Types: [ResourceType](ResourceType.md#cls-ResourceType)
