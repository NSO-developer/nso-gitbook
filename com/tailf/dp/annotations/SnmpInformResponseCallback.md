<a id="cls-SnmpInformResponseCallback"></a>
# SnmpInformResponseCallback

```java
@java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy.RUNTIME)
@java.lang.annotation.Target({java.lang.annotation.ElementType.METHOD})
public @interface com.tailf.dp.annotations.SnmpInformResponseCallback
```

Annotation class for SnmpInformResponse Callbacks Attributes are callPoint
 and callType

**Since:** 3.2.0

## Members

**Methods**:

- [callPoint()](#m-callpoint-c21f52042879)
- [callType()](#m-calltype-0d0f9b61a036)

## Methods

<a id="m-callpoint-c21f52042879"></a>
### callPoint()

```java
public abstract String callPoint()
```

<a id="m-calltype-0d0f9b61a036"></a>
### callType()

```java
public abstract com.tailf.dp.proto.SnmpInformResponseCBType[] callType()
```

Types: [SnmpInformResponseCBType](../proto/SnmpInformResponseCBType.md#cls-SnmpInformResponseCBType)
