# NanoServiceCallback <a href="#cls-NanoServiceCallback" id="cls-NanoServiceCallback"></a>

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

- [callType()](#m-callType-0d0f9b61a036)
- [componentType()](#m-componentType-59add484020d)
- [servicePoint()](#m-servicePoint-b277aa382c7d)
- [state()](#m-state-54117dea2388)

## Methods

### callType() <a href="#m-callType-0d0f9b61a036" id="m-callType-0d0f9b61a036"></a>

```java
public abstract com.tailf.dp.proto.NanoServiceCBType[] callType()
```

Types: [NanoServiceCBType](../proto/NanoServiceCBType.md#cls-NanoServiceCBType)

### componentType() <a href="#m-componentType-59add484020d" id="m-componentType-59add484020d"></a>

```java
public abstract String componentType()
```

### servicePoint() <a href="#m-servicePoint-b277aa382c7d" id="m-servicePoint-b277aa382c7d"></a>

```java
public abstract String servicePoint()
```

### state() <a href="#m-state-54117dea2388" id="m-state-54117dea2388"></a>

```java
public abstract String state()
```
