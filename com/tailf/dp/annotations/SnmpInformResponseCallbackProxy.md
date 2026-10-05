<a id="s-SnmpInformResponseCallbackProxy"></a>
# SnmpInformResponseCallbackProxy

```java
public class com.tailf.dp.annotations.SnmpInformResponseCallbackProxy
    implements com.tailf.dp.DpSnmpInformResponseCallback
```

Types: [DpSnmpInformResponseCallback](../DpSnmpInformResponseCallback.md#s-DpSnmpInformResponseCallback)

Callback proxy for SnmpInformResponse Callbacks. Implements the
 [`DpSnmpInformResponseCallback`](../DpSnmpInformResponseCallback.md#s-DpSnmpInformResponseCallback) interface and delegates calls to the
 registered callback POJO with annotated methods

**Since:** 3.2.0

## Members

**Constructors**:

- [SnmpInformResponseCallbackProxy(Object, String)](#s-SnmpInformResponseCallbackProxy-1)

**Methods**:

- [addActionCapability(SnmpInformResponseCBType)](#s-addActionCapability)
- [addActionMethod(String, Method)](#s-addActionMethod)
- [getBackupObject()](#s-getBackupObject)
- [getCallPoint()](#s-getCallPoint)
- [getSnmpInformResponseCallbackProxys(Object)](#s-getSnmpInformResponseCallbackProxys)
- [id()](#s-id)
- [mask()](#s-mask)
- [result(Integer, ConfETuple, Boolean)](#s-result)
- [targets(Integer, ConfETuple[])](#s-targets)

## Constructors

<a id="s-SnmpInformResponseCallbackProxy-1"></a>
### SnmpInformResponseCallbackProxy(Object, String)

```java
public SnmpInformResponseCallbackProxy(Object backupObject, String callPoint)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String callPoint` - string describing the callpoint for this callback


## Methods

<a id="s-addActionCapability"></a>
### addActionCapability(SnmpInformResponseCBType)

```java
public void addActionCapability(com.tailf.dp.proto.SnmpInformResponseCBType informCBType)
```

Types: [SnmpInformResponseCBType](../proto/SnmpInformResponseCBType.md#s-SnmpInformResponseCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.SnmpInformResponseCBType informCBType` - action type

<a id="s-addActionMethod"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

<a id="s-getBackupObject"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

<a id="s-getCallPoint"></a>
### getCallPoint()

```java
public String getCallPoint()
```

Retrieve the callback callpoint

**Returns:** callpoint string

<a id="s-getSnmpInformResponseCallbackProxys"></a>
### getSnmpInformResponseCallbackProxys(Object)

```java
public static com.tailf.dp.annotations.SnmpInformResponseCallbackProxy[] getSnmpInformResponseCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [SnmpInformResponseCallbackProxy](SnmpInformResponseCallbackProxy.md#s-SnmpInformResponseCallbackProxy), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered callback POJO

**Returns:** array of SnmpInformResponseCallbackProxy

**Throws**

- `DpCallbackException`

<a id="s-id"></a>
### id()

```java
public String id()
```

<a id="s-mask"></a>
### mask()

```java
public int mask()
```

<a id="s-result"></a>
### result(Integer, ConfETuple, Boolean)

```java
public void result(
    Integer ref,
    com.tailf.proto.ConfETuple target,
    Boolean gotResponse
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfETuple](../../proto/ConfETuple.md#s-ConfETuple), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `Integer ref`
- `com.tailf.proto.ConfETuple target`
- `Boolean gotResponse`

<a id="s-targets"></a>
### targets(Integer, ConfETuple[])

```java
public void targets(
    Integer ref,
    com.tailf.proto.ConfETuple[] targets
)
    throws com.tailf.dp.DpCallbackException
```

Types: [ConfETuple](../../proto/ConfETuple.md#s-ConfETuple), [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `Integer ref`
- `com.tailf.proto.ConfETuple[] targets`
