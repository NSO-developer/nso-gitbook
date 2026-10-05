<a id="cls-ActionCallback"></a>
# ActionCallback

```java
@java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
@java.lang.annotation.Target({java.lang.annotation.ElementType.METHOD})
public @interface com.tailf.dp.annotations.ActionCallback
```

Annotation class for Action Callbacks Attributes are callPoint and callType

**Since:** 3.2.0

## Members

**Methods**:

- [callPoint()](#m-callpoint-c21f52042879)
- [callType()](#m-calltype-0d0f9b61a036)

## Methods

<a id="m-callpoint-c21f52042879"></a>
### callPoint()

```java
public abstract String callPoint()
```

The name of the callpoint implementing the action

<a id="m-calltype-0d0f9b61a036"></a>
### callType()

```java
public abstract com.tailf.dp.proto.ActionCBType[] callType()
```

Types: [ActionCBType](../proto/ActionCBType.md#cls-ActionCBType)

The type of the callback (INIT, ACTION, ABORT etc)
