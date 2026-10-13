# ActionCallback <a href="#actioncallback-87db2e3174d7" id="actioncallback-87db2e3174d7"></a>

```java
@java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
@java.lang.annotation.Target({java.lang.annotation.ElementType.METHOD})
public @interface com.tailf.dp.annotations.ActionCallback
```

Annotation class for Action Callbacks Attributes are callPoint and callType

**Since:** 3.2.0

## Members

**Methods**:

- [callPoint\(\)](#callpoint-c21f52042879)
- [callType\(\)](#calltype-0d0f9b61a036)

## Methods

### callPoint() <a href="#callpoint-c21f52042879" id="callpoint-c21f52042879"></a>

```java
public abstract String callPoint()
```

The name of the callpoint implementing the action

### callType() <a href="#calltype-0d0f9b61a036" id="calltype-0d0f9b61a036"></a>

```java
public abstract com.tailf.dp.proto.ActionCBType[] callType()
```

Types: [ActionCBType](../proto/ActionCBType.md#actioncbtype-10d0222e8e66)

The type of the callback (INIT, ACTION, ABORT etc)
