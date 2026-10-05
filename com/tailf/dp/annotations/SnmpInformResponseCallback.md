<a id="s-SnmpInformResponseCallback"></a>
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
public abstract com.tailf.dp.proto.SnmpInformResponseCBType[] callType()
```

Types: [SnmpInformResponseCBType](../proto/SnmpInformResponseCBType.md#s-SnmpInformResponseCBType)
