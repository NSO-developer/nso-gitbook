# NanoServiceCallbackProxy <a href="#nanoservicecallbackproxy-1be613ef1f1d" id="nanoservicecallbackproxy-1be613ef1f1d"></a>

```java
public class com.tailf.dp.annotations.NanoServiceCallbackProxy
    implements com.tailf.dp.DpNanoServiceCallback
```

Types: [DpNanoServiceCallback](../DpNanoServiceCallback.md#dpnanoservicecallback-a88529d129ff)

Callback proxy for Nano Service Callbacks.
 Implements the [`DpServiceCallback`](../DpServiceCallback.md#dpservicecallback-181d65969781)
 interface and delegates calls to the registered callback POJO with annotated
 methods

## Members

**Constructors**:

- [NanoServiceCallbackProxy\(Object, String, String, String\)](#nanoservicecallbackproxy-97d281c4d63b)

**Fields**:

- [M\_NANO\_CREATE](../DpNanoServiceCallback.md#m_nano_create-f69a2979f8b0) from DpNanoServiceCallback
- [M\_NANO\_DELETE](../DpNanoServiceCallback.md#m_nano_delete-d890c83a3d57) from DpNanoServiceCallback

**Methods**:

- [addActionCapability\(NanoServiceCBType\)](#addactioncapability-1cb3659d509e)
- [addActionMethod\(String, Method\)](#addactionmethod-cf3e43a67fd9)
- [componentType\(\)](#componenttype-59add484020d)
- [create\(NanoServiceContext, NavuNode, NavuNode, Properties, Properties\)](#create-45a9e9003e1d)
- [delete\(NanoServiceContext, NavuNode, NavuNode, Properties, Properties\)](#delete-4ba929210861)
- [getBackupObject\(\)](#getbackupobject-a6fb23c24524)
- [getNanoServiceCallbackProxys\(Object\)](#getnanoservicecallbackproxys-774a1b856b31)
- [getServicePoint\(\)](#getservicepoint-4b0d670b9506)
- [mask\(\)](#mask-24c2fa29c6af)
- [servicepoint\(\)](#servicepoint-33fbd1d46c70)
- [state\(\)](#state-54117dea2388)

## Constructors

### NanoServiceCallbackProxy(Object, String, String, String) <a href="#nanoservicecallbackproxy-97d281c4d63b" id="nanoservicecallbackproxy-97d281c4d63b"></a>

```java
public NanoServiceCallbackProxy(
    Object backupObject,
    String servicePoint,
    String componentType,
    String state
)
```

Constructor for Callback proxys. Used internally.

**Parameters**

- `Object backupObject` - registered callback POJO
- `String servicePoint` - string describing the servicepoint for this callback
- `String componentType`
- `String state`


## Methods

### addActionCapability(NanoServiceCBType) <a href="#addactioncapability-1cb3659d509e" id="addactioncapability-1cb3659d509e"></a>

```java
public void addActionCapability(com.tailf.dp.proto.NanoServiceCBType nanoServiceCBType)
```

Types: [NanoServiceCBType](../proto/NanoServiceCBType.md#nanoservicecbtype-16a84eed865a)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.NanoServiceCBType nanoServiceCBType` - action type

### addActionMethod(String, Method) <a href="#addactionmethod-cf3e43a67fd9" id="addactionmethod-cf3e43a67fd9"></a>

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

### componentType() <a href="#componenttype-59add484020d" id="componenttype-59add484020d"></a>

```java
public String componentType()
```

### create(NanoServiceContext, NavuNode, NavuNode, Properties, Properties) <a href="#create-45a9e9003e1d" id="create-45a9e9003e1d"></a>

```java
public java.util.Properties create(
    com.tailf.dp.services.NanoServiceContext context,
    com.tailf.navu.NavuNode service,
    com.tailf.navu.NavuNode root,
    java.util.Properties opaque,
    java.util.Properties componentProperties
)
    throws com.tailf.dp.DpCallbackException
```

Types: [NanoServiceContext](../services/NanoServiceContext.md#nanoservicecontext-10c84a5701dd), [NavuNode](../../navu/NavuNode.md#navunode-73944820c8db), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.services.NanoServiceContext context`
- `com.tailf.navu.NavuNode service`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`
- `java.util.Properties componentProperties`

### delete(NanoServiceContext, NavuNode, NavuNode, Properties, Properties) <a href="#delete-4ba929210861" id="delete-4ba929210861"></a>

```java
public java.util.Properties delete(
    com.tailf.dp.services.NanoServiceContext context,
    com.tailf.navu.NavuNode service,
    com.tailf.navu.NavuNode root,
    java.util.Properties opaque,
    java.util.Properties componentProperties
)
    throws com.tailf.dp.DpCallbackException
```

Types: [NanoServiceContext](../services/NanoServiceContext.md#nanoservicecontext-10c84a5701dd), [NavuNode](../../navu/NavuNode.md#navunode-73944820c8db), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

**Parameters**

- `com.tailf.dp.services.NanoServiceContext context`
- `com.tailf.navu.NavuNode service`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`
- `java.util.Properties componentProperties`

### getBackupObject() <a href="#getbackupobject-a6fb23c24524" id="getbackupobject-a6fb23c24524"></a>

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

### getNanoServiceCallbackProxys(Object) <a href="#getnanoservicecallbackproxys-774a1b856b31" id="getnanoservicecallbackproxys-774a1b856b31"></a>

```java
public static com.tailf.dp.annotations.NanoServiceCallbackProxy[] getNanoServiceCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [NanoServiceCallbackProxy](NanoServiceCallbackProxy.md#nanoservicecallbackproxy-1be613ef1f1d), [DpCallbackException](../DpCallbackException.md#dpcallbackexception-faf15838e5cb)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of NanoServCallbackProxy

**Throws**

- `DpCallbackException`

### getServicePoint() <a href="#getservicepoint-4b0d670b9506" id="getservicepoint-4b0d670b9506"></a>

```java
public String getServicePoint()
```

Retrieve the callback servicepoint

**Returns:** servicepoint string

### mask() <a href="#mask-24c2fa29c6af" id="mask-24c2fa29c6af"></a>

```java
public int mask()
```

### servicepoint() <a href="#servicepoint-33fbd1d46c70" id="servicepoint-33fbd1d46c70"></a>

```java
public String servicepoint()
```

### state() <a href="#state-54117dea2388" id="state-54117dea2388"></a>

```java
public String state()
```
