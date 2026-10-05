# ActionCallback <a href="#cls-ActionCallback" id="cls-ActionCallback"></a>

```java
@java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
@java.lang.annotation.Target({java.lang.annotation.ElementType.METHOD})
public @interface com.tailf.dp.annotations.ActionCallback
```

Annotation class for Action Callbacks Attributes are callPoint and callType

**Since:** 3.2.0

## Members

**Methods**:

- [callPoint()](#m-callPoint-c21f52042879)
- [callType()](#m-callType-0d0f9b61a036)

## Methods

### callPoint() <a href="#m-callPoint-c21f52042879" id="m-callPoint-c21f52042879"></a>

```java
public abstract String callPoint()
```

The name of the callpoint implementing the action

### callType() <a href="#m-callType-0d0f9b61a036" id="m-callType-0d0f9b61a036"></a>

```java
public abstract com.tailf.dp.proto.ActionCBType[] callType()
```

Types: [ActionCBType](../proto/ActionCBType.md#cls-ActionCBType)

The type of the callback (INIT, ACTION, ABORT etc)
