# SnmpInformResponseCallback <a href="#snmpinformresponsecallback-3028314100f9" id="snmpinformresponsecallback-3028314100f9"></a>

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

- [callPoint\(\)](#callpoint-c21f52042879)
- [callType\(\)](#calltype-0d0f9b61a036)

## Methods

### callPoint() <a href="#callpoint-c21f52042879" id="callpoint-c21f52042879"></a>

```java
public abstract String callPoint()
```

### callType() <a href="#calltype-0d0f9b61a036" id="calltype-0d0f9b61a036"></a>

```java
public abstract com.tailf.dp.proto.SnmpInformResponseCBType[] callType()
```

Types: [SnmpInformResponseCBType](../proto/SnmpInformResponseCBType.md#snmpinformresponsecbtype-ff6f60964bb4)
