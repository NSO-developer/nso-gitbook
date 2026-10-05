# DataCallback <a href="#datacallback-7deea55c3e3c" id="datacallback-7deea55c3e3c"></a>

```java
@java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
@java.lang.annotation.Target({java.lang.annotation.ElementType.METHOD})
public @interface com.tailf.dp.annotations.DataCallback
```

Annotation class for Data Callbacks Attributes are `callPoint`
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

- [callPoint\(\)](#callpoint-c21f52042879)
- [callType\(\)](#calltype-0d0f9b61a036)

## Methods

### callPoint() <a href="#callpoint-c21f52042879" id="callpoint-c21f52042879"></a>

```java
public abstract String callPoint()
```

### callType() <a href="#calltype-0d0f9b61a036" id="calltype-0d0f9b61a036"></a>

```java
public abstract com.tailf.dp.proto.DataCBType[] callType()
```

Types: [DataCBType](../proto/DataCBType.md#datacbtype-1cb4e4ee7708)
