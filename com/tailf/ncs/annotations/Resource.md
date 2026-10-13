# Resource <a href="#resource-c987d7d7f060" id="resource-c987d7d7f060"></a>

```java
@java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
@java.lang.annotation.Target({java.lang.annotation.ElementType.FIELD})
public @interface com.tailf.ncs.annotations.Resource
```

Annotation class for Action Callbacks Attributes are callPoint and callType

**Since:** 3.2.0

## Members

**Methods**:

- [qualifier\(\)](#qualifier-53bb0e5b9344)
- [scope\(\)](#scope-040ece19a368)
- [type\(\)](#type-7a4a5f26039a)

## Methods

### qualifier() <a href="#qualifier-53bb0e5b9344" id="qualifier-53bb0e5b9344"></a>

```java
public abstract String qualifier()
```

### scope() <a href="#scope-040ece19a368" id="scope-040ece19a368"></a>

```java
public abstract com.tailf.ncs.annotations.Scope scope()
```

Types: [Scope](Scope.md#scope-5971086e8af0)

### type() <a href="#type-7a4a5f26039a" id="type-7a4a5f26039a"></a>

```java
public abstract com.tailf.ncs.annotations.ResourceType type()
```

Types: [ResourceType](ResourceType.md#resourcetype-7c885fa4653a)
