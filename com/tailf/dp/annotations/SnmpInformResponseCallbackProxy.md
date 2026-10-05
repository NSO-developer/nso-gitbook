# SnmpInformResponseCallbackProxy <a href="#cls-SnmpInformResponseCallbackProxy" id="cls-SnmpInformResponseCallbackProxy"></a>

```java
public class com.tailf.dp.annotations.SnmpInformResponseCallbackProxy
    implements com.tailf.dp.DpSnmpInformResponseCallback
```

Types: [DpSnmpInformResponseCallback](../DpSnmpInformResponseCallback.md#cls-DpSnmpInformResponseCallback)

Callback proxy for SnmpInformResponse Callbacks. Implements the
 [`DpSnmpInformResponseCallback`](../DpSnmpInformResponseCallback.md#cls-DpSnmpInformResponseCallback) interface and delegates calls to the
 registered callback POJO with annotated methods

**Since:** 3.2.0

## Members

**Constructors**:

- [SnmpInformResponseCallbackProxy(Object, String)](#m-SnmpInformResponseCallbackProxy-1bd10efe1404)

**Methods**:

- [addActionCapability(SnmpInformResponseCBType)](#m-addActionCapability-080162afcb45)
- [addActionMethod(String, Method)](#m-addActionMethod-cf3e43a67fd9)
- [getBackupObject()](#m-getBackupObject-a6fb23c24524)
- [getCallPoint()](#m-getCallPoint-f816d0a44b26)
- [getSnmpInformResponseCallbackProxys(Object)](#m-getSnmpInformResponseCallbackProxys-6d27af84ebdb)
- [id()](#m-id-1352448ec267)
- [mask()](#m-mask-24c2fa29c6af)
- [result(Integer, ConfETuple, Boolean)](#m-result-633f0f760c10)
- [targets(Integer, ConfETuple[])](#m-targets-aaa64a3aa8f3)

## Constructors

### SnmpInformResponseCallbackProxy(Object, String) <a href="#m-SnmpInformResponseCallbackProxy-1bd10efe1404" id="m-SnmpInformResponseCallbackProxy-1bd10efe1404"></a>

```java
public SnmpInformResponseCallbackProxy(Object backupObject, String callPoint)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String callPoint` - string describing the callpoint for this callback


## Methods

### addActionCapability(SnmpInformResponseCBType) <a href="#m-addActionCapability-080162afcb45" id="m-addActionCapability-080162afcb45"></a>

```java
public void addActionCapability(com.tailf.dp.proto.SnmpInformResponseCBType informCBType)
```

Types: [SnmpInformResponseCBType](../proto/SnmpInformResponseCBType.md#cls-SnmpInformResponseCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.SnmpInformResponseCBType informCBType` - action type

### addActionMethod(String, Method) <a href="#m-addActionMethod-cf3e43a67fd9" id="m-addActionMethod-cf3e43a67fd9"></a>

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

### getBackupObject() <a href="#m-getBackupObject-a6fb23c24524" id="m-getBackupObject-a6fb23c24524"></a>

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

### getCallPoint() <a href="#m-getCallPoint-f816d0a44b26" id="m-getCallPoint-f816d0a44b26"></a>

```java
public String getCallPoint()
```

Retrieve the callback callpoint

**Returns:** callpoint string

### getSnmpInformResponseCallbackProxys(Object) <a href="#m-getSnmpInformResponseCallbackProxys-6d27af84ebdb" id="m-getSnmpInformResponseCallbackProxys-6d27af84ebdb"></a>

```java
public static com.tailf.dp.annotations.SnmpInformResponseCallbackProxy[] getSnmpInformResponseCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [SnmpInformResponseCallbackProxy](SnmpInformResponseCallbackProxy.md#cls-SnmpInformResponseCallbackProxy), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered callback POJO

**Returns:** array of SnmpInformResponseCallbackProxy

**Throws**

- `DpCallbackException`

### id() <a href="#m-id-1352448ec267" id="m-id-1352448ec267"></a>

```java
public String id()
```

### mask() <a href="#m-mask-24c2fa29c6af" id="m-mask-24c2fa29c6af"></a>

```java
public int mask()
```

### result(Integer, ConfETuple, Boolean) <a href="#m-result-633f0f760c10" id="m-result-633f0f760c10"></a>

```java
public void result(
    Integer ref,
    com.tailf.proto.ConfETuple target,
    Boolean gotResponse
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfETuple](../../proto/ConfETuple.md#cls-ConfETuple), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `Integer ref`
- `com.tailf.proto.ConfETuple target`
- `Boolean gotResponse`

### targets(Integer, ConfETuple[]) <a href="#m-targets-aaa64a3aa8f3" id="m-targets-aaa64a3aa8f3"></a>

```java
public void targets(
    Integer ref,
    com.tailf.proto.ConfETuple[] targets
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfETuple](../../proto/ConfETuple.md#cls-ConfETuple), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `Integer ref`
- `com.tailf.proto.ConfETuple[] targets`
