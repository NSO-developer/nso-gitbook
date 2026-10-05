<a id="s-ActionCallback"></a>
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

- [callPoint()](#s-callPoint)
- [callType()](#s-callType)

## Methods

<a id="s-callPoint"></a>
### callPoint()

```java
public abstract String callPoint()
```

The name of the callpoint implementing the action

<a id="s-callType"></a>
### callType()

```java
public abstract com.tailf.dp.proto.ActionCBType[] callType()
```

Types: [ActionCBType](../proto/ActionCBType.md#s-ActionCBType)

The type of the callback (INIT, ACTION, ABORT etc)
