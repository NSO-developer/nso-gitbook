<a id="s-ServiceCallback"></a>
# ServiceCallback

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

- [callType()](#s-callType)
- [servicePoint()](#s-servicePoint)

## Methods

<a id="s-callType"></a>
### callType()

```java
public abstract com.tailf.dp.proto.ServiceCBType[] callType()
```

Types: [ServiceCBType](../proto/ServiceCBType.md#s-ServiceCBType)

<a id="s-servicePoint"></a>
### servicePoint()

```java
public abstract String servicePoint()
```
