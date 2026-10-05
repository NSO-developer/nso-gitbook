# SnmpInformResponseCallback <a href="#cls-SnmpInformResponseCallback" id="cls-SnmpInformResponseCallback"></a>

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

- [callPoint()](#m-callPoint-c21f52042879)
- [callType()](#m-callType-0d0f9b61a036)

## Methods

### callPoint() <a href="#m-callPoint-c21f52042879" id="m-callPoint-c21f52042879"></a>

```java
public abstract String callPoint()
```

### callType() <a href="#m-callType-0d0f9b61a036" id="m-callType-0d0f9b61a036"></a>

```java
public abstract com.tailf.dp.proto.SnmpInformResponseCBType[] callType()
```

Types: [SnmpInformResponseCBType](../proto/SnmpInformResponseCBType.md#cls-SnmpInformResponseCBType)
