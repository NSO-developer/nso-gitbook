# ServiceCallback <a href="#cls-ServiceCallback" id="cls-ServiceCallback"></a>

```java
@java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
@java.lang.annotation.Target({java.lang.annotation.ElementType.METHOD})
public @interface com.tailf.dp.annotations.ServiceCallback
```

Annotation class for Service Callbacks.
 Attributes are `servicePoint`
 and `callType`.

 The `callpoint` is the string that is annotated with the
 `tailf:callpoint` in the data model.

 The data model defines a number of `callpoints`.
 Each `callpoint` must have an associated a set of data callbacks
 or user written methods annotated with `DataCallback`.

 `callType` defines the type of callback.

**Since:** 3.2.0

## Members

**Methods**:

- [callType()](#m-callType-0d0f9b61a036)
- [servicePoint()](#m-servicePoint-b277aa382c7d)

## Methods

### callType() <a href="#m-callType-0d0f9b61a036" id="m-callType-0d0f9b61a036"></a>

```java
public abstract com.tailf.dp.proto.ServiceCBType[] callType()
```

Types: [ServiceCBType](../proto/ServiceCBType.md#cls-ServiceCBType)

### servicePoint() <a href="#m-servicePoint-b277aa382c7d" id="m-servicePoint-b277aa382c7d"></a>

```java
public abstract String servicePoint()
```
