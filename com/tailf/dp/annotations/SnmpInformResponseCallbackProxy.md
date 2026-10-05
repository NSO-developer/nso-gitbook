# SnmpInformResponseCallbackProxy <a href="#snmpinformresponsecallbackproxy-9806cafa9d82" id="snmpinformresponsecallbackproxy-9806cafa9d82"></a>

```java
public class com.tailf.dp.annotations.SnmpInformResponseCallbackProxy
    implements com.tailf.dp.DpSnmpInformResponseCallback
```

Types: [DpSnmpInformResponseCallback](../DpSnmpInformResponseCallback.md#dpsnmpinformresponsecallback-bd4d651a8d7b)

Callback proxy for SnmpInformResponse Callbacks. Implements the
 [`DpSnmpInformResponseCallback`](../DpSnmpInformResponseCallback.md#dpsnmpinformresponsecallback-bd4d651a8d7b) interface and delegates calls to the
 registered callback POJO with annotated methods

**Since:** 3.2.0

## Members

**Constructors**:

- [SnmpInformResponseCallbackProxy\(Object, String\)](#snmpinformresponsecallbackproxy-1bd10efe1404)

**Methods**:

- [addActionCapability\(SnmpInformResponseCBType\)](#addactioncapability-080162afcb45)
- [addActionMethod\(String, Method\)](#addactionmethod-cf3e43a67fd9)
- [getBackupObject\(\)](#getbackupobject-a6fb23c24524)
- [getCallPoint\(\)](#getcallpoint-f816d0a44b26)
- [getSnmpInformResponseCallbackProxys\(Object\)](#getsnmpinformresponsecallbackproxys-6d27af84ebdb)
- [id\(\)](#id-1352448ec267)
- [mask\(\)](#mask-24c2fa29c6af)
- [result\(Integer, ConfETuple, Boolean\)](#result-633f0f760c10)
- [targets\(Integer, ConfETuple\[\]\)](#targets-aaa64a3aa8f3)

## Constructors

### SnmpInformResponseCallbackProxy(Object, String) <a href="#snmpinformresponsecallbackproxy-1bd10efe1404" id="snmpinformresponsecallbackproxy-1bd10efe1404"></a>

```java
public SnmpInformResponseCallbackProxy(Object backupObject, String callPoint)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String callPoint` - string describing the callpoint for this callback


## Methods

### addActionCapability(SnmpInformResponseCBType) <a href="#addactioncapability-080162afcb45" id="addactioncapability-080162afcb45"></a>

```java
public void addActionCapability(com.tailf.dp.proto.SnmpInformResponseCBType informCBType)
```

Types: [SnmpInformResponseCBType](../proto/SnmpInformResponseCBType.md#snmpinformresponsecbtype-ff6f60964bb4)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.SnmpInformResponseCBType informCBType` - action type

### addActionMethod(String, Method) <a href="#addactionmethod-cf3e43a67fd9" id="addactionmethod-cf3e43a67fd9"></a>

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

### getBackupObject() <a href="#getbackupobject-a6fb23c24524" id="getbackupobject-a6fb23c24524"></a>

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

### getCallPoint() <a href="#getcallpoint-f816d0a44b26" id="getcallpoint-f816d0a44b26"></a>

```java
public String getCallPoint()
```

Retrieve the callback callpoint

**Returns:** callpoint string

### getSnmpInformResponseCallbackProxys(Object) <a href="#getsnmpinformresponsecallbackproxys-6d27af84ebdb" id="getsnmpinformresponsecallbackproxys-6d27af84ebdb"></a>

```java
public static com.tailf.dp.annotations.SnmpInformResponseCallbackProxy[] getSnmpInformResponseCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [SnmpInformResponseCallbackProxy](SnmpInformResponseCallbackProxy.md#snmpinformresponsecallbackproxy-9806cafa9d82), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered callback POJO

**Returns:** array of SnmpInformResponseCallbackProxy

**Throws**

- `DpCallbackException`

### id() <a href="#id-1352448ec267" id="id-1352448ec267"></a>

```java
public String id()
```

### mask() <a href="#mask-24c2fa29c6af" id="mask-24c2fa29c6af"></a>

```java
public int mask()
```

### result(Integer, ConfETuple, Boolean) <a href="#result-633f0f760c10" id="result-633f0f760c10"></a>

```java
public void result(
    Integer ref,
    com.tailf.proto.ConfETuple target,
    Boolean gotResponse
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfETuple](../../proto/ConfETuple.md#confetuple-b1f9702a82a1), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `Integer ref`
- `com.tailf.proto.ConfETuple target`
- `Boolean gotResponse`

### targets(Integer, ConfETuple[]) <a href="#targets-aaa64a3aa8f3" id="targets-aaa64a3aa8f3"></a>

```java
public void targets(
    Integer ref,
    com.tailf.proto.ConfETuple[] targets
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfETuple](../../proto/ConfETuple.md#confetuple-b1f9702a82a1), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `Integer ref`
- `com.tailf.proto.ConfETuple[] targets`
