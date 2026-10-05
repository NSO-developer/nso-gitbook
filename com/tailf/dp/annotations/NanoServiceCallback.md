# NanoServiceCallback <a href="#nanoservicecallback-b044d911ce53" id="nanoservicecallback-b044d911ce53"></a>

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

- [callType()](#calltype-0d0f9b61a036)
- [componentType()](#componenttype-59add484020d)
- [servicePoint()](#servicepoint-b277aa382c7d)
- [state()](#state-54117dea2388)

## Methods

### callType() <a href="#calltype-0d0f9b61a036" id="calltype-0d0f9b61a036"></a>

```java
public abstract com.tailf.dp.proto.NanoServiceCBType[] callType()
```

Types: [NanoServiceCBType](../proto/NanoServiceCBType.md#nanoservicecbtype-16a84eed865a)

### componentType() <a href="#componenttype-59add484020d" id="componenttype-59add484020d"></a>

```java
public abstract String componentType()
```

### servicePoint() <a href="#servicepoint-b277aa382c7d" id="servicepoint-b277aa382c7d"></a>

```java
public abstract String servicePoint()
```

### state() <a href="#state-54117dea2388" id="state-54117dea2388"></a>

```java
public abstract String state()
```
