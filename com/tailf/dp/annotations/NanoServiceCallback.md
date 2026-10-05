<a id="s-NanoServiceCallback"></a>
# NanoServiceCallback

```java
@java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
@java.lang.annotation.Target({java.lang.annotation.ElementType.METHOD})
public @interface com.tailf.dp.annotations.NanoServiceCallback
```

Annotation class for Nano Service Callbacks.
 Attributes are `servicePoint`
 `componentType`, `state`
 and `callType`.

 The `callpoint` is the string that is annotated with the
 `tailf:servicepoint` in the data model.

 The data model defines a number of `callpoints`.
 Each `callpoint` must have an associated a set of data callbacks
 or user written methods annotated with `DataCallback`.

 The Nano service plan defines a number of plan components and states.
 The Callback refers to one of these components and and a state in this
 component as the target for callback invokation.

 `callType` defines the type of callback.

**Since:** 4.3.0

## Members

**Methods**:

- [callType()](#s-callType)
- [componentType()](#s-componentType)
- [servicePoint()](#s-servicePoint)
- [state()](#s-state)

## Methods

<a id="s-callType"></a>
### callType()

```java
public abstract com.tailf.dp.proto.NanoServiceCBType[] callType()
```

Types: [NanoServiceCBType](../proto/NanoServiceCBType.md#s-NanoServiceCBType)

<a id="s-componentType"></a>
### componentType()

```java
public abstract String componentType()
```

<a id="s-servicePoint"></a>
### servicePoint()

```java
public abstract String servicePoint()
```

<a id="s-state"></a>
### state()

```java
public abstract String state()
```
