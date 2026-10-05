<a id="cls-SnmpInformResponseCallbackProxy"></a>
# SnmpInformResponseCallbackProxy

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

- [SnmpInformResponseCallbackProxy(Object, String)](#m-snmpinformresponsecallbackproxy-1bd10efe1404)

**Methods**:

- [addActionCapability(SnmpInformResponseCBType)](#m-addactioncapability-080162afcb45)
- [addActionMethod(String, Method)](#m-addactionmethod-cf3e43a67fd9)
- [getBackupObject()](#m-getbackupobject-a6fb23c24524)
- [getCallPoint()](#m-getcallpoint-f816d0a44b26)
- [getSnmpInformResponseCallbackProxys(Object)](#m-getsnmpinformresponsecallbackproxys-6d27af84ebdb)
- [id()](#m-id-1352448ec267)
- [mask()](#m-mask-24c2fa29c6af)
- [result(Integer, ConfETuple, Boolean)](#m-result-633f0f760c10)
- [targets(Integer, ConfETuple[])](#m-targets-aaa64a3aa8f3)

## Constructors

<a id="m-snmpinformresponsecallbackproxy-1bd10efe1404"></a>
### SnmpInformResponseCallbackProxy(Object, String)

```java
public SnmpInformResponseCallbackProxy(Object backupObject, String callPoint)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String callPoint` - string describing the callpoint for this callback


## Methods

<a id="m-addactioncapability-080162afcb45"></a>
### addActionCapability(SnmpInformResponseCBType)

```java
public void addActionCapability(com.tailf.dp.proto.SnmpInformResponseCBType informCBType)
```

Types: [SnmpInformResponseCBType](../proto/SnmpInformResponseCBType.md#cls-SnmpInformResponseCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.SnmpInformResponseCBType informCBType` - action type

<a id="m-addactionmethod-cf3e43a67fd9"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

<a id="m-getbackupobject-a6fb23c24524"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

<a id="m-getcallpoint-f816d0a44b26"></a>
### getCallPoint()

```java
public String getCallPoint()
```

Retrieve the callback callpoint

**Returns:** callpoint string

<a id="m-getsnmpinformresponsecallbackproxys-6d27af84ebdb"></a>
### getSnmpInformResponseCallbackProxys(Object)

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

<a id="m-id-1352448ec267"></a>
### id()

```java
public String id()
```

<a id="m-mask-24c2fa29c6af"></a>
### mask()

```java
public int mask()
```

<a id="m-result-633f0f760c10"></a>
### result(Integer, ConfETuple, Boolean)

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

<a id="m-targets-aaa64a3aa8f3"></a>
### targets(Integer, ConfETuple[])

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
