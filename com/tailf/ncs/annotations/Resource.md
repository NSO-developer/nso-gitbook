<a id="s-Resource"></a>
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

- [qualifier()](#s-qualifier)
- [scope()](#s-scope)
- [type()](#s-type)

## Methods

<a id="s-qualifier"></a>
### qualifier()

```java
public abstract String qualifier()
```

<a id="s-scope"></a>
### scope()

```java
public abstract com.tailf.ncs.annotations.Scope scope()
```

Types: [Scope](Scope.md#s-Scope)

<a id="s-type"></a>
### type()

```java
public abstract com.tailf.ncs.annotations.ResourceType type()
```

Types: [ResourceType](ResourceType.md#s-ResourceType)
