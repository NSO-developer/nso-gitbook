# Resource <a href="#cls-Resource" id="cls-Resource"></a>

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

### qualifier() <a href="#m-qualifier-53bb0e5b9344" id="m-qualifier-53bb0e5b9344"></a>

```java
public abstract String qualifier()
```

### scope() <a href="#m-scope-040ece19a368" id="m-scope-040ece19a368"></a>

```java
public abstract com.tailf.ncs.annotations.Scope scope()
```

Types: [Scope](Scope.md#cls-Scope)

### type() <a href="#m-type-7a4a5f26039a" id="m-type-7a4a5f26039a"></a>

```java
public abstract com.tailf.ncs.annotations.ResourceType type()
```

Types: [ResourceType](ResourceType.md#cls-ResourceType)
