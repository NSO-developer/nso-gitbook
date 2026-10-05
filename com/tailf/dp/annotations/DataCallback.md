<a id="s-DataCallback"></a>
# DataCallback

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

- [callPoint()](#s-callPoint)
- [callType()](#s-callType)

## Methods

<a id="s-callPoint"></a>
### callPoint()

```java
public abstract String callPoint()
```

<a id="s-callType"></a>
### callType()

```java
public abstract com.tailf.dp.proto.DataCBType[] callType()
```

Types: [DataCBType](../proto/DataCBType.md#s-DataCBType)
