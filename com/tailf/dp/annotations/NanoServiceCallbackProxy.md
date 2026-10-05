<a id="cls-NanoServiceCallbackProxy"></a>
# NanoServiceCallbackProxy

```java
public class com.tailf.dp.annotations.NanoServiceCallbackProxy
    implements com.tailf.dp.DpNanoServiceCallback
```

Types: [DpNanoServiceCallback](../DpNanoServiceCallback.md#cls-DpNanoServiceCallback)

Callback proxy for Nano Service Callbacks.
 Implements the [`DpServiceCallback`](../DpServiceCallback.md#cls-DpServiceCallback)
 interface and delegates calls to the registered callback POJO with annotated
 methods

## Members

**Constructors**:

- [NanoServiceCallbackProxy(Object, String, String, String)](#m-nanoservicecallbackproxy-97d281c4d63b)

**Fields**:

- [M_NANO_CREATE](../DpNanoServiceCallback.md#m-M_NANO_CREATE) from DpNanoServiceCallback
- [M_NANO_DELETE](../DpNanoServiceCallback.md#m-M_NANO_DELETE) from DpNanoServiceCallback

**Methods**:

- [addActionCapability(NanoServiceCBType)](#m-addactioncapability-1cb3659d509e)
- [addActionMethod(String, Method)](#m-addactionmethod-cf3e43a67fd9)
- [componentType()](#m-componenttype-59add484020d)
- [create(NanoServiceContext, NavuNode, NavuNode, Properties, Properties)](#m-create-45a9e9003e1d)
- [delete(NanoServiceContext, NavuNode, NavuNode, Properties, Properties)](#m-delete-4ba929210861)
- [getBackupObject()](#m-getbackupobject-a6fb23c24524)
- [getNanoServiceCallbackProxys(Object)](#m-getnanoservicecallbackproxys-774a1b856b31)
- [getServicePoint()](#m-getservicepoint-4b0d670b9506)
- [mask()](#m-mask-24c2fa29c6af)
- [servicepoint()](#m-servicepoint-33fbd1d46c70)
- [state()](#m-state-54117dea2388)

## Constructors

<a id="m-nanoservicecallbackproxy-97d281c4d63b"></a>
### NanoServiceCallbackProxy(Object, String, String, String)

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

<a id="m-addactioncapability-1cb3659d509e"></a>
### addActionCapability(NanoServiceCBType)

```java
public void addActionCapability(com.tailf.dp.proto.NanoServiceCBType nanoServiceCBType)
```

Types: [NanoServiceCBType](../proto/NanoServiceCBType.md#cls-NanoServiceCBType)

Add action capability from annotated callType used to register
 capabilities on the server

**Parameters**

- `com.tailf.dp.proto.NanoServiceCBType nanoServiceCBType` - action type

<a id="m-addactionmethod-cf3e43a67fd9"></a>
### addActionMethod(String, Method)

```java
public void addActionMethod(String name, java.lang.reflect.Method method)
```

Add callback action method to proxy

**Parameters**

- `String name` - canonical action name
- `java.lang.reflect.Method method` - registered callback method

<a id="m-componenttype-59add484020d"></a>
### componentType()

```java
public String componentType()
```

<a id="m-create-45a9e9003e1d"></a>
### create(NanoServiceContext, NavuNode, NavuNode, Properties, Properties)

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

Types: [NanoServiceContext](../services/NanoServiceContext.md#cls-NanoServiceContext), [NavuNode](../../navu/NavuNode.md#cls-NavuNode), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.services.NanoServiceContext context`
- `com.tailf.navu.NavuNode service`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`
- `java.util.Properties componentProperties`

<a id="m-delete-4ba929210861"></a>
### delete(NanoServiceContext, NavuNode, NavuNode, Properties, Properties)

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

Types: [NanoServiceContext](../services/NanoServiceContext.md#cls-NanoServiceContext), [NavuNode](../../navu/NavuNode.md#cls-NavuNode), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `com.tailf.dp.services.NanoServiceContext context`
- `com.tailf.navu.NavuNode service`
- `com.tailf.navu.NavuNode root`
- `java.util.Properties opaque`
- `java.util.Properties componentProperties`

<a id="m-getbackupobject-a6fb23c24524"></a>
### getBackupObject()

```java
public Object getBackupObject()
```

Retrieve the callback POJO

**Returns:** Object registered callback object

<a id="m-getnanoservicecallbackproxys-774a1b856b31"></a>
### getNanoServiceCallbackProxys(Object)

```java
public static com.tailf.dp.annotations.NanoServiceCallbackProxy[] getNanoServiceCallbackProxys(
    Object obj
)
    throws com.tailf.dp.DpCallbackException
```

Types: [NanoServiceCallbackProxy](NanoServiceCallbackProxy.md#cls-NanoServiceCallbackProxy), [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

Get array of proxy objects from registered POJO callback. Used internally
 at callback registration

**Parameters**

- `Object obj` - registered Callback POJO

**Returns:** array of NanoServCallbackProxy

**Throws**

- `DpCallbackException`

<a id="m-getservicepoint-4b0d670b9506"></a>
### getServicePoint()

```java
public String getServicePoint()
```

Retrieve the callback servicepoint

**Returns:** servicepoint string

<a id="m-mask-24c2fa29c6af"></a>
### mask()

```java
public int mask()
```

<a id="m-servicepoint-33fbd1d46c70"></a>
### servicepoint()

```java
public String servicepoint()
```

<a id="m-state-54117dea2388"></a>
### state()

```java
public String state()
```
